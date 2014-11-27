# Cheatsheet Desired State Configuration

1. `PS C:\Scripts> InstallScript`
2. `Start-DscConfiguration -Wait -Verbose -Path .\InstallScript`

**Basic template**
```
Configuration InstallScript
{
   # A Configuration block can have zero or more Node blocks
   Node "Server001"
   {
      # Next, specify one or more resource blocks
   }
} 
```

# Resource Blocks

[Source](http://technet.microsoft.com/en-us/library/dn249921.aspx)

| Provider																					| Description
| :-- 																						| :--
| [DSC Archive Resource](http://technet.microsoft.com/en-us/library/dn249917.aspx) 			| Unpacks archive (.zip) files at specific paths on target nodes.
| [DSC Environment Resource](http://technet.microsoft.com/en-us/library/dn282121.aspx) 		| Manages system environment variables on target nodes.
| [DSC File Resource](http://technet.microsoft.com/en-us/library/dn282129.aspx) 			| Manages files and directories on target nodes.
| [DSC Group Resource](http://technet.microsoft.com/en-us/library/dn282124.aspx) 			| Manages local groups on target nodes.
| [DSC Log Resource](http://technet.microsoft.com/en-us/library/dn282117.aspx) 				| Logs configuration messages.
| [DSC Package Resource](http://technet.microsoft.com/en-us/library/dn282132.aspx) 			| Installs and manages packages, such as Windows Installer and setup.exe packages, on target nodes.
| [DSC WindowsProcess Resource](http://technet.microsoft.com/en-us/library/dn282123.aspx) 	| Configures Windows processes on target nodes.
| [DSC Registry Resource](http://technet.microsoft.com/en-us/library/dn282133.aspx) 		| Manages registry keys and values on target nodes.
| [DSC WindowsFeature Resource](http://technet.microsoft.com/en-us/library/dn282127.aspx) 	| Adds or removes Windows features and roles on target nodes.
| [DSC Script Resource](http://technet.microsoft.com/en-us/library/dn282130.aspx) 			| Runs Windows PowerShell script blocks on target nodes.
| [DSC Service Resource](http://technet.microsoft.com/en-us/library/dn282120.aspx) 			| Manages services on target nodes.
| [DSC User Resource](http://technet.microsoft.com/en-us/library/dn282118.aspx) 			| Manages local user accounts on target nodes.


**Manage Windows feature**
```
WindowsFeature MyRoleExample
{
  Ensure = "Present" # To uninstall the role, set Ensure to "Absent"
  Name = "Web-Server"  
}
```

**Services**
```
Service virtualDiskService
{
	Name = 'vds'
	State = 'Running'
	StartupType = 'Automatic'
	BuiltInAccount = '' # LocalService / LocalSystem / NetworkService
}
```

**Copy file**
```
- File is a built-in resource you can use to manage files and directories
- This example ensures files from the source directory are present in the destination directory

File MyFileExample
{
 Ensure = "Present"  # You can also set Ensure to "Absent"
 Type = "Directory“ # Default is “File”
 Recurse = $true
 SourcePath = \\dc1\websitefiles # This is a path that has web files
 DestinationPath = "C:\inetpub\wwwroot" # The path where we want to ensure the web files are present
 Force = $true # overwrite
}
```

**Log**

- Log is located `Windows Logs \ Application and Services Log \ Microsoft \ Windows \ Desired State Configuration \ Analytic`
	- needs to be enabled
```
Log loggingInfo
{
	Message = "Windows Environment variable set successfully."
}
```

**Environment**
```
Environment serveRackInfo
{
	Ensure = 'Present'
	Name = "ServerRack"
	Value = "Rack2 U9"
}
```

**Manage Builtin groups**
```
- Group is a built-in resource that you can use to manage local Windows groups
- This example ensures the existence of a group with the name specified by $MyGroupName
Group testGroup
{
	Ensure = 'Present'
	GroupName = 'AmanTestGroup'
	Members = 'root'
	Description = "This group is created by PowerShell DCS script"
}
```