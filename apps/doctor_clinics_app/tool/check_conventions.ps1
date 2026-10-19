<#
.SYNOPSIS
    Enforces the CLAUDE.md conventions that the Dart analyzer cannot express,
    for apps/doctor_clinics_app only.

.DESCRIPTION
    Scans lib/ (generated sources excluded) plus the translation assets:

      1. file-length   - >100 lines for logic files, >80 for UI widget files
                         (anything under widgets/ screens/ layouts/).
      2. translations  - assets/translations/en.json and ar.json must have
                         identical key sets.
      3. hex-colors    - Color(0x...) / raw Colors.<name> outside lib/core/theme/.
      4. magic-strings - status/type/role literals instead of DbConstants.
      5. set-state     - setState() (state belongs in a Cubit).
      6. debug-print   - print() / debugPrint() (use AppLogger).
      7. navigator-of  - Navigator.of(...) navigation (only popping is allowed).

    Opt a single line out with a trailing comment:  // convention-ok: <reason>

    Usage (from apps/doctor_clinics_app):
      powershell -ExecutionPolicy Bypass -File tool/check_conventions.ps1

    Exit code: 0 = clean, 1 = violations found.

    NOTE: keep this file ASCII-only. Windows PowerShell 5.1 reads .ps1 as ANSI,
    so non-ASCII characters corrupt the parser.
