
function Test-ReplicaHealth
{
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
	
	try
	{
		# try to reset VM replication health status to normal if it is not
		Get-VMReplication | % {if($_.Health -ne 'normal') {Reset-VMReplicationStatistics -VMReplication $_}}
	}
	catch {}
	
	$results = Get-VMReplication | ft "name","health","LastReplicationTime","ReplicaServer" -AutoSize
    
    $results | Out-File $ResultFilePath
}