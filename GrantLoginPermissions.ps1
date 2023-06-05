
# Specify the user account

$domain = "<DomainName>"
$username = "<Username>"
$userAccount = "$domain\$username"


# Retrieve the existing user rights assignment
$policy = Get-WmiObject -Class Win32_UserRightsAssignment -Filter "Name='SeInteractiveLogonRight'"


# Get the current list of users
$users = $policy.Accounts | ForEach-Object { $_.ToString() }


# Check if the user is already present in the list
if ($users -contains $userAccount) {

    Write-Host "User '$userAccount' already has the 'Allow log on locally' right."
	exit
}


# Add the user to the list of accounts
$users += $userAccount


# Convert the list back to a single string
$newAccounts = $users -join ","


# Update the user rights assignment with the new accounts
$policy.Accounts = $newAccounts
$policy.Put()

Write-Host "User '$userAccount' has been granted the 'Allow log on locally' right."