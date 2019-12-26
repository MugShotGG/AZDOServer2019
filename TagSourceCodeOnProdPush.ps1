$body =  @{
  name= "$(Build.BuildNumber)"
  taggedObject= @{
    objectId= "$(Build.SourceVersion)"
  }
 message= "Tag Set By Automated Deploy"
}


$head = @{ Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"  }

$json = ConvertTo-Json $body

$url = "$(System.TeamFoundationCollectionUri)$(System.TeamProject)/_apis/git/repositories/$(BUILD.REPOSITORY.ID)/annotatedtags?api-version=5.0-preview.1"

Invoke-RestMethod -Uri $url -Method Post -Headers $head -Body $json -ContentType application/json -UseDefaultCredentials
    
    
  
  
