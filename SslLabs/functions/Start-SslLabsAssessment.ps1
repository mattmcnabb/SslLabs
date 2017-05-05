function Start-SslLabsAssessment
{
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
