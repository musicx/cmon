param(
    [Parameter(Position = 0)]
    [ValidateSet("install", "uninstall", "status")]
    [string]$Command,

    [string]$CodexHome,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsRoot = Join-Path $RepoRoot "skills"
$MarkerFile = ".cmon-wrapper.json"
$VendorName = "cmon"

if (-not $CodexHome) {
    if ($env:CODEX_HOME) {
        $CodexHome = $env:CODEX_HOME
    }
    else {
        $CodexHome = Join-Path $HOME ".codex"
    }
}

$CodexHome = [System.IO.Path]::GetFullPath($CodexHome)

function Get-SkillDirectories {
    Get-ChildItem -LiteralPath $SkillsRoot -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    } | Sort-Object Name
}

function Parse-Frontmatter {
    param(
        [string]$SkillPath
    )

    $text = Get-Content -LiteralPath $SkillPath -Raw -Encoding UTF8

    if (-not $text.StartsWith("---`n") -and -not $text.StartsWith("---`r`n")) {
        throw "$SkillPath is missing YAML frontmatter"
    }

    $nameMatch = [regex]::Match($text, '(?m)^name:\s*(.+)$')
    $descriptionMatch = [regex]::Match($text, '(?m)^description:\s*"?(.+?)"?$')

    if (-not $nameMatch.Success -or -not $descriptionMatch.Success) {
        throw "$SkillPath is missing name or description in frontmatter"
    }

    return @{
        Name = $nameMatch.Groups[1].Value.Trim()
        Description = $descriptionMatch.Groups[1].Value.Trim()
    }
}

function Get-WrapperDirName {
    param(
        [System.IO.DirectoryInfo]$SkillDir
    )

    return "cmon-$($SkillDir.Name)"
}

function New-WrapperBody {
    param(
        [string]$SkillName,
        [string]$Description,
        [string]$SourceSkillPath,
        [string]$VendorRepoPath
    )

@"
---
name: $SkillName
description: $Description
---

# $SkillName

This is a local wrapper skill installed from the live `cmon` repository.

Canonical source:

- `$SourceSkillPath`

Canonical repo root:

- `$VendorRepoPath`

Use this wrapper as follows:

1. Read the canonical source file above before doing anything else.
2. Resolve any `skills/`, `agents/`, `templates/`, and `docs/` paths relative to the canonical repo root above, not this wrapper directory.
3. Follow the canonical source instructions as the real skill contract.

This wrapper exists so `cmon` can be updated in place through one repo link instead of repeated uninstall and reinstall cycles.
"@
}

function Ensure-VendorLink {
    param(
        [string]$VendorRepoPath,
        [switch]$ForceReplace
    )

    $vendorParent = Split-Path -Parent $VendorRepoPath
    New-Item -ItemType Directory -Force -Path $vendorParent | Out-Null

    if (Test-Path -LiteralPath $VendorRepoPath) {
        $item = Get-Item -LiteralPath $VendorRepoPath -Force
        $currentTarget = $null

        if ($item.PSObject.Properties.Name -contains "Target") {
            $currentTarget = $item.Target
            if ($currentTarget -is [array]) {
                $currentTarget = $currentTarget[0]
            }
        }

        if ($currentTarget) {
            try {
                $resolvedTarget = [System.IO.Path]::GetFullPath($currentTarget)
                if ($resolvedTarget -eq $RepoRoot) {
                    return
                }
            }
            catch {
            }
        }

        if (-not $ForceReplace) {
            throw "Vendor path $VendorRepoPath already exists. Use -Force to replace it."
        }

        Remove-Item -LiteralPath $VendorRepoPath -Recurse -Force
    }

    New-Item -ItemType Junction -Path $VendorRepoPath -Target $RepoRoot | Out-Null
}

function Ensure-Wrapper {
    param(
        [System.IO.DirectoryInfo]$SkillDir,
        [string]$InstallRoot,
        [string]$VendorRepoPath,
        [switch]$ForceReplace
    )

    $frontmatter = Parse-Frontmatter -SkillPath (Join-Path $SkillDir.FullName "SKILL.md")
    $wrapperDir = Join-Path $InstallRoot (Get-WrapperDirName -SkillDir $SkillDir)
    $sourceSkillPath = Join-Path (Join-Path $VendorRepoPath "skills") (Join-Path $SkillDir.Name "SKILL.md")

    if (Test-Path -LiteralPath $wrapperDir) {
        $markerPath = Join-Path $wrapperDir $MarkerFile

        if (-not (Test-Path -LiteralPath $markerPath)) {
            if (-not $ForceReplace) {
                throw "Wrapper destination $wrapperDir already exists and is not managed by cmon. Use -Force to replace it."
            }
            Remove-Item -LiteralPath $wrapperDir -Recurse -Force
        }
        else {
            $marker = Get-Content -LiteralPath $markerPath -Raw -Encoding UTF8 | ConvertFrom-Json
            if ($marker.repo_root -ne $RepoRoot -and -not $ForceReplace) {
                throw "Wrapper destination $wrapperDir belongs to another repo root. Use -Force to replace it."
            }
            Remove-Item -LiteralPath $wrapperDir -Recurse -Force
        }
    }

    New-Item -ItemType Directory -Force -Path $wrapperDir | Out-Null

    $skillBody = New-WrapperBody `
        -SkillName $frontmatter.Name `
        -Description $frontmatter.Description `
        -SourceSkillPath $sourceSkillPath `
        -VendorRepoPath $VendorRepoPath

    Set-Content -LiteralPath (Join-Path $wrapperDir "SKILL.md") -Value $skillBody -Encoding UTF8

    $markerPayload = @{
        managed_by = "cmon"
        repo_root = $RepoRoot
        source_skill_dir = $SkillDir.FullName
        skill_name = $frontmatter.Name
    } | ConvertTo-Json -Depth 3

    Set-Content -LiteralPath (Join-Path $wrapperDir $MarkerFile) -Value ($markerPayload + "`n") -Encoding UTF8
}

