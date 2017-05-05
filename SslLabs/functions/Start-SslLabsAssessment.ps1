function Start-SslLabsAssessment
{
    <#
    .NOTES
    api docs here: https://github.com/ssllabs/ssllabs-scan/blob/stable/ssllabs-api-docs.md
    central helper for all api calls
    functions for:
    - start assessment - allow -wait for results
    - check assessment
    - retrieve results
    classes
    tests
    CI
    Add handling for publish and ignoremismatch
    add parameter help and examples
    add function to check status of assessment
    add function to retrieve info from completed assessment
    add function for retrieving from cache
    full test suite
    once all is complete, publish and include full docs and an example script for a report
    #>

    [CmdletBinding(DefaultParameterSetName = "New")]
    param
    (
        [Parameter(Mandatory = $true, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $HostName,

        [Switch]
        $Publish,

        [switch]
        $IgnoreMismatch
    )
    
    begin
    {
        Test-SslLabsApi

        $Splat = @{
            Method = "Get"
            Uri = "$ApiBase/analyze"
            Body = @{
                startNew = "on"
                all = "done"
            }
        }
    }
    
    process
    {
        $Splat["Body"]["host"] = $HostName
        Invoke-RestMethod @Splat
    }
}
