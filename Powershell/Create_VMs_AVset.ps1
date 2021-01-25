# Create a resource group.
New-AzResourceGroup `
   -Name myResourceGroupAvailability `
   -Location EastUS
# Create a managed availability set using New-AzAvailabilitySet with the -sku aligned parameter.
New-AzAvailabilitySet `
   -Location "EastUS" `
   -Name "myAvailabilitySet" `
   -ResourceGroupName "myResourceGroupAvailability" `
   -Sku aligned `
   -PlatformFaultDomainCount 2 `
   -PlatformUpdateDomainCount 2
# First, set an administrator username and password for the VM with Get-Credential:
$cred = Get-Credential
# Now create two VMs with New-AzVM in the availability set.
for ($i=1; $i -le 2; $i++)
{
    New-AzVm `
        -ResourceGroupName "myResourceGroupAvailability" `
        -Name "myVM$i" `
        -Location "East US" `
        -VirtualNetworkName "myVnet" `
        -SubnetName "mySubnet" `
        -SecurityGroupName "myNetworkSecurityGroup" `
        -PublicIpAddressName "myPublicIpAddress$i" `
        -AvailabilitySetName "myAvailabilitySet" `
        -Credential $cred
}
# When you create a VM inside a availability set,  you need to know what VM sizes are available on the hardware. Use Get-AzVMSize command to get all available sizes for virtual machines that you can deploy in the availability set.
Get-AzVMSize `
   -ResourceGroupName "myResourceGroupAvailability" `
   -AvailabilitySetName "myAvailabilitySet" 