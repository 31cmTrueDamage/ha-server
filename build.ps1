# Run Vagrant up
Write-Host "Running 'vagrant up'..."
$vagrantUp = Start-Process -FilePath "vagrant" -ArgumentList "up" -PassThru -Wait

# Check if Vagrant up was successful
if ($vagrantUp.ExitCode -eq 0) {
    Write-Host "'vagrant up' completed successfully. Now running 'build.ps1'..."
    
    # Run build.ps1
    $buildScript = ".\cfg.ps1"
    
    if (Test-Path $buildScript) {
        # Run the cfg.ps1 script
        & $buildScript
    } else {
        Write-Host "Error: cfg.ps1 not found in the current directory."
    }
} else {
    Write-Host "Error: 'vagrant up' failed with exit code $($vagrantUp.ExitCode)."
}
