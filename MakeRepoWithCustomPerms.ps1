#Azure DevOps Make Git Repo and Apply Custom Repo Permisions VIA TFSecurity

#Update This if your path is different
Set-Alias TFSSecurity "C:\Program Files\Azure DevOps Server 2019\Tools\TFSSecurity.exe"

#Update These 
$instance ="XXX.com"
$Client ="Google"
$Project="BigMoneyProject"


#Update Per your repo naming convention 
$RepoName="Web"+"_$Project.com"


#make GitRepo
$Call = "https://$instance/$Client/$project/_apis/git/repositories?api-version=5.0"

#JSON Payload 
$json = ConvertTo-Json @{
  "name" = "$RepoName"

}
#Make Repo
Invoke-RestMethod -Uri $Call -Method POST -Body $json -ContentType application/json -UseDefaultCredentials


 

#Define Custom Perms per group here is an example with two groups Toggle (ALLOW | DENY) for each perm
#https://docs.microsoft.com/en-us/azure/devops/server/command-line/tfssecurity-cmd?view=azure-devops#git-repository
#Use this link as reference

$URL = "/collection:https://$instance/$Client"
$Group = "n:[$Project]\Source_Control_Contributors"



TFSSecurity /a+ 'Git Repositories' repositories GenericContribute $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories PullRequestContribute $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateBranch $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateRepository $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateTag $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories DeleteRepository $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories EditPolicies $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories PolicyExempt $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ForcePush $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ManageNote $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ManagePermissions $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories GenericRead $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories RemoveOthersLocks $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories RenameRepository $Group Allow $URL

$Group = "n:[$Project]\Work_Item_Administrators"

TFSSecurity /a+ 'Git Repositories' repositories GenericContribute $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories PullRequestContribute $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateBranch $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateRepository $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories CreateTag $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories DeleteRepository $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories EditPolicies $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories PolicyExempt $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ForcePush $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ManageNote $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories ManagePermissions $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories GenericRead $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories RemoveOthersLocks $Group Allow $URL
TFSSecurity /a+ 'Git Repositories' repositories RenameRepository $Group Allow $URL
