#import basic functions for calls to Secrets Safe/Password Safe API
Import-module .\REALLYGENERIC.ps1

#authenticate against the API
PSafe-SignAppin

#grab all the secrets in the Demo folder that the API user has access to excluding the actual password
$secrets= psafe-get "Secrets-Safe/Folders/fe864bac-2b7f-4c97-efeb-08dc29723137/secrets" |Select -ExpandProperty Id
#declaring it as an array variable
$output=@()

#grab all the secret information from the above $secrets including the password
foreach($secret in $secrets){

    $output+= psafe-get  "Secrets-Safe/Secrets/$secret"
}

#output to screen as an auto-sized table
$output |ft -AutoSize

PSafe-Post "Auth/Signout"