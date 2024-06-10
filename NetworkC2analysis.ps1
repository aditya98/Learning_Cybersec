# Quick Wins for Windows Network Analysis using Pwsh and C2 investigations

# To show TCP Connections and associated Processes
Get-NetTCPConnection | select LocalAddress,localport,remoteaddress,remoteport,state,@{name="process";Expression={(get-process -id $_.OwningProcess).ProcessName}}, @{Name="cmdline";Expression={(Get-WmiObject Win32_Process -filter "ProcessId = $($_.OwningProcess)").commandline}} | sort Remoteaddress -Descending | ft -wrap -autosize

# Get all UDP connections 
Get-NetUDPEndpoint | select local*,creationtime, remote* | ft -autosize

# Sort Unique and Remote IPs
(Get-NetTCPConnection).remoteaddress | Sort-Object -Unique

# Investigate an IP addr
Get-NetTCPConnection -remoteaddress <IP> | select state, creationtime, localport,remoteport | ft -autosize

# Retrieve DNS Cache
Get-DnsClientCache | ? Entry -NotMatch "workst|servst|memes|kerb|ws|ocsp" | out-string -width 1000

#view hosts file
gc -tail 4 "C:\Windows\System32\Drivers\etc\hosts"

#querying RDP logs
qwinsta

#Querying SMB conns
Get-SmbConnection

#Querying SMB Shares
 Get-SMBShare