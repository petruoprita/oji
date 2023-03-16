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
		netsh firewall add portopening ALL 53 DNS-server
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
		netsh advfirewall firewall add rule name="AllowIP25" dir=out action=allow remoteip=80.86.106.229
		netsh advfirewall firewall add rule name="AllowIP26" dir=out action=allow remoteip=80.86.119.33
		netsh advfirewall firewall add rule name="AllowIP27" dir=out action=allow remoteip=34.159.143.85
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
			netsh advfirewall firewall del rule name="AllowIP25"
			netsh advfirewall firewall del rule name="AllowIP26"
			netsh advfirewall firewall del rule name="AllowIP27"
			netsh advfirewall firewall set rule all new enable=yes
		)
	) else (
		echo Call 'block_internet.cmd [block^|unblock]'
	)
)
