function Get-SslLabsEndpoint
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $HostName,

        [Parameter(Mandatory)]
        [ipAddress]
        $IPAddress
    )
    
    $VerbosePreference = "SilentlyContinue"
    Test-SslLabsApi
    
    $Splat = @{
        Method = "Get"
        Uri = "$ApiBase/getEndpointData"
        Body = @{
            host = $HostName
            s = $IPAddress
        }
    }

    Invoke-RestMethod @Splat
}
