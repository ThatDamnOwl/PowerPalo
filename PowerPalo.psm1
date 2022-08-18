##PowerPalo.psm1

##Internal variables

$PaloCreds    = $null
$PaloAPIKeys  = @{}
$PaloServer   = "server"
$PaloProtocol = "https"
$PaloPort     = "443"
$PaloAPIRoot  = ""
$PaloVersion  = "v9.1"

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
