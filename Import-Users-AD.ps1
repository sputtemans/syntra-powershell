Param (
    [Parameter(Mandatory=$true)][string]$CsvLocatie
    )
 

$Users = Import-Csv -Path $CsvLocatie -Delimiter ";"           
foreach ($User in $Users)            
{            
    $Displayname = $User.Accountnaam           
    $UserFirstname = $User.Voornaam            
    $UserLastname = $User.Achternaam  
    $Password = $User.Wachtwoord                                
    $Servername = $User.Servernaam          

    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -GivenName "$UserFirstname" -Surname "$UserLastname" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $false
}