#>
param(
    [string]$Root
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$Root = (Resolve-Path $Root).Path.TrimEnd('\')

# --- Helpers ---------------------------------------------------------------

$violations = New-Object System.Collections.ArrayList

function Add-Violation {
    param([string]$Rule, [string]$Path, [int]$Line, [string]$Message)
    [void]$violations.Add([pscustomobject]@{
            Rule    = $Rule
            Path    = $Path
            Line    = $Line
            Message = $Message
        })
}

function Get-RelPath {
    param([string]$Path)
    return $Path.Replace($Root, '').TrimStart('\')
}

# Production Dart sources, generated code excluded.
$libDir = Join-Path $Root 'lib'
$files = @()
if (Test-Path $libDir) {
    $files = @(Get-ChildItem -Path $libDir -Recurse -Filter '*.dart' -File | Where-Object {
            $_.Name -notlike '*.g.dart' -and
            $_.Name -notlike '*.freezed.dart' -and
            $_.Name -notlike '*.mocks.dart'
        })
}

# CLAUDE.md section 4: 100 lines for Dart logic, 80 for UI widget files.
$uiPathPattern = '\\(widgets|screens|layouts)\\'

# CLAUDE.md section 5: lib/core/theme/ is the only place a literal colour may live.
$hexAllowPattern = '^lib\\core\\theme\\'

# CLAUDE.md section 4: status/type/role values - one source of truth (DbConstants).
$magicNames = @(
    'booked', 'arrived', 'waiting', 'in_consultation', 'done', 'cancelled',
    'no_show', 'walk_in', 'follow_up', 'scheduled', 'completed', 'pending',
    'partially_paid', 'paid', 'draft', 'finalized', 'admin', 'doctor',
    'secretary', 'cash', 'card', 'transfer', 'consultation', 'operation',
    'medicine', 'dosage', 'frequency', 'duration', 'instruction', 'a4', 'a5',
    'A4', 'A5'
)
$magicPattern = "'(" + ($magicNames -join '|') + ")'"
$magicAllowPattern = 'app_constants\.dart|db_constants\.dart'

function Test-Skippable {
    param([string]$Line)
    $t = $Line.Trim()
    return ($t.StartsWith('//') -or $t.StartsWith('*') -or $t.StartsWith('/*'))
}

# --- Rule 1 - file length --------------------------------------------------

foreach ($f in $files) {
    $rel = Get-RelPath $f.FullName
    $lineCount = @([System.IO.File]::ReadAllLines($f.FullName)).Count
    $limit = if ($rel -match $uiPathPattern) { 80 } else { 100 }
    if ($lineCount -gt $limit) {
        Add-Violation 'file-length' $rel 0 "$lineCount lines (limit $limit)"
    }
}

# --- Rule 2 - en/ar translation key parity ---------------------------------

function Get-FlatKeys {
    param($Node, [string]$Prefix = '')
    $keys = New-Object System.Collections.ArrayList
    if ($null -eq $Node) { return $keys }
    foreach ($p in $Node.PSObject.Properties) {
        $name = if ($Prefix) { "$Prefix.$($p.Name)" } else { $p.Name }
        $value = $p.Value
        if ($value -is [System.Management.Automation.PSCustomObject]) {
            foreach ($k in (Get-FlatKeys -Node $value -Prefix $name)) { [void]$keys.Add($k) }
        }
        else {
            [void]$keys.Add($name)
        }
    }
    return $keys
}

$translationsDir = Join-Path $Root 'assets\translations'
$enPath = Join-Path $translationsDir 'en.json'
$arPath = Join-Path $translationsDir 'ar.json'
if ((Test-Path $enPath) -and (Test-Path $arPath)) {
    $enKeys = Get-FlatKeys -Node (Get-Content $enPath -Raw | ConvertFrom-Json)
    $arKeys = Get-FlatKeys -Node (Get-Content $arPath -Raw | ConvertFrom-Json)

    foreach ($k in $enKeys) {
        if ($arKeys -notcontains $k) {
            Add-Violation 'translations' 'assets\translations\ar.json' 0 "missing key '$k' (present in en.json)"
        }
    }
    foreach ($k in $arKeys) {
        if ($enKeys -notcontains $k) {
            Add-Violation 'translations' 'assets\translations\en.json' 0 "missing key '$k' (present in ar.json)"
        }
    }
}

# --- Rules 3-7 - per-line source scans -------------------------------------

foreach ($f in $files) {
    $rel = Get-RelPath $f.FullName
    $lines = @([System.IO.File]::ReadAllLines($f.FullName))

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $lineNo = $i + 1
        if (Test-Skippable $line) { continue }
        if ($line -match '//\s*convention-ok') { continue }

        # Rule 3 - hardcoded colours (section 5).
        if ($rel -notmatch $hexAllowPattern) {
            if ($line -cmatch 'Color\(0x') {
                Add-Violation 'hex-colors' $rel $lineNo 'hardcoded hex colour - use the app palette / AppColors / BuildContext extensions'
            }
            elseif ($line -cmatch '\bColors\.(?!transparent)\w+') {
                Add-Violation 'hex-colors' $rel $lineNo 'raw Material colour - use AppColors / BuildContext extensions'
            }
        }

        # Rule 4 - magic status/type/role strings (section 4 "Don't").
        if ($rel -notmatch $magicAllowPattern) {
            if ($line -cmatch $magicPattern) {
                Add-Violation 'magic-strings' $rel $lineNo "literal $($Matches[0]) - use a DbConstants/AppConstants value"
            }
        }

        # Rule 5 - no setState() (section 4).
        if ($line -cmatch 'setState\(') {
            Add-Violation 'set-state' $rel $lineNo 'setState() - state belongs in a Cubit'
        }

        # Rule 6 - no raw printing (section 4, avoid_print).
        if ($line -cmatch '\bprint\(|debugPrint\(') {
            Add-Violation 'debug-print' $rel $lineNo 'print/debugPrint - use AppLogger'
        }

        # Rule 7 - never navigate with Navigator.of (Golden rule 4).
        if ($line -cmatch 'Navigator\.of\(' -and $line -notmatch '\.pop\(') {
            Add-Violation 'navigator-of' $rel $lineNo 'Navigator.of() - use context.go()/context.push()'
        }
    }
}

# --- Report ----------------------------------------------------------------

if ($violations.Count -eq 0) {
    Write-Host "check-conventions: OK - scanned $($files.Count) Dart files, no CLAUDE.md violations." -ForegroundColor Green
    exit 0
}

Write-Host "check-conventions: $($violations.Count) CLAUDE.md violation(s) in $($files.Count) files." -ForegroundColor Red
foreach ($group in ($violations | Group-Object Rule | Sort-Object Name)) {
    Write-Host ''
    Write-Host "-- $($group.Name) ($($group.Count)) --" -ForegroundColor Yellow
    foreach ($v in ($group.Group | Sort-Object Path, Line)) {
        if ($v.Line -gt 0) {
            Write-Host ("  {0}:{1}  {2}" -f $v.Path, $v.Line, $v.Message)
        }
        else {
            Write-Host ("  {0}  {1}" -f $v.Path, $v.Message)
        }
    }
}
exit 1
