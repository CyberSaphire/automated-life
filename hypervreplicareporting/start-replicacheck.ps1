<#
1. register daily scheduled task
2. run script to check replica status
	- replica health status is normal for each VM
	- storage space usage is less than 90% for replica server
	- send out a notification mail if either of above is false
#>

[CmdletBinding()]
param
(
    [Parameter(Mondatory=$true)]
    [string]
    $PrimaryServer,
    
    [Parameter(Mondatory=$true)]
    [string]
    $ReplicaServer,
    
    [Parameter(Mondatory=$true)]
    [string]
    $ResultFilePath
)

Import-Module .\healthcheck.psm1 -Force