function Install-CmonSkills {
    param(
        [string]$CodexHomePath,
        [switch]$ForceReplace
    )

    $installRoot = Join-Path $CodexHomePath "skills"
    $vendorRepoPath = Join-Path (Join-Path $CodexHomePath "vendor_imports") $VendorName

    New-Item -ItemType Directory -Force -Path $installRoot | Out-Null
    Ensure-VendorLink -VendorRepoPath $vendorRepoPath -ForceReplace:$ForceReplace

    $skills = Get-SkillDirectories
    foreach ($skillDir in $skills) {
        Ensure-Wrapper -SkillDir $skillDir -InstallRoot $installRoot -VendorRepoPath $vendorRepoPath -ForceReplace:$ForceReplace
    }

    Write-Output "Installed $($skills.Count) cmon skill wrappers into $installRoot"
    Write-Output "Vendor link: $vendorRepoPath -> $RepoRoot"
    Write-Output "Restart Codex to pick up new or updated skills."
}

function Uninstall-CmonSkills {
    param(
        [string]$CodexHomePath
    )

    $installRoot = Join-Path $CodexHomePath "skills"
    $vendorRepoPath = Join-Path (Join-Path $CodexHomePath "vendor_imports") $VendorName
    $removed = 0

    foreach ($skillDir in Get-SkillDirectories) {
        $wrapperDir = Join-Path $installRoot (Get-WrapperDirName -SkillDir $skillDir)
        $markerPath = Join-Path $wrapperDir $MarkerFile

        if ((Test-Path -LiteralPath $wrapperDir) -and (Test-Path -LiteralPath $markerPath)) {
            $marker = Get-Content -LiteralPath $markerPath -Raw -Encoding UTF8 | ConvertFrom-Json
            if ($marker.repo_root -eq $RepoRoot) {
                Remove-Item -LiteralPath $wrapperDir -Recurse -Force
                $removed += 1
            }
        }
    }

    if (Test-Path -LiteralPath $vendorRepoPath) {
        $item = Get-Item -LiteralPath $vendorRepoPath -Force
        $target = $null
        if ($item.PSObject.Properties.Name -contains "Target") {
            $target = $item.Target
            if ($target -is [array]) {
                $target = $target[0]
            }
        }

        if (-not $target -or [System.IO.Path]::GetFullPath($target) -eq $RepoRoot) {
            Remove-Item -LiteralPath $vendorRepoPath -Recurse -Force
        }
    }

    Write-Output "Removed $removed cmon skill wrappers from $installRoot"
}

function Show-Status {
    param(
        [string]$CodexHomePath
    )

    $installRoot = Join-Path $CodexHomePath "skills"
    $vendorRepoPath = Join-Path (Join-Path $CodexHomePath "vendor_imports") $VendorName

    Write-Output "Repo root: $RepoRoot"
    Write-Output "Codex home: $CodexHomePath"
    Write-Output "Vendor link: $vendorRepoPath"

    if (Test-Path -LiteralPath $vendorRepoPath) {
        $item = Get-Item -LiteralPath $vendorRepoPath -Force
        $target = $null
        if ($item.PSObject.Properties.Name -contains "Target") {
            $target = $item.Target
            if ($target -is [array]) {
                $target = $target[0]
            }
        }

        if ($target) {
            Write-Output "  status: linked -> $target"
        }
        else {
            Write-Output "  status: exists"
        }
    }
    else {
        Write-Output "  status: missing"
    }

    Write-Output "Wrappers:"
    foreach ($skillDir in Get-SkillDirectories) {
        $wrapperDir = Join-Path $installRoot (Get-WrapperDirName -SkillDir $skillDir)
        $markerPath = Join-Path $wrapperDir $MarkerFile

        if ((Test-Path -LiteralPath $wrapperDir) -and (Test-Path -LiteralPath $markerPath)) {
            $marker = Get-Content -LiteralPath $markerPath -Raw -Encoding UTF8 | ConvertFrom-Json
            Write-Output "  - $(Split-Path -Leaf $wrapperDir): installed ($($marker.skill_name))"
        }
        elseif (Test-Path -LiteralPath $wrapperDir) {
            Write-Output "  - $(Split-Path -Leaf $wrapperDir): exists but is not cmon-managed"
        }
        else {
            Write-Output "  - $(Split-Path -Leaf $wrapperDir): missing"
        }
    }
}

switch ($Command) {
    "install" { Install-CmonSkills -CodexHomePath $CodexHome -ForceReplace:$Force }
    "uninstall" { Uninstall-CmonSkills -CodexHomePath $CodexHome }
    "status" { Show-Status -CodexHomePath $CodexHome }
    default { throw "Unsupported command: $Command" }
}
