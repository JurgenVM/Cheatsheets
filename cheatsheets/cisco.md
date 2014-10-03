# Cisco IOS Cheatsheet #

## Usefull commands ##

- show
	-- `running-config`
	-- `access-list`
	-- `mac-address-table`
	-- `port-security <interface>`

- clear
	-- `mac-address-table`

## Create ACL ##

1. config terminal

1.1 ip access-list
1.1.1 extended <naam>
1.1.2 standard <naam>
2. remark <commentaar>
3. permit tcp host A.B.C.D host A.B.C.D eq www
4. deny ip any any

## Configure interface ##

1. config terminal

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


