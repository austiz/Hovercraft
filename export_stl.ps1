# Exports every printable part in hovercraft_parts.scad to the stl\ folder.
# Run from this folder:   powershell -ExecutionPolicy Bypass -File export_stl.ps1

$out = Join-Path $PSScriptRoot "stl"

# openscad.com is the console build: it waits for the render and returns an
# exit code.  openscad.exe returns immediately, so it is only a fallback.
$exe = $null
foreach ($p in "C:\Program Files\OpenSCAD\openscad.com",
               "C:\Program Files\OpenSCAD (Nightly)\openscad.com",
               "C:\Program Files (x86)\OpenSCAD\openscad.com") {
    if (Test-Path $p) { $exe = $p; break }
}
if (-not $exe) { $exe = (Get-Command openscad -ErrorAction SilentlyContinue).Source }
if (-not $exe) { Write-Error "OpenSCAD not found. Install it from https://openscad.org"; exit 1 }

New-Item -ItemType Directory -Force $out | Out-Null

$parts = "fan_tube", "fan_cage", "fan_cage_hs390", "fan_guard", "nozzle",
         "plates", "plate_zero", "plate_test", "plate_rack",
         "nickel_tray", "coin_bin", "stick_stand", "switch_bracket", "templates"

# Windows PowerShell mangles quotes inside native arguments, so instead of
# -D PART="..." each part gets a one-line wrapper (the last assignment wins).
$failed = @()
foreach ($part in $parts) {
    $file = Join-Path $out "$part.stl"
    $wrap = Join-Path $PSScriptRoot "_export_$part.scad"
    Write-Host "Rendering $part ..."
    "include <hovercraft_parts.scad>`nPART = `"$part`";" | Set-Content -Encoding ascii $wrap
    $log = & $exe -o $file $wrap 2>&1 | Out-String
    $bad = ($LASTEXITCODE -ne 0) -or ($log -match "ERROR|WARNING|not.*manifold")
    Remove-Item $wrap -ErrorAction SilentlyContinue
    if ($bad) { Write-Warning "$part`n$log"; $failed += $part }
}
if ($failed) { Write-Warning ("Problems with: " + ($failed -join ", ")) }

# the press-fit (v1) nozzle set, for comparison, into stl\v1\
$v1 = Join-Path $out "v1"
New-Item -ItemType Directory -Force $v1 | Out-Null
foreach ($part in "nozzle", "plates", "plate_zero", "plate_test", "plate_rack") {
    $file = Join-Path $v1 "$part.stl"
    $wrap = Join-Path $PSScriptRoot "_export_v1_$part.scad"
    Write-Host "Rendering v1 $part ..."
    "include <hovercraft_parts.scad>`nNOZZLE_V = 1;`nPART = `"$part`";" | Set-Content -Encoding ascii $wrap
    $log = & $exe -o $file $wrap 2>&1 | Out-String
    $bad = ($LASTEXITCODE -ne 0) -or ($log -match "ERROR|WARNING|not.*manifold")
    Remove-Item $wrap -ErrorAction SilentlyContinue
    if ($bad) { Write-Warning "v1 $part`n$log"; $failed += "v1/$part" }
}

# the whole craft as one model, for looking at, not printing
Write-Host "Rendering mockup_assembly (view only) ..."
$wrap = Join-Path $PSScriptRoot "_export_mockup.scad"
"include <hovercraft_parts.scad>`nPART = `"mockup`";" | Set-Content -Encoding ascii $wrap
& $exe -o (Join-Path $out "mockup_assembly.stl") $wrap 2>&1 | Out-Null
Remove-Item $wrap -ErrorAction SilentlyContinue

Write-Host "Done. STLs are in $out  (print nickel_tray twice; mockup_assembly is view-only)"
