# Slices every printable part for a Bambu Lab P1S (0.4 nozzle) with
# Bambu PLA Basic at 0.28 mm layers, applying the per-part settings from
# PRINT_SETTINGS.md.  Output: sliced\<part>.3mf (open in Bambu Studio or
# send from Bambu Handy; each contains its plate_1.gcode).
#
#   powershell -ExecutionPolicy Bypass -File slice_all.ps1 [-Only part1,part2] [-BedType "Cool Plate"]
#
# Needs: Bambu Studio installed, node.exe on the PATH, the STLs already
# exported by export_stl.ps1.

param(
    [string[]] $Only = @(),
    [string] $BedType = "Textured PEI Plate",
    [string] $Machine  = "Bambu Lab P1S 0.4 nozzle",
    [string] $Process  = "0.28mm Extra Draft @BBL X1C",     # X1C profiles are the P1S defaults
    [string] $Filament = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
)

$Only = @($Only | ForEach-Object { $_ -split "," } | Where-Object { $_ })   # "-Only a,b" via -File arrives as one string
$exe = "C:\Program Files\Bambu Studio\bambu-studio.exe"
if (-not (Test-Path $exe)) { Write-Error "Bambu Studio not found at $exe"; exit 1 }
$root    = $PSScriptRoot
$presets = Join-Path $root "sliced\presets"
$out     = Join-Path $root "sliced"
New-Item -ItemType Directory -Force $presets | Out-Null

