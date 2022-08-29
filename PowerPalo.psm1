##PowerPalo.psm1

##Internal variables

$PaloCreds    = $null
$PaloAPIKeys  = @{}
$PaloServer   = "server"
$PaloProtocol = "https"
$PaloPort     = "443"
$PaloAPIRoot  = ""
$PaloVersion  = "v9.1"
$PaloHeader   = ""
Function Get-PaloCreds
{
    $PaloCreds
}

Function Get-PaloAPIKeys
{
    $PaloAPIKeys
}

Function Get-PaloServer
{
    $PaloServer
}

Function Get-PaloProtocol
{
    $PaloProtocol
}

Function Get-PaloPort
{
    $PaloPort
}

Function Get-PaloAPIRoot
{
    $PaloAPIRoot
}

Function Set-PaloCreds
{
    param
    (
        $NewPaloCreds
    )

    set-variable -scope 1 -name PaloCreds -value $NewPaloCreds
}

Function Set-PaloAPIKeys
{
    param
    (
        $NewAPIKeys
    )

    set-variable -scope 1 -name PaloAPIKeys -value $NewAPIKeys
}

Function Set-PaloServer
{
    param
    (
        $NewPaloServer
    )

    set-variable -scope 1 -name PaloServer -value $NewPaloServer
}

Function Set-PaloProtocol
{
    param
    (
        $NewPaloProtocol
    )

    set-variable -scope 1 -name PaloProtocol -value $NewPaloProtocol
}

Function Set-PaloPort
{
    param
    (
        $NewPaloPort
    )

    set-variable -scope 1 -name PaloPort -value $NewPaloPort
}

Function Set-PaloVersion
{
    param
    (
        $NewPaloVersion
    )

    set-variable -scope 1 -name PaloVersion $NewPaloVersion
}

Function Set-PaloAPIRoot
{
    param
    (
        $NewPaloPort,
        $NewPaloProtocol,
        $NewPaloServer,
        $SkipVariableSave
    )

    if (-not $SkipVariableSave)
    {
        if ($NewPaloServer -ne $null)
        {
            Set-PaloServer $NewPaloServer
        }

        if ($NewPaloProtocol -ne $null)
        {
            Set-PaloProtocol $NewPaloProtocol
        }

        if ($NewPaloPort -ne $null)
        {
            Set-PaloPort $NewPaloPort
        }
    }

    $NewPaloAPIRoot = "$($PaloProtocol)://$($PaloServer)/restapi/$PaloVersion"

    set-variable -scope 1 -name  -value 
}

Function Invoke-PaloVariableSave
{
    
}

### Basic API Functions

Function Get-PaloObjectAddresses
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Addresses"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAddressGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/AddressGroups"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectRegions
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplications
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplicationGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplicationFilters
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectServices
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectServiceGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectTags
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectGlobalProtectHIPObjects
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectGlobalProtectHipProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectExternalDynamicLists
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomDataPatterns
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomSpywareSignatures
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomVulnerabilitySignatures
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomURLCategories
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAntivirusSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAntiSpywareSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectVulnerabilityProtectionSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectURLFilteringSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectFileBlockingSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectWildFireAnalysisSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDataFilteringSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDoSProtectionSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSecurityProfileGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectLogForwardingProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAuthenticationEnforcements
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDecryptionProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDecryptionForwardingProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSchedules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSDWANPathQualityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSDWANTrafficDistributionProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicySecurityRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyNATRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyQoSRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyPolicyBasedForwardingRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyDecryptionRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyTunnelInspectionRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyApplicationOverrideRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyAuthenticationRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyDoSRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicySDWANRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkSDWANInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkSDWANInterfaceProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkEthernetInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkTunnelIntefaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkZonesVirtualRouters
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkQoSInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkVirtualSystems
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetwork
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetwork
{
    param
    (

    )

    $uri = "$PaloAPIRoot/"

    Invoke-RestMethod -method get -uri $uri 
}

### Advanced functions

















































