#Get Azure Modules in Powershell
Install-Module AzureRM
Import-Module AzureRM

#Login to your Azure Account
Login-AzureRmAccount
#Select the Subscription you wish to work on
Select-AzureSubscription -SubscriptionName "Free Trial"

#Define Variables
$ResourceGroupName = "MyRG1"
$Location = "West Europe"

#Create New Resource Group
$RG=New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location

#Print The Resource Group Name and Location
Write-host $RG.ResourceGroupName
Write-host $RG.Location

#Get the details of an existing resource group
$RGGet = Get-AzureRmResourceGroup -Name $ResourceGroupName

Write-host $RGGet.ResourceGroupName
Write-host $RGGet.Location

#Delete a Resource Group
Remove-AzureRmResourceGroup -Name $RG.ResourceGroupName