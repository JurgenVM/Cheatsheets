# Router

## Get info from router

| Command							| Meaning
| :---                  			| :---
| `show running-config`				| Shows the current configuration that runs on the device 
| `show access-lists`				| Shows all the access-lists configured on the device
| `show mac-address-table`			| Shows the table with al the known MAC addresses
| `show port-security <interface>`	| Get information about the port-security on specific port
| `show verion`						| Get the inventory list of the device 
| `show ip route`					| Shows all the routes
| `show cdp neighbors detail`		| Get info from connected devices
| `show vlan`						| Get all the VLAN's on the router
| `show vtp`						|
| `show spanning-tree`				|
| `show controllers`				|
| `show flash`						| Show flashable files to upgrade the OS 
| `show file systems`				| Output the IOS files or images

## Usefull commands

| Command							| Meaning
| :---                  			| :---
| `enable`							| Go to EXEC mode
| `configure terminal`				| Go to config mode
| `hostname <name>`					| Change the hostname of the device
| `clear mac-address-table`			| Clears the MAC address table
| `copy flash tftp`					| Copy current flash to a tftp server
| `copy tftp flash`					| Upgrade flash from tftp server
| `remark <comment>`				| Add comment to the next command, when you do `show running-config` you can see all your remarks

## Configure interface 

| Command							| Options				| Meaning
| :---                  			| :---					| :---
| `interface <name>`				|						| Select the interface
| `ip address <ip> <subnetmask>`	|						| Configure the ip address / subnetmask

# Configure telnet access

Config mode `conf t`

| Command				| Meaning
| :---              	| :---
| 1. `line vty 0 4`		|
| 2. `password <pw>`	| Set the password
| 3. `login`			| Enable the password on login

## EIGRP

Config mode `conf t`

| Command					| Meaning
| :---              		| :---
| router eigrp <nr>			|
| network A.B.C.D <netmask>	|

# Switch

## Configure Interface

Config mode `conf t`<br>
Interface mode `interface <name>`

| Command							| Options				| Meaning
| :---                  			| :---					| :---
| `switchport mode`					| `trunk`				| Configure port as trunk port
| 									| `access vlan <nr>`	| Change port to specific vlan
|									| `access`				| Change port to access mode
| `switchport port-security`		| `violation shutdown`	| If violation occurs the port is shutdown
|									| `mac-address sticky`	| The mac addresses are learned when new one gets plugged in
| `ip access-group <nr>`			| `in`					|
|									| `out`					|



## Create ACL

Config mode `conf t`<br>

| Command										| Options				| Meaning
| :---                  						| :---					| :---
| `ip access-list`								| `standard <name>`		|
|												| `extended <name>`		|
| `permit tcp host A.B.C.D host A.B.C.D eq www` | Permit traffic on port 80
| `deny ip any any`								| Block all trafic


## Create VLAN

Config mode `conf t`<br>

| Command					| Meaning
| :---              		| :---
| vlan <nr>					|




