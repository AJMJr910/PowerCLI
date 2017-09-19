#Get the name of the vCenter Server
$vcenter = Read-Host "Enter the name of your vCenter Server"

#Connect to the vCenter Server - Assuming the script is running under credentials that can connect
Connect-VIServer $vcenter

#Get a list of the virtualmachines that are Powered On
$virtualmachines = Get-VM | Where-Object PowerState -eq "PoweredOn" | Select-Object -ExpandProperty Name

#Get Only the Windows VMs
ForEach ($vm in $virtualmachines){
    #If the VM is a Windows VM...
    If (Get-VMGuest $vm | where-object OSFullName -like "Microsoft*"){
        #Update VMware Tools but don't reboot the machine
        Write-Host "Updating VMware tools on $vm"
        Update-Tools $vm -NoReboot
    }
    #If there is no OSFullName detected
    ElseIf(Get-VMGuest $vm | Where-Object OSFullName -eq $null){
    Write-Host "VMware Tools doesn't appear to be installed on $vm"
    }
    #If it's not a Windows VM then automatic update is not supported
    else {
    Write-Host "$vm is not a Windows VM and automatic Update is not supported"
    }
}