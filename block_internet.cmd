@echo off

if "%1"=="block" (
	if exist "C:\Windows\System32\drivers\etc\rules.wfw" (
		echo alredy blocked
	) else (
		echo blocking
		netsh advfirewall export "C:\Windows\System32\drivers\etc\rules.wfw"
		netsh advfirewall firewall set rule all new enable=no
		netsh advfirewall firewall set rule group="Core Networking" new enable=yes
		netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
		netsh advfirewall firewall add rule name="AllowDNS" program="%SystemRoot%\system32\svchost.exe" dir=out action=allow protocol=UDP remoteport=53
		netsh advfirewall firewall add rule name="AllowIP1" dir=out action=allow remoteip=34.159.0.251
		netsh advfirewall firewall add rule name="AllowIP2" dir=out action=allow remoteip=35.198.164.70
		netsh advfirewall firewall add rule name="AllowIP3" dir=out action=allow remoteip=35.230.143.147
		netsh advfirewall firewall add rule name="AllowIP4" dir=out action=allow remoteip=35.234.135.6
		netsh advfirewall firewall add rule name="AllowIP5" dir=out action=allow remoteip=34.89.75.25
		netsh advfirewall firewall add rule name="AllowIP6" dir=out action=allow remoteip=35.246.62.96
		netsh advfirewall firewall add rule name="AllowIP7" dir=out action=allow remoteip=34.107.108.173
		netsh advfirewall firewall add rule name="AllowIP8" dir=out action=allow remoteip=34.159.174.99
		netsh advfirewall firewall add rule name="AllowIP9" dir=out action=allow remoteip=34.159.149.178
		netsh advfirewall firewall add rule name="AllowIP10" dir=out action=allow remoteip=34.105.216.88
		netsh advfirewall firewall add rule name="AllowIP11" dir=out action=allow remoteip=34.117.109.190
		netsh advfirewall firewall add rule name="AllowIP12" dir=out action=allow remoteip=35.241.1.205
		netsh advfirewall firewall add rule name="AllowIP13" dir=out action=allow remoteip=34.117.169.236
		netsh advfirewall firewall add rule name="AllowIP14" dir=out action=allow remoteip=35.244.177.111
		netsh advfirewall firewall add rule name="AllowIP15" dir=out action=allow remoteip=34.149.201.114
		netsh advfirewall firewall add rule name="AllowIP16" dir=out action=allow remoteip=34.111.229.245
		netsh advfirewall firewall add rule name="AllowIP17" dir=out action=allow remoteip=34.110.195.173
		netsh advfirewall firewall add rule name="AllowIP18" dir=out action=allow remoteip=34.120.219.172
		netsh advfirewall firewall add rule name="AllowIP19" dir=out action=allow remoteip=34.110.207.91
		netsh advfirewall firewall add rule name="AllowIP20" dir=out action=allow remoteip=34.111.21.76
		netsh advfirewall firewall add rule name="AllowIP21" dir=out action=allow remoteip=34.88.129.126
		netsh advfirewall firewall add rule name="AllowIP22" dir=out action=allow remoteip=18.196.219.70
		netsh advfirewall firewall add rule name="AllowIP23" dir=out action=allow remoteip=35.158.203.79
		netsh advfirewall firewall add rule name="AllowIP24" dir=out action=allow remoteip=3.64.189.93
		netsh advfirewall firewall add rule name="AllowIPCF1" dir=out action=allow remoteip=173.245.48.0/20
		netsh advfirewall firewall add rule name="AllowIPCF2" dir=out action=allow remoteip=103.21.244.0/22
		netsh advfirewall firewall add rule name="AllowIPCF3" dir=out action=allow remoteip=103.22.200.0/22
		netsh advfirewall firewall add rule name="AllowIPCF4" dir=out action=allow remoteip=103.31.4.0/22
		netsh advfirewall firewall add rule name="AllowIPCF5" dir=out action=allow remoteip=141.101.64.0/18
		netsh advfirewall firewall add rule name="AllowIPCF6" dir=out action=allow remoteip=108.162.192.0/18
		netsh advfirewall firewall add rule name="AllowIPCF7" dir=out action=allow remoteip=190.93.240.0/20
		netsh advfirewall firewall add rule name="AllowIPCF8" dir=out action=allow remoteip=188.114.96.0/20
		netsh advfirewall firewall add rule name="AllowIPCF9" dir=out action=allow remoteip=197.234.240.0/22
		netsh advfirewall firewall add rule name="AllowIPCF10" dir=out action=allow remoteip=198.41.128.0/17
		netsh advfirewall firewall add rule name="AllowIPCF11" dir=out action=allow remoteip=162.158.0.0/15
		netsh advfirewall firewall add rule name="AllowIPCF12" dir=out action=allow remoteip=104.16.0.0/13
		netsh advfirewall firewall add rule name="AllowIPCF13" dir=out action=allow remoteip=104.24.0.0/14
		netsh advfirewall firewall add rule name="AllowIPCF14" dir=out action=allow remoteip=172.64.0.0/13
		netsh advfirewall firewall add rule name="AllowIPCF15" dir=out action=allow remoteip=131.0.72.0/22
	)
) else (
	if "%1"=="unblock" (
		echo unblocking
		netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
		if exist "C:\Windows\System32\drivers\etc\rules.wfw" (
			netsh advfirewall firewall del rule all
			netsh advfirewall import "C:\Windows\System32\drivers\etc\rules.wfw"
			del /f "C:\Windows\System32\drivers\etc\rules.wfw"
		) else (
			netsh advfirewall firewall del rule name="AllowDNS"
			netsh advfirewall firewall del rule name="AllowIP1"
			netsh advfirewall firewall del rule name="AllowIP2"
			netsh advfirewall firewall del rule name="AllowIP3"
			netsh advfirewall firewall del rule name="AllowIP4"
			netsh advfirewall firewall del rule name="AllowIP5"
			netsh advfirewall firewall del rule name="AllowIP6"
			netsh advfirewall firewall del rule name="AllowIP7"
			netsh advfirewall firewall del rule name="AllowIP8"
			netsh advfirewall firewall del rule name="AllowIP9"
			netsh advfirewall firewall del rule name="AllowIP10"
			netsh advfirewall firewall del rule name="AllowIP11"
			netsh advfirewall firewall del rule name="AllowIP12"
			netsh advfirewall firewall del rule name="AllowIP13"
			netsh advfirewall firewall del rule name="AllowIP14"
			netsh advfirewall firewall del rule name="AllowIP15"
			netsh advfirewall firewall del rule name="AllowIP16"
			netsh advfirewall firewall del rule name="AllowIP17"
			netsh advfirewall firewall del rule name="AllowIP18"
			netsh advfirewall firewall del rule name="AllowIP19"
			netsh advfirewall firewall del rule name="AllowIP20"
			netsh advfirewall firewall del rule name="AllowIP21"
			netsh advfirewall firewall del rule name="AllowIP22"
			netsh advfirewall firewall del rule name="AllowIP23"
			netsh advfirewall firewall del rule name="AllowIP24"
			netsh advfirewall firewall del rule name="AllowIPCF1"
			netsh advfirewall firewall del rule name="AllowIPCF2"
			netsh advfirewall firewall del rule name="AllowIPCF3"
			netsh advfirewall firewall del rule name="AllowIPCF4"
			netsh advfirewall firewall del rule name="AllowIPCF5"
			netsh advfirewall firewall del rule name="AllowIPCF6"
			netsh advfirewall firewall del rule name="AllowIPCF7"
			netsh advfirewall firewall del rule name="AllowIPCF8"
			netsh advfirewall firewall del rule name="AllowIPCF9"
			netsh advfirewall firewall del rule name="AllowIPCF10"
			netsh advfirewall firewall del rule name="AllowIPCF11"
			netsh advfirewall firewall del rule name="AllowIPCF12"
			netsh advfirewall firewall del rule name="AllowIPCF13"
			netsh advfirewall firewall del rule name="AllowIPCF14"
			netsh advfirewall firewall del rule name="AllowIPCF15"
			netsh advfirewall firewall set rule all new enable=yes
		)
	) else (
		echo Call 'block_internet.cmd [block^|unblock]'
	)
)
