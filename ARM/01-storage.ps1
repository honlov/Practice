$rg = 'arm-intoduction-01'
New-AzResourceGroup -Name $rg -location eastus -Force

New-AzResourceGroupDeployment `
-Name 'new-storage' `
-ResourceGroupName $rg `
-TemplateFile '01-storage.json'