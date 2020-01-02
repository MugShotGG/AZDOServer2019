 #2019 Azure Devops Server (On Prem) Script For Updating Theme
 #Online you set this setting at an org level. On prem treats each client as a org of its own
 #This will jump through all your collections and set the theme. I had to harvest these commands from the GUI's network trafic 
 

 #Base URL 
 $tfsUri = "https://XXXX.com"
 
 #Value to 
$json = ConvertTo-Json @{
    "WebPlatform/Theme" = "ms.vss-web.vsts-theme-dark"
}

#Get all the TFS collections to jump through them 
$GetCollectionsCall = $tfsUri + '/_apis/projectCollections?api-version=1.0'  
$tfsCollections = Invoke-RestMethod -Method Get -ContentType application/json -Uri $GetCollectionsCall -UseDefaultCredentials
 

#Update each collection to have the new theme
foreach($tfsCollection in $tfsCollections.value){


    $UpdateThemeCall = "$tfsUri/" + $tfsCollection.name + '/_apis/Settings/Entries/globalme?api-version=4.1-preview.1' 
    Invoke-RestMethod -Uri $UpdateThemeCall -Method patch -Body $json -ContentType application/json -UseDefaultCredentials
}
