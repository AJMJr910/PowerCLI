#Check to see if the .NET Framework is already installed
If (Get-WindowsCapability -Online | Where-Object Name -eq "NetFx3~~~~" | Where-Object State -eq "NotPresent"){
    #If it's not installed then install it
    Add-WindowsCapability -Online -Name NetFx3~~~~ -Source "\\US2K12MDT\sources\sxs" 
}
else {
   #Otherwise its probably already installed
   Write-Host "The .Net Framework 3.5 is already installed"
   
}