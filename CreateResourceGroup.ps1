Login-AzureRmAccount
Select-AzureRmSubscription -Subscription "Free Trial"
#Create Resource Group
$rgname = "RG-Banking-PS"
$rglocation= "South India"
$rg= Get-AzureRmResourceGroup -Name $rgname -ErrorAction SilentlyContinue
if(!$rg)
{
Write-Host "creating new resouce group"
$rg =New-AzureRmResourceGroup -name $rgname -location $rglocation 
Write-Host $rg.
}
else
{
Write-Host "Resouce group already exist"
Write-Host $rg
}

Remove-AzureRmResourceGroup -Name $rgname

 