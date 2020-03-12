[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$AdminEmail = "$(AdminEmail)"
$ApiKey = "$(ApiKey)"
$ZoneId = "$(ZoneId)"

$PurgeCacheUri = "https://api.cloudflare.com/client/v4/zones/$ZoneId/purge_cache";


$RequestHeader = @{
        'X-Auth-Email' = $AdminEmail
        'X-Auth-Key' = $ApiKey
    }; 
$RequestBody = '{"purge_everything":true}';


Invoke-RestMethod -Uri $PurgeCacheUri -Method Delete -ContentType "application/json" -Headers $requestHeader -Body $RequestBody 

