# One-command check after a change to hovercraft_parts.scad.
#
#   powershell -ExecutionPolicy Bypass -File tools\verify.ps1                 # fast: lists + asserts, seconds
#   powershell -ExecutionPolicy Bypass -File tools\verify.ps1 -Stl deck_fl,wear_pad
#   powershell -ExecutionPolicy Bypass -File tools\verify.ps1 -Stl all         # every exported part, minutes
#
# Fast pass:
#   1. node tools\check_parts.js: the seven hand-kept part lists agree.
#   2. PART = "assembly" evaluated to an .echo file: prints the RULE / FIT /
#      DUCT lines and fails on any assert, ERROR or WARNING.
#   3. every dispatched part evaluated the same way (asserts inside the part
#      modules fire at evaluation, no geometry needed, so this is quick).
# -Stl renders the named parts to throwaway STLs (nothing in stl\ changes)
# and checks what a preview cannot show: the mesh is manifold, the part fits
# the P1S bed, and it sits on the bed at Z = 0 (every part is drawn in its
# print orientation).  Export the real STLs with export_stl.ps1 afterwards.

param([string[]] $Stl = @())

$Stl  = @($Stl | ForEach-Object { $_ -split "," } | Where-Object { $_ })   # "-Stl a,b" via -File arrives as one string
$root = Split-Path $PSScriptRoot -Parent
$exe  = "$env:LOCALAPPDATA\Programs\OpenSCAD-Nightly\openscad.com"
if (-not (Test-Path $exe)) { $exe = (Get-Command openscad -ErrorAction SilentlyContinue).Source }
if (-not $exe) { Write-Error "OpenSCAD not found"; exit 1 }

$tmp  = Join-Path $env:TEMP "hovercraft_verify"
New-Item -ItemType Directory -Force $tmp | Out-Null
$failed = @()

# Runs one PART through OpenSCAD.  Returns the console log, or $null on failure.
function Invoke-Part([string] $part, [string] $outFile, [string[]] $extra = @()) {
    $wrap = Join-Path $root "_verify_$part.scad"     # MCP and include paths want it in the repo; _*.scad is gitignored
    "include <hovercraft_parts.scad>`nPART = `"$part`";" | Set-Content -Encoding ascii $wrap
    $log = & $exe -o $outFile @extra $wrap 2>&1 | Out-String
    $code = $LASTEXITCODE
    Remove-Item $wrap -ErrorAction SilentlyContinue
    # -cmatch: the nightly's harmless "Fontconfig error" must not count as ERROR
    if ($code -ne 0 -or $log -cmatch "ERROR|WARNING|not.*manifold|Assertion") {
        Write-Warning "$part`n$log"; return $null
    }
    return $log
}

# ---- 1. part lists
Write-Host "== part lists" -ForegroundColor Cyan
Push-Location $root
node tools\check_parts.js
if ($LASTEXITCODE -ne 0) { $failed += "part lists" }
Pop-Location

# ---- 2. assembly rule checks
Write-Host "== assembly (rule checks)" -ForegroundColor Cyan
$log = Invoke-Part "assembly" (Join-Path $tmp "assembly.echo")
if ($null -eq $log) { $failed += "assembly" }
else {
    Get-Content (Join-Path $tmp "assembly.echo") | Where-Object { $_ -match "RULE|FIT|DUCT" } |
        ForEach-Object { $_ -replace '^ECHO: "?', '' -replace '"$', '' }
}

# ---- 3. every dispatched part, evaluation only
Write-Host "== asserts in every part" -ForegroundColor Cyan
$scad = Get-Content (Join-Path $root "hovercraft_parts.scad") -Raw
$all = [regex]::Matches($scad, 'PART\s*==\s*"([a-z0-9_]+)"') | ForEach-Object { $_.Groups[1].Value } |
       Where-Object { $_ -ne "assembly" } | Select-Object -Unique
foreach ($p in $all) {
    if ($null -eq (Invoke-Part $p (Join-Path $tmp "$p.echo"))) { $failed += $p }
}
Write-Host ("{0} parts evaluated" -f @($all).Count)

# ---- 4. optional full renders
if ($Stl.Count) {
    if ($Stl -contains "all") {
        $exp = Get-Content (Join-Path $root "export_stl.ps1") -Raw
        $block = [regex]::Match($exp, '(?ms)^\$parts\s*=(.*?)\r?\n\r?\n').Groups[1].Value
        $Stl = [regex]::Matches($block, '"([a-z0-9_]+)"') | ForEach-Object { $_.Groups[1].Value }
    }
    Write-Host "== full renders" -ForegroundColor Cyan
    $files = @()
    foreach ($p in $Stl) {
        $file = Join-Path $tmp "$p.stl"
        if ($null -eq (Invoke-Part $p $file)) { $failed += "$p (render)" } else { $files += $file }
    }
    # bed size, Z = 0 and manifold edges are checked in tools\mesh_check.js
    if ($files) { node (Join-Path $PSScriptRoot "mesh_check.js") @files; if ($LASTEXITCODE -ne 0) { $failed += "mesh check" } }
}

if ($failed) { Write-Host ("FAILED: " + ($failed -join ", ")) -ForegroundColor Red; exit 1 }
Write-Host "all checks passed" -ForegroundColor Green
