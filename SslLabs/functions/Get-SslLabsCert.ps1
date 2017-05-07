function Get-SslLabsCert
{
    [CmdletBinding()]
    param
    (

    )
    
    $VerbosePreference = "SilentlyContinue"
    Test-SslLabsApi
    
    $Splat = @{
        Method = "Get"
        Uri = "$ApiBase/getRootCertsRaw"
    }

    $Response = Invoke-RestMethod @Splat
    $RawStrings = $Response -split '\n\n' | Where {$_.length -gt 0}
    foreach ($RawString in $RawStrings)
    {
        $Strings = $RawString -split '\n' -replace '#\s'
        $BeginIndex = $Strings.IndexOf('-----BEGIN CERTIFICATE-----') + 1
        $EndIndex = $Strings.IndexOf('-----END CERTIFICATE-----') - 1
        $Certificate = $Strings[$BeginIndex..$EndIndex] | Out-String
        
        [PSCustomObject]@{
            Name       = $Strings[0]
            Subject    = $Strings[1] -replace 'Subject:\s+'
            KeyType    = $Strings[2] -replace 'Key type:\s+'
            KeyLength  = $Strings[3] -replace 'Key length:\s+'
            NotBefore  = $Strings[4] -replace 'Not before:\s+'
            NotAfter   = $Strings[5] -replace 'Not after:\s+'
            Certficate = $Certificate
        }
    }
}
