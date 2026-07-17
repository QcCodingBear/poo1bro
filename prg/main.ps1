$ErrorActionPreference = 'Continue'
$dossierProgramme = Split-Path -Parent $PSScriptRoot
Set-Location $dossierProgramme

# Recupere uniquement les missions que Doc T a deja publiees pour Young Bro.
if ((Get-Command git -ErrorAction SilentlyContinue) -and (Test-Path '.git' -PathType Container)) {
    git pull --ff-only
    if ($LASTEXITCODE -ne 0) {
        Add-Type -AssemblyName PresentationFramework
        [System.Windows.MessageBox]::Show(
            "La mise a jour distante n'a pas fonctionne. La derniere version deja presente va etre ouverte.",
            'Mise a jour indisponible',
            0,
            48
        ) | Out-Null
    }
}

$notes = Join-Path $PSScriptRoot 'data.html'
if (Test-Path -LiteralPath $notes -PathType Leaf) {
    Start-Process $notes
}
else {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show(
        "Le fichier des notes est introuvable.",
        'Erreur',
        0,
        16
    ) | Out-Null
}
