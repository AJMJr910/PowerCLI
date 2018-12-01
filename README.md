# PowerCLI
Various PowerCLI scripts that I've written. 

Update-VMTools.ps1 - Power CLI script that goes and updates VMware Tools on all powered on VMs.

Update-VMTools-All-Win-VMs.ps1 - PowerCLI script that prompts for the vCenter instance you want to connect to, prompts for credentials, and then pulls a list of VMs and then based on OS titles that contain "Microsoft" it will update VMware Tools if the VM is powered on. 
