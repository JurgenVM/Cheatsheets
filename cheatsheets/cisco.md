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
| `clear mac-address-table`			| Clears the MAC address table
| `copy flash tftp`					| Copy current flash to a tftp server
| `copy tftp flash`					| Upgrade flash from tftp server
| `remark <comment>`				| Add comment to the next command, when you do `show running-config` you can see all your remarks

## Basic Setup

| Meaning																		| Command
| :---                  														| :---
| Disable DNS lookup.															| `Router(config)#no ip domain-lookup`
| Configure device name as shown in the topology.								| `Router(config)#hostname R1`
| Assign class as the privileged EXEC password.									| `R1(config)#enable password class`
| Assign cisco as the vty password.												| `R1(config)#line vty 0 4`
| 																				| `R1(config-line)#login`
| 																				| `R1(config-line)#password cisco`
| Configure a MOTD banner to warn users that unauthorized access is prohibited.	| `R1(config)#banner motd # Back off! #`
| Configure logging synchronous for the console line.							| `R1(config)#line con 0`
| 																				| `R1(config-line)#logging synchronous`
| Encrypt plain text passwords.													| `R1(config)#service password-encryption`
| Copy the running configuration to the startup configuration.					| `R1#copy running-config startup-config`
|																				| `Destination filename [startup-config]?`
|																				| `Building configuration...`
|																				| `[OK]`

## Configure interface 

| Command							| Options				| Meaning
| :---                  			| :---					| :---
| `interface <name>`				|						| Select the interface
| `ip address <ip> <subnetmask>`	|						| Configure the ip address / subnetmask

## EIGRP

**Enable EIGRP**

- `conf t`
- `router eigrp <nr>`
- `network 10.0.0.0 255.0.0.0`

**Create passive interface**

- `conf t`
- `router eigrp <nr>`
- `passive-interface <name>`

**Configure delay**

- `conf t`
- `interface <name>`
- `delay <nr>`

## OSPF

**Clear previous OSPF configuration**

- `conf t`
- `clear ospf`

**Configure the area**

- `conf t`
- `router ospf <process id>`
- `network A.B.C.D <reverse netmask> area <area id>`
- `summary-address A.B.C.D <reverse netmask>`
- `log-adjacency-changes (optional)`
- `default-information originate always`

### Configure authentication OSPF

**Enable OSPF authentication**

- `conf t`
- `area <nr> authentication message-digest`

**Configure the interface**

- `conf t`
- `interface <name>`
- `ospf message-digest-key 5 md5 <password>`
- `ospf priority <1-255> (optional)`
- `ospf cost <nr>`
- `ospf priority <nr>`
- `bandwith <nr> (optional)`

## IPv6

**Configure IPv6 interface**
- conf t
- ipv6 unicast-routing
- int giga 0/0
- ipv6 address 2001:DB8:1:1::1/64
- ipv6 address FE80::1 link-local

**Configure RIP for IPv6**
- conf t
- ipv6 router rip CISCO

**Configure OSPF** 
- conf t
- ipv6 unicast-routing
- ipv6 router ospf 10
- router id 1.1.1.1
- int giga 0/0
	- ipv6 ospf 10 area 0

------------------------------------------------------------------------------------------------------------------------

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