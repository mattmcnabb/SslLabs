function Test-SslLabsApi
{
    try
    {
        $null = Invoke-RestMethod -Method get -Uri "$ApiBase/info"
    }
    catch
    {
        throw $_
    }
}
