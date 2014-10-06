# Cisco IOS Commandos #

## Get info from router ##

| Command							| Meaning 							|
| :---                  			| :---								|
| show running-config				| Shows the current configuration that runs on the device |
| show access-lists					| Shows all the access-lists configured on the device
| show mac-address-table			| Shows the table with al the known MAC addresses
| show port-security <interface>	| 
| show verion						| Get the inventory list of the device |
| show ip route						|
| show cdp neighbors detail			| Get info from connected devices |
| show vlan							|
| show vtp							|
| show spanning-tree				|
| show controllers					|
| show flash						| Show flashable files to upgrade the OS |
| show file systems					| Output the IOS files or images	|
| clear mac-address-table			|

## Usefull commands

| Command							| Meaning 					|
| :---                  			| :--- 						|
| clear mac-address-table			| Clears the MAC address table	|
| enable							| Go to EXEC mode			|
| copy flash tftp					| Copy current flash to a tftp server	|
| copy tftp flash					| Upgrade flash from tftp server		|

## Create ACL ##

*config terminal
ip access-list extended <naam>

remark <commentaar>
permit tcp host A.B.C.D host A.B.C.D eq www
deny ip any any


=== Configure interface ===

config terminal
interface <naam>
ip address A.B.C.D A.B.C.D
switchport mode trunk
switchport access vlan <nr>

	=== Configure Port Security ===
	switchport mode access
	switchport port-security
	switchport port-security violation shutdown
	switchport port-security mac-address sticky
	
	=== Configure ACL ===

	ip access-group <nr> in/out

=== EIGRP ===

config terminal
router eigrp <nr>
network A.B.C.D A.B.C.D

=== VLAN ===

config terminal
vlan <nr>

=== Configure Telnet Router ===

config terminal
line vty 0 4
password telnet
login


