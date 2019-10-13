# Create a network security group rule for port 3389.
$rule1 = New-AzureRmNetworkSecurityRuleConfig -Name 'RDP' -Description 'Allow RDP' `
  -Access Allow -Protocol Tcp -Direction Inbound -Priority 1000 `
  -SourceAddressPrefix Internet -SourcePortRange * `
  -DestinationAddressPrefix * -DestinationPortRange 3389

# Create a network security group rule for port 80.
$rule2 = New-AzureRmNetworkSecurityRuleConfig -Name 'myNetworkSecurityGroupRuleHTTP' -Description 'Allow HTTP' `
  -Access Allow -Protocol Tcp -Direction Inbound -Priority 2000 `
  -SourceAddressPrefix Internet -SourcePortRange * `
  -DestinationAddressPrefix * -DestinationPortRange 80

# Create a network security group
$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName $resourceGroup `
-Location $location `
-Name 'myNetworkSecurityGroup' `
-SecurityRules $rule1,$rule2

$VNETName = "lzvnet-eur-c-fe"
$subnetName = "fw-main"
$resourceGroup = "lz-rg-eur-d-playground"
$location = "West Europe"

$vnet = Get-AzureRmVirtualNetwork `
-Name $VNETName `
-ResourceGroupName $resourceGroup

$SubnetDetails =Get-AzureRmVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $vnet

$UpdateSubnet =Set-AzureRmVirtualNetworkSubnetConfig -Name $SubnetDetails.Name `
-VirtualNetwork $vnet `
-NetworkSecurityGroup $nsg -AddressPrefix $SubnetDetails.AddressPrefix

$vnet | Set-AzureRmVirtualNetwork