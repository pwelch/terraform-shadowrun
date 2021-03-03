<powershell>
# setup-aws.ps1
# Syntax Test: Get-Command -syntax './setup-aws.ps1'

Write-Output "setup-aws.ps1 starting... `n"

function Install-Chummer {
  $url    = "https://github.com/chummer5a/chummer5a/releases/download/5.213.0/Chummer5.213.0.zip"
  $output = "C:\Users\Administrator\Desktop\Chummer5.213.0.zip"

  if ((Test-Path $output) -eq $True) {
    Write-Output "Chummer5 already downloaded. Moving on... `n"
  } else {
    Invoke-WebRequest -Uri $url -OutFile $output
  }

  if ((Test-Path C:\Users\vagrant\Desktop\Chummer5) -eq $False) {
    Expand-Archive $output -DestinationPath C:\Users\Administrator\Desktop\Chummer5
  }
}

function Install-Choco {
  # Install Chocolatey
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  # Globally Auto confirm every action
  choco feature enable -n allowGlobalConfirmation
}

function Install-Packages {
  $chocoPackages = @('googlechrome', 'notepadplusplus.install')

  foreach ($pkg in $chocoPackages) {
    Write-Output "Installing choco package: $pkg `n"
    choco install $pkg --yes
  }
}

Install-Chummer
Install-Choco
Install-Packages

Write-Output "setup.ps1 finished `n"

</powershell>
<persist>true</persist>
