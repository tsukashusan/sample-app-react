$url = "https://api.github.com/meta"
$j = Invoke-WebRequest -Uri $url



$gitHubIps = ConvertFrom-Json -InputObject $j

$count = 0
$githubIpaddress = ""
foreach($ips in $gitHubIps.actions)
{
    if($ips.Contains(":") -eq $false)
    {
        if( $count -ne 0 )
        {
         $githubIpaddress += "`n"
        }
$githubIpaddress = $githubIpaddress + @"
        {
          ipAddress: '${ips}'
          action: 'Allow'
        }
"@
        $count++
    }
}
Write-Host -Object $githubIpaddress
Out-File -FilePath github-iplist-bicep.txt -InputObject $githubIpaddress