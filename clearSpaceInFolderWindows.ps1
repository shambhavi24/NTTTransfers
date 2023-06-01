try{
    #Inputs
	$folderPath = $args[0]

	# Check if the folder exists
	if (Test-Path $folderPath) 
	{
	# Remove all files in the folder
		Get-ChildItem $folderPath -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse


	Write-Host "Contents removed successfully."
	} 
	else 
	{
	Write-Host "Folder does not exist."
	}

}
catch
{
    "UNIQUEERRORCODE : Error occurred in the script $($_.Exception)"
}