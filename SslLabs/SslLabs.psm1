$ApiBase = "https://api.ssllabs.com/api/v2"

$FunctionsPath = Join-Path $PSScriptRoot "functions"
$HelpersPath = Join-Path $PSScriptRoot "helpers"
$Scripts = Get-ChildItem -Path $FunctionsPath,$HelpersPath -Filter "*.ps1" -file -Recurse

foreach ($Script in $Scripts)
{
	. $Script.FullName
}
