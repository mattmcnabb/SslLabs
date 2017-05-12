@{
    NestedModules = "SslLabs.psm1"
    ModuleVersion = "0.1.0"
    GUID = "eecf6029-4e2e-4f0d-a572-e567ecb2c72f"
    Author = "Matt McNabb"
    Copyright = "(c)2017. All rights reserved."
    Description = "a PowerShell module for analyzing your web servers' SSL configurations. Leverages Qualys' SSL Labs API"
    PowerShellVersion = "5.0"
    FunctionsToExport = @(
		"Get-SslLabsCert",
		"Get-SslLabsEndpoint",
        "Invoke-SslLabsAssessment"
	)

    PrivateData = @{
        PSData = @{
            Tags = "SSL","Security","https","REST"
            LicenseUri = "https://github.com/mattmcnabb/SslLabs/blob/master/SslLabs/license"
            ProjectUri = "https://github.com/mattmcnabb/SslLabs"
            ReleaseNotes = "initial beta release"
        }
    }
}
