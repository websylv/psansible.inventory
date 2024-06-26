
# To migrate to readme.md

import-module psansible.inventory


# Creating a new inventory

$Inventory = New-AnsibleInventory
$Inventory

#Creating Hierarchy

$Arch = @()

$Arch += New-AnsibleInventoryHierarchyEntry -ParentName "all_prod_servers" -Children "all_hr_servers","all_marketing_servers","all_database_servers"
$Arch += New-AnsibleInventoryHierarchyEntry -ParentName "all_database_servers" -Children "all_mongodb_servers","all_postgres_servers"
$Arch

$Inventory.AddHierarchy($Arch)

<#
    Working with Variables
#>

$vars = @()
$vars += New-AnsibleInventoryVariable -Name "plop" -Type Group -Value "WWW" -ContainerName "ABC"
$vars += New-AnsibleInventoryVariable -Name "maintenance_time" -Type Host -Value "sunday" -ContainerName "server123"
$vars

#Adding a variable to an PsAnsibleInventory

$Inventory.AddVariable($vars) 

$Inventory


#Fetching variabl

$VariableCollection.GetGroupVariables()
$VariableCollection.GetHostVariables()

#Showing Grouping

$VariableCollection.GetGrouping()

$VariableCollection.GetVariable('wsusServer')
$VariableCollection.GetVariableFromContainer('Node0055620.Node-005.dev.woop.net')

#Adding the Variables to the Inventory

$Inventory.SetVariableCollection($VariableCollection)

#Export the Inventory to INI format
Export-AnsibleInventory -Inventory $Inventory -OutputType INI -Path './Inventories/Windows/'

#Export the Inventory to JSON format
Export-AnsibleInventory -Inventory $Inventory -OutputType JSON -Path './Inventories/Windows/'

#Export the Inventory to ini per default
Export-AnsibleInventory -Inventory $Inventory -Path './Inventories/Windows/'