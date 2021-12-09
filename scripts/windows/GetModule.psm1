function GetModule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $ModuleName
    )

    return Get-Module -ListAvailable -Name $ModuleName
}