# ---- per-part process overrides.  Keys are Bambu Studio setting names.
$common = @{ }
# printed deck: quarters print as installed, duct up, with the integral
# 2.4 mm duct wall — 3 walls so it slices as solid perimeters.  No brim:
# MANDATORY — a brim would web the guard grid openings and the breakaway
# support rings (the lip ridge is the built-in adhesion foot anyway).
# Thick bridges: the whole skin and the socket floors are bridges now.
# NO auto support: the grid prints on its own modeled breakaway rings.
$deck = @{ wall_loops = "3"; sparse_infill_density = "15%"; brim_type = "no_brim"; initial_layer_print_height = "0.2"; thick_bridges = "1"; enable_support = "0" }
$parts = [ordered]@{
    # part            = @{ stl = <path under stl\>;  copies; overrides }
    # (fan_tube / fan_guard removed: built into the deck quarters now)
    fan_cage       = @{ stl = "fan_cage.stl";        copies = 1; o = @{ wall_loops = "4"; sparse_infill_density = "40%"; brim_type = "outer_only"; brim_width = "4" } }
    # only if you fly the HS390: the same cage, hub drilled for its motor
    fan_cage_hs390 = @{ stl = "fan_cage_hs390.stl";  copies = 1; o = @{ wall_loops = "4"; sparse_infill_density = "40%"; brim_type = "outer_only"; brim_width = "4" } }
    nozzle       = @{ stl = "nozzle.stl";          copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%"; enable_support = "0" } }
    # 100% infill: leave the pattern alone, the slicer makes it solid anyway
    plates         = @{ stl = "plates.stl";          copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    plate_test     = @{ stl = "plate_test.stl";      copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    plate_zero     = @{ stl = "plate_zero.stl";      copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    plate_rack     = @{ stl = "plate_rack.stl";      copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
    rack_aux       = @{ stl = "rack_aux.stl";        copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
    # two chart plates: rule 2a, the calibration chart must be in impound - one
    # rides the box, one is the backup.  Solid, so a drop can't crack a corner.
    chart_plate    = @{ stl = "chart_plate.stl";     copies = 2; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    nickel_tray    = @{ stl = "nickel_tray.stl";     copies = 2; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }
    # bars print on their side: layers run through the snap legs, so the
    # flex loads the plastic in-plane.  Two trays + one spare.
    tray_bar       = @{ stl = "tray_bar.stl";        copies = 3; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }
    coin_bin       = @{ stl = "coin_bin.stl";        copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }
    bin_lid        = @{ stl = "bin_lid.stl";         copies = 2; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }   # one + a spare
    stick_stand    = @{ stl = "stick_stand.stl";     copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "20%" } }
    switch_bracket = @{ stl = "switch_bracket.stl";  copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }
    templates      = @{ stl = "templates.stl";       copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
    # four: pads abrade on plywood tracks, spares go in the impound box
    wear_pad       = @{ stl = "wear_pad.stl";        copies = 4; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }   # 2 layers: all skin anyway
    # battery mounts: elephant-foot comp matters, the snap-arm walls are
    # only three extrusion lines thick and start at the bed
    aa4_mount      = @{ stl = "aa4_mount.stl";       copies = 2; o = @{ wall_loops = "3"; sparse_infill_density = "15%"; elefant_foot_compensation = "0.15" } }
    aa2_tray       = @{ stl = "aa2_tray.stl";        copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%"; elefant_foot_compensation = "0.15" } }
    aa2_fences     = @{ stl = "aa2_fences.stl";      copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%" } }
    wire_clips     = @{ stl = "wire_clips.stl";      copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
    # printed deck quarters (optional, replaces the foam board).  Print the
    # fit test first and press the real parts into it.
    deck_fit_test  = @{ stl = "deck_fit_test.stl"; copies = 1; o = $deck }
    deck_fl        = @{ stl = "deck_fl.stl";      copies = 1; o = $deck }
    deck_fr        = @{ stl = "deck_fr.stl";      copies = 1; o = $deck }
    deck_bl        = @{ stl = "deck_bl.stl";      copies = 1; o = $deck }
    deck_br        = @{ stl = "deck_br.stl";      copies = 1; o = $deck }
    # the press-fit v1 nozzle set, for the comparison (needs supports everywhere)
    v1_nozzle      = @{ stl = "v1\nozzle.stl";       copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "15%"; enable_support = "1"; support_type = "normal(auto)"; support_on_build_plate_only = "0"; support_threshold_angle = "40" } }
    v1_plates      = @{ stl = "v1\plates.stl";       copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    v1_plate_test  = @{ stl = "v1\plate_test.stl";   copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    v1_plate_zero  = @{ stl = "v1\plate_zero.stl";   copies = 1; o = @{ wall_loops = "3"; sparse_infill_density = "100%"; sparse_infill_pattern = "zig-zag" } }
    v1_plate_rack  = @{ stl = "v1\plate_rack.stl";   copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
    v1_rack_aux    = @{ stl = "v1\rack_aux.stl";     copies = 1; o = @{ wall_loops = "2"; sparse_infill_density = "15%" } }
}

# ---- flatten the machine and filament presets once
$flat = Join-Path $root "tools\flatten_preset.js"
$mach = Join-Path $presets "machine.json"
$fila = Join-Path $presets "filament.json"
& node $flat machine  $Machine  $mach system
& node $flat filament $Filament $fila system
if ($LASTEXITCODE -ne 0) { Write-Error "preset flattening failed"; exit 1 }

$results = @()
foreach ($name in $parts.Keys) {
    if ($Only.Count -gt 0 -and $Only -notcontains $name) { continue }
    $p    = $parts[$name]
    $stl  = Join-Path $root ("stl\" + $p.stl)
    if (-not (Test-Path $stl)) { Write-Warning "$name`: $stl missing (run export_stl.ps1)"; continue }
    $proc = Join-Path $presets "process_$name.json"
    $ovf  = Join-Path $presets "overrides_$name.json"
    $ov   = $p.o.Clone(); $ov["name"] = "hover $name 0.28"
    ConvertTo-Json $ov | Set-Content -Encoding ascii $ovf
    & node $flat process $Process $proc User $ovf
    if (-not (Test-Path $proc)) { Write-Host "  FAILED: process preset not written"; continue }

    $dir  = Join-Path $out "_$name"
    if (Test-Path $dir) { Remove-Item $dir -Recurse -Force }
    New-Item -ItemType Directory -Force $dir | Out-Null
    $inputs = @(); for ($i = 0; $i -lt $p.copies; $i++) { $inputs += "`"$stl`"" }
    # --arrange 1 always: the STLs are centred on the origin, so without it
    # the slicer sees an object hanging off the plate
    $args = @("--debug", "1",
              "--load-settings", "`"$mach;$proc`"",
              "--load-filaments", "`"$fila`"",
              "--curr-bed-type", "`"$BedType`"",
              "--arrange", "1", "--slice", "0",
              "--export-3mf", "$name.3mf", "--outputdir", "`"$dir`"") + $inputs
    Write-Host ("Slicing {0,-15}" -f $name) -NoNewline
    $run = Start-Process -FilePath $exe -ArgumentList $args -Wait -PassThru -NoNewWindow `
            -RedirectStandardOutput "$dir\out.txt" -RedirectStandardError "$dir\err.txt"
    $r = Get-Content "$dir\result.json" -Raw | ConvertFrom-Json
    if ($run.ExitCode -ne 0 -or -not (Test-Path "$dir\plate_1.gcode")) {
        Write-Host "  FAILED: $($r.error_string)"
        $results += [pscustomobject]@{ part = $name; status = "FAILED: " + $r.error_string }
        continue
    }
    $g = Get-Content "$dir\plate_1.gcode" -TotalCount 40
    $time = ($g | Select-String 'total estimated time: (.+)$').Matches[0].Groups[1].Value
    $gram = ($g | Select-String 'total filament weight \[g\] : (.+)$').Matches[0].Groups[1].Value
    Move-Item "$dir\$name.3mf" (Join-Path $out "$name.3mf") -Force
    Remove-Item $dir -Recurse -Force
    Write-Host ("  {0,10}  {1,6} g" -f $time, $gram)
    $results += [pscustomobject]@{ part = $name; copies = $p.copies; time = $time; grams = $gram; status = "ok" }
}
$results | Format-Table -AutoSize | Out-String | Write-Host
$results | ConvertTo-Json | Set-Content (Join-Path $out "summary.json")
Write-Host "3MF files are in $out"
