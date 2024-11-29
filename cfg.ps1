# List of machine names as defined in your Vagrantfile or VM names in your environment
$allVmNames = @("web1", "web2", "sql1", "sql2")  # Adjust the list to include all your VMs

# Path to the Bash scripts inside the shared folder
$connectScriptPath = "/vagrant/gluster_connect.sh"
$mountScriptPath = "/vagrant/gluster_mount.sh"
$mariadbSetup1ScriptPath = "/vagrant/mariadb_setup1.sh"  # Path to the mariadb setup script
$mariadbSetup2ScriptPath = "/vagrant/mariadb_setup2.sh"  # Path to the second mariadb setup script
$haproxySetup1ScriptPath = "/vagrant/haproxy_setup1.sh"  # Path to the haproxy1 setup script
$haproxySetup2ScriptPath = "/vagrant/haproxy_setup2.sh"  # Path to the haproxy2 setup script
$databaseConfigPath = "/vagrant/database_config.sh"      # Path to the Database Config file
$webSetup1Path = "/vagrant/web_setup1.sh"      # Path to the Database Config file


# Run both scripts on web1 (gluster_connect and gluster_mount)
$firstVm = $allVmNames[0]
Write-Host "Executing gluster_connect.sh and gluster_mount.sh on $firstVm"
vagrant ssh $firstVm -c "bash $connectScriptPath"
if ($?) {
    Write-Host "Successfully executed gluster_connect.sh on $firstVm."
} else {
    Write-Host "Error: gluster_connect.sh execution failed on $firstVm."
}

# Only run gluster_mount.sh on web1
vagrant ssh $firstVm -c "bash $mountScriptPath"
if ($?) {
    Write-Host "Successfully executed gluster_mount.sh on $firstVm."
} else {
    Write-Host "Error: gluster_mount.sh execution failed on $firstVm."
}

# Run only gluster_mount.sh on the remaining machines
$remainingVms = $allVmNames[1..($allVmNames.Length - 1)]  # All VMs except the first one
foreach ($vm in $remainingVms) {
    Write-Host "Executing gluster_mount.sh on $vm"
    vagrant ssh $vm -c "bash $mountScriptPath"
    if ($?) {
        Write-Host "Successfully executed gluster_mount.sh on $vm."
    } else {
        Write-Host "Error: gluster_mount.sh execution failed on $vm."
    }
}

# Run mariadb_setup2.sh on sql2
$sql2Vm = "sql2"
Write-Host "Executing mariadb_setup2.sh on $sql2Vm"
vagrant ssh $sql2Vm -c "bash $mariadbSetup2ScriptPath"
if ($?) {
    Write-Host "Successfully executed mariadb_setup2.sh on $sql2Vm."
} else {
    Write-Host "Error: mariadb_setup2.sh execution failed on $sql2Vm."
}

# Run mariadb_setup1.sh on sql1
$sql1VmConfig = "sql1"
Write-Host "Executing mariadb_setup1.sh on $sql1VmConfig"
vagrant ssh $sql1VmConfig -c "bash $mariadbSetup1ScriptPath"
if ($?) {
    Write-Host "Successfully executed mariadb_setup1.sh on $sql1Vm."
} else {
    Write-Host "Error: mariadb_setup1.sh execution failed on $sql1Vm."
}

# Run haproxy_setup1.sh on haproxy1
$haproxy1Vm = "haproxy1"
Write-Host "Executing haproxy_setup1.sh on $haproxy1Vm"
vagrant ssh $haproxy1Vm -c "bash $haproxySetup1ScriptPath"
if ($?) {
    Write-Host "Successfully executed haproxy_setup1.sh on $haproxy1Vm."
} else {
    Write-Host "Error: haproxy_setup1.sh execution failed on $haproxy1Vm."
}

# Run haproxy_setup2.sh on haproxy2
$haproxy2Vm = "haproxy2"
Write-Host "Executing haproxy_setup2.sh on $haproxy2Vm"
vagrant ssh $haproxy2Vm -c "bash $haproxySetup2ScriptPath"
if ($?) {
    Write-Host "Successfully executed haproxy_setup2.sh on $haproxy2Vm."
} else {
    Write-Host "Error: haproxy_setup2.sh execution failed on $haproxy2Vm."
}

# Run databaseConfig.sh on sql1
$sql1Vm = "sql1"
Write-Host "Executing databaseConfig.sh on $sql1Vm"
vagrant ssh $sql1Vm -c "bash $databaseConfigPath"
if ($?) {
    Write-Host "Successfully executed databaseConfig.sh on $sql1VmConfig."
} else {
    Write-Host "Error: databaseConfig.sh execution failed on $sql1VmConfig."
}

$webDeploys = @("web1", "web2")

foreach ($webDeploy in $webDeploys) {
    Write-Host "Executing web_setup1.sh on $webDeploy"
    vagrant ssh $webDeploy -c "bash $webSetup1Path"
    
    if ($?) {
        Write-Host "Successfully executed web_setup1.sh on $webDeploy."
    } else {
        Write-Host "Error: web_setup1.sh execution failed on $webDeploy."
    }
}
