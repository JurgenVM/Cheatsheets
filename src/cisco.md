=== Usefull commands ===

show running-config
show access-lists
show mac-address-table
show port-security <interface>

clear mac-address-table

=== ACL ===

config terminal
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


