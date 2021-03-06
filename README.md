# d365fo.tools
Powershell module to handle the different management tasks during a Dynamics 365 Finace & Operations (D365FO)
Read more about D365FO on [docs.microsoft.com](https://docs.microsoft.com/en-us/dynamics365/unified-operations/fin-and-ops/index)

Available on Powershellgallery
[d365fo.tools](https://www.powershellgallery.com/packages/d365fo.tools)

```
Install-Module -Name d365fo.tools
```

**List all available commands / functions**

```
Get-Command -Module d365fo.tools
```

**Update the module**

```
Update-Module -name d365fo.tools
```

The tool tries to assist you with a lot of the time consuming and/or cumbersome tasks during a project. E.g.

**Get product build numbers**

```
Get-D365ProductInformation
```

*Will list all build numbers available, application and platform*

**Rename a local VM (onebox) to be accessible on a custom URL / URI.**

```
Get-D365InstanceName
```
*Displays the current instance registered on the machine. Run on a machine with the D365 AOS installed on to get an result*

```
Rename-D365Instance -NewName 'Demo1'
```

*Now the machine (iis) will only respond to request for https://demo1.cloud.onebox.dynamics.com*

**Change the start page of the browser to another URL / URI**

```
Set-D365StartPage -Name 'Demo1'
```

*Now when starting the browser you will start visit https://demo1.cloud.onebox.dynamics.com*

**Provision a new admin for a given instance**

```
Set-D365Admin "admin@contoso.com"
```

*Please remember that the username / e-mail has to be a valid Azure Active Directory*

**Import a list of users into the environment**

```
Import-D365AadUser -Userlist "Claire@contoso.com;Allen@contoso.com"
```

*Imports Claire and Allen into the environment*

*Remeber that the list has to be semicolon (';') separated*


**Generate a bacpac file from a Tier1 environment to be ready for a Tier2 environment**

```
New-D365Bacpac -ExecutionMode FromSql -DatabaseServer localhost -DatabaseName db -SqlUser User123 -SqlPwd "Password123" -BackupDirectory c:\Temp\backup\ -NewDatabaseName Testing1 -BacpacDirectory C:\Temp\Bacpac\ -BacpacName Testing1
```

*This will backup the db database from the localhost server.*

*It will restore the backup back into the localhost server with a new name "Testing1".*

*It will clean up the Testing1 database for objects that cannot exist in Azure DB.*

*It will start the sqlpackage.exe file and export a valid bacpac file.*

*It will delete the Testing1 database on the localhost server.*

**Generate a bacpac file from a Tier2 environment. As an export / backup file only**

```
New-D365Bacpac -ExecutionMode FromAzure -DatabaseServer dbserver1.database.windows.net -DatabaseName db -SqlUser User123 -SqlPwd "Password123" -BacpacDirectory C:\Temp\Bacpac\ -BacpacName Testing1 -RawBacpacOnly
```

*This will export an bacpac file directly from the db database from the Azure db instance at dbserver1.database.windows.net.*

**Generate a bacpac file from a Tier2 environment to be ready for a Tier1 environment**

```
New-D365Bacpac -ExecutionMode FromAzure -DatabaseServer dbserver1.database.windows.net -DatabaseName db -SqlUser User123 -SqlPwd "Password123" -NewDatabaseName Testing1 -BacpacDirectory C:\Temp\Bacpac\ -BacpacName Testing1
```

*This will create a copy of the db database in the Azure db instance at dbserver1.database.windows.net.*

*It will clean up the Testing1 database for objects that cannot exist in SQL Server.*

*It will start the sqlpackage.exe file and export a valid bacpac file.*

*It will delete the Testing1 database in the Azure db instance at dbserver1.database.windows.net.*

**Upload a file to Azure Storage account**

```
Invoke-D365AzureStorageUpload -AccountId "miscfiles" -AccessToken "xx508xx63817x752xx74004x30705xx92x58349x5x78f5xx34xxxxx51" -Blobname "backupfiles" -Filepath C:\temp\bacpac\UAT_20180701.bacpac -DeleteOnUpload
```

*This will upload the UAT_20180701.bacpac to the specified Azure Storage account and delete it when completed*

**List all the database connection details for an environment**

```
Get-D365DatabaseAccess
```

*This will show database connection details that D365FO is configured with*

**Decrypt and store a copy of the web.config file from the AOS**

```
Get-D365DecryptedConfigFile -DropPath 'C:\Temp'
```

*This will store a decrypted web.config file at c:\temp*

**Rearm the Windows license / activation counter**

```
Invoke-D365ReArmWindows -Restart
```

*This will try to rearm the Windows license and will only work if you have retries left. Will restart afterwards.*

**Sync the database like Visual Studio**

```
Invoke-D365DBSync
```

*This utilizes the same mechanism as Visual Studio just in PowerShell and runs the entire synchronization process.* 

**Update users in an environment after database migration / restore or re-provisioning**

```
Update-D365User -Email "claire@contoso.com"
```
*This will search for the user in the UserInfo table with "claire@contoso.com" e-mail address and update it with the needed details to get access to the environment*

**Update users in an environment after database migration / restore or re-provisioning - advanced**

```
Update-D365User -Email "%contoso.com%"
```

*This will search for all users in the UserInfo table with the "contoso.com" text in their e-mail address and update them with the needed details to get access to the environment*

**Handling D365 environment**

```
Get-D365Environment
```

*Will list the status of all D365 services on the local machine*

```
Get-D365Environment -ComputerName "TEST-SB-AOS1","TEST-SB-AOS2","TEST-SB-BI1" -All
```

*Will list the status of all D365 services on the specified machines*

```
Stop-D365Environment
```

*Will stop all D365 services on the local machine. Will report current status for all services*

```
Stop-D365Environment -ComputerName "TEST-SB-AOS1","TEST-SB-AOS2","TEST-SB-BI1" -All
```

*Will stop all D365 services on the the specified machines. Will report current status for all services*

```
Start-D365Environment
```

*Will start all D365 services on the local machine. Will report current status for all services*

```
Start-D365Environment -ComputerName "TEST-SB-AOS1","TEST-SB-AOS2","TEST-SB-BI1" -All
```

*Will start all D365 services on the the specified machines. Will report current status for all services*

**Offline Authentication Administrator Email**

```
Get-D365OfflineAuthenticationAdminEmail
```

*Will display the current registered account as Offline Authentication Administrator*

```
Set-D365OfflineAuthenticationAdminEmail -Email "admin@contoso.com"

```

*Will update the Offline Authentication Administrator registration to "admin@contoso.com"*

**Work with packages, label files, language and labels**

```
Get-D365InstalledPackage
```
*Gets all installed packages on the system/machine*

```
Get-D365InstalledPackage -Name "ApplicationSuite"
```
*Gets the "ApplicationSuite" package*

```
Get-D365InstalledPackage -Name "ApplicationSuite" | Get-D365PackageLabelFile -Language "en-US"
```
*Gets all the "en-US" resource / label files from the ApplicationSuite package*

```
Get-D365InstalledPackage -Name "ApplicationSuite" | Get-D365PackageLabelFile -Language "en-US" -Name "PRO"
```
*Gets the PRO resource / label file from the "ApplicationSuite" package with the language "EN-US"*

```
Get-D365InstalledPackage -Name "ApplicationSuite" | Get-D365PackageLabelFile -Language "en-US" -Name "PRO" | Get-D365Label
```
*Gets all label details from the PRO resource / label file from the "ApplicationSuite" package with the language "EN-US"*

```
Get-D365InstalledPackage -Name "ApplicationSuite" | Get-D365PackageLabelFile -Language "*" -Name "PRO" | Get-D365Label -Name "@PRO505"
```
*Gets the "@PRO505" label details from the "PRO" resource / label file from the "ApplicationSuite" package, **across all languages***

```
Get-D365InstalledPackage -Name "ApplicationSuite" | Get-D365PackageLabelFile -Language "en-US" | Get-D365Label -Value "*qty*" -IncludePath
```
*Gets all "en-US" labels where the value contains "*qty*" from the "ApplicationSuite" package, **across all resource / label files***

**Execute SysFlushAod class**

```
Invoke-D365SysFlushAodCache
```
*Will execute a web call to the SysRunnerClass with the name SysFlushAod class and have the class executed*

**Call the Table Browser**

```
Invoke-D365TableBrowser -TableName SalesTable -Company "USMF"

```
*Will call the Table Browser in the web browser and display all data from the SalesTable within the "USMF" company*

**Execute runnable class**

```
Invoke-D365SysRunnerClass -ClassName SysDBInformation -Company USMF

```
*Will execute a web call to the SysRunnerClass with the SysDBInformation as the parameter and have the class executed against the USMF company*

**Look up table details, either by name or id**

```
Get-D365Table -Id 10347
```
*Will get the details for the table with the id 10347*

```
Get-D365Table -Name CustTable
```
*Will get the details for the CustTable*

**Look up field details, either by name or id**

```
Get-D365TableField -TableId 10347
```

*Will get all fields and details for these fields for the table with id 10347*

```
Get-D365TableField -TableName CustTable
```
*Will get all fields and details for these fields for the table CustTable*

```
Get-D365TableField -TableId 10347 -FieldId 175
```
*Will get the details for the field with id 175 that belongs to the table with id 10347*

```
Get-D365TableField -TableId 10347 -Name "VAT*"
```
*Will get the details for all fields that fits the search "VAT*" that belongs to the table with id 10347*

```
Get-D365TableField -Name AccountNum -SearchAcrossTables
```
*Will search for the AccountNum field across all tables.*