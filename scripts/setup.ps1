# setup.ps1
# Syntax Test: Get-Command -syntax './setup.ps1'

Write-Output "setup.ps1 starting... `n"

function Install-Choco {
  if ((Test-Path "C:\ProgramData\Chocolatey") -eq $True) {
    Write-Output "Chocolatey already installed. Moving on... `n"
  }
  else {
    Write-Output "Chocolately not found. Installing... `n"
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
  }
}

function Install-Packages {
  $chocoPackages = @('googlechrome', 'notepadplusplus.install')

  foreach ($pkg in $chocoPackages) {
    Write-Output "Installing choco package: $pkg `n"
    choco install $pkg --yes
  }
}

function Install-Chummer {
  $url    = "https://github.com/chummer5a/chummer5a/releases/download/5.213.0/Chummer5.213.0.zip"
  $output = "C:\Users\vagrant\Desktop\Chummer5.213.0.zip"

  if ((Test-Path $output) -eq $True) {
    Write-Output "Chummer5 already downloaded. Moving on... `n"
  } else {
    Invoke-WebRequest -Uri $url -OutFile $output
  }

  if ((Test-Path C:\Users\vagrant\Desktop\Chummer5) -eq $False) {
    Expand-Archive $output -DestinationPath C:\Users\vagrant\Desktop\Chummer5
  }
}

function Set-Shortcut {
  param ( [string]$SourceLnk, [string]$DestinationPath )

  $WshShell = New-Object -comObject WScript.Shell
  $Shortcut = $WshShell.CreateShortcut($SourceLnk)
  $Shortcut.TargetPath = $DestinationPath
  $Shortcut.Save()
}

Install-Choco
Install-Packages
Install-Chummer

Set-Shortcut "C:\Users\vagrant\Desktop\vagrant.lnk" "C:\vagrant"

Write-Output "setup.ps1 finished `n"
