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
$ModuleFolder = (Get-Module PowerPalo -ListAvailable).path -replace "PowerPalo\.psm1"
$SavePath = "$ModuleFolder\$($ENV:Username)-variables.json"

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
        $NewPaloServer,
        [switch]
        $SkipVariableSave
    )

    set-variable -scope 1 -name PaloServer -value $NewPaloServer
    
    if (-not $SkipVariableSave) 
    {
        Set-PaloAPIRoot -SkipVariableSave
    }
}

Function Set-PaloProtocol
{
    param
    (
        $NewPaloProtocol,
        [switch]
        $SkipVariableSave
    )

    set-variable -scope 1 -name PaloProtocol -value $NewPaloProtocol
    
    if (-not $SkipVariableSave) 
    {
        Set-PaloAPIRoot -SkipVariableSave
    }
}

Function Set-PaloPort
{
    param
    (
        $NewPaloPort,
        [switch]
        $SkipVariableSave
    )

    set-variable -scope 1 -name PaloPort -value $NewPaloPort
    
    if (-not $SkipVariableSave) 
    {
        Set-PaloAPIRoot -SkipVariableSave
    }
}

Function Set-PaloVersion
{
    param
    (
        $NewPaloVersion,
        [switch]
        $SkipVariableSave
    )

    set-variable -scope 1 -name PaloVersion $NewPaloVersion
    
    if (-not $SkipVariableSave) 
    {
        Set-PaloAPIRoot -SkipVariableSave
    }
}

Function Set-PaloAPIRoot
{
    param
    (
        $NewPaloPort,
        $NewPaloProtocol,
        $NewPaloServer,
        $NewPaloVersion,
        [switch]
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

        if ($NewPaloVersion -ne $null)
        {
            Set-PaloPort $NewPaloVersion
        }
    }

    $NewPaloAPIRoot = "$($PaloProtocol):/$($PaloServer)/restapi/$PaloVersion"

    set-variable -scope 1 -name PaloAPIRoot -value $NewPaloAPIRoot
}

Function Invoke-PaloVariableSave
{
    get-variable -scope 1 | where {$_.name -match "Palo"} | convertto-json -depth 10 | Set-Content $SavePath
}

Function Invoke-PaloVariableLoad
{
    if (test-path $SavePath)
    {
        $Variables = Get-content $SavePath | convertfrom-json

        foreach ($Variable in $Variables)
        {
            set-variable -scope 1 -name $Variable.name -value $Variable.Value
        }
    }
    else
    {
        throw "Settings file not found"
    }
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

    $uri = "$PaloAPIRoot/Object/Regions"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplications
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Applications"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplicationGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Application/Groups"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectApplicationFilters
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Application/Filters"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectServices
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Services"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectServiceGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Service/Groups"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectTags
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Tags"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectGlobalProtectHIPObjects
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Global/Protect/HIPObjects"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectGlobalProtectHipProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Global/Protect/Hip/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectExternalDynamicLists
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/External/Dynamic/Lists"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomDataPatterns
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Custom/Data/Patterns"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomSpywareSignatures
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Custom/Spyware/Signatures"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomVulnerabilitySignatures
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Custom/Vulnerability/Signatures"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectCustomURLCategories
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Custom/U/R"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAntivirusSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Antivirus/Security/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAntiSpywareSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Anti/Spyware/Security/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectVulnerabilityProtectionSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Vulnerability/Protection/Security/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectURLFilteringSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/U/R/L/Filtering"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectFileBlockingSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/File/Blocking/Security/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectWildFireAnalysisSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Wild/Fire/Analysis/Security"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDataFilteringSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Data/Filtering/Security/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDoSProtectionSecurityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Do/S/Protection/Security"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSecurityProfileGroups
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Security/Profile/Groups"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectLogForwardingProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Log/Forwarding/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectAuthenticationEnforcements
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Authentication/Enforcements"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDecryptionProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Decryption/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectDecryptionForwardingProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Decryption/Forwarding/Profiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSchedules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/Schedules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSDWANPathQualityProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/SDWAN/PathQualityProfiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloObjectSDWANTrafficDistributionProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Object/SDWAN/TrafficDistributionProfiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicySecurityRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Security/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyNATRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/NATRules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyQoSRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/QoS/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyPolicyBasedForwardingRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Policy/Based/Forwarding/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyDecryptionRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Decryption/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyTunnelInspectionRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Tunnel/Inspection/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyApplicationOverrideRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Application/Override/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyAuthenticationRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Authentication/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicyDoSRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/Do/S/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloPolicySDWANRules
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Policy/SDWAN/Rules"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkSDWANInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/SDWAN/Interfaces"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkSDWANInterfaceProfiles
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/SDWAN/InterfaceProfiles"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkEthernetInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/Ethernet/Interfaces"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkTunnelIntefaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/Tunnel/Intefaces"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkZonesVirtualRouters
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/Zones/Virtual/Routers"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkQoSInterfaces
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/QoS/Interfaces"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetworkVirtualSystems
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/Virtual/Systems"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetwork
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/"

    Invoke-RestMethod -method get -uri $uri 
}

Function Get-PaloNetwork
{
    param
    (

    )

    $uri = "$PaloAPIRoot/Network/"

    Invoke-RestMethod -method get -uri $uri 
}

### Advanced functions

### Module variables load

Invoke-PaloVariableLoad