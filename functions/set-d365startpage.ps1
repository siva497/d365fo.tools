<#
.SYNOPSIS
Sets the start page in internet explorer

.DESCRIPTION
Function for setting the start page in internet explorer to the "https://$($Name).cloud.onebox.dynamics.com"

.PARAMETER Name
Name of the D365 Instance

.EXAMPLE
Set-D365StartPage -Name 'Demo1'

.NOTES

#>
function Set-D365StartPage() {
    param(
        # Parameter help description
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = 'SetStartPage')]
        [String]
        $Name
    )
   
    $path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
    $propName = 'start page'
    $value = "https://$Name.cloud.onebox.dynamics.com"
    Set-Itemproperty -Path $path -Name $propName -Value $value
    
}