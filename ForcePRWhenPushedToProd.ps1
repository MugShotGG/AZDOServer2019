$body =  @{
             sourceRefName= "$(Build.SourceBranch)"
             targetRefName = "refs/heads/master"
             title = "Merge $(Build.SourceBranch) to master"
             description = "Automated pull request after deploying $(Build.SourceBranch) to production" 
     }
$head = @{ Authorization = "Bearer $env:SYSTEM_ACCESSTOKEN"  }
$json = ConvertTo-Json $body
$url = "$(System.TeamFoundationCollectionUri)$(System.TeamProject)/_apis/git/repositories/$(Build.Repository.Name)/pullrequests?api-version=5.0"
Invoke-RestMethod -Uri $url -Method Post -Headers $head -Body $json -ContentType application/json
