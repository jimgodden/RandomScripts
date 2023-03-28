# Allow TCP port 3389 through Windows Firewall on Windows Server 2022
New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow
