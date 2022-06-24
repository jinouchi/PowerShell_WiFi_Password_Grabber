$profiles = netsh wlan show profiles
$profiles = $profiles -replace ".*: "
foreach ($item in $profiles) {
    $pass = netsh wlan show profile name=$item key=clear | sls "Key Content" 
    $pass = $pass -replace ".*: "
    if ($pass) {
        Write-Output "$item`:$pass"
    }
}
