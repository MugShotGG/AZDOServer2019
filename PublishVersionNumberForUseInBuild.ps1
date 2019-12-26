#My Org Versions their dev site URLs this little snippet sanitizes and sets up these versions to be usable in builds. 
#Looks a little gross but it gets the job done

$PathToParse = $env:BUILD_SOURCEBRANCH
#Git: release/1.0.0
#TFS: $/Me/MySite.com/Branches/1.0/1.0.0

if ($env:BUILD_REPOSITORY_PROVIDER -like "*Git"){

  $Split = $PathToParse -split "release"
  $Split = $Split -split "/"
  $Number = $Split[-1].Replace(".","-")


  $Major = $Number.split("-")[0] #1
  $Minor = $Number.split("-")[1] #0
  $Revision = $Number.split("-")[2] #0

}else{

  $Split = $PathToParse -split "Branches"
  $Split = $Split -split "/"
  $Number = $Split[-1].Replace(".","-")


  $Major = $Number.split("-")[0] #1
  $Minor = $Number.split("-")[1] #0
  $Revision = $Number.split("-")[2] #0

}
#Publish 4 Variables that can be used later in builds/releases

write-host "##vso[task.setvariable variable=CurrentVersion]$Number" #1-0-0
write-host "##vso[task.setvariable variable=Major]$Major" #1
write-host "##vso[task.setvariable variable=Minor]$Minor" #0
write-host "##vso[task.setvariable variable=Revision]$Revision" #0 
