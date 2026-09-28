#Requires -Version 5.1
#Requires -Modules @{ ModuleName = 'BuildHelpers'; ModuleVersion = '2.0.1' }
#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '5.2.0' }

$pesterConfig = New-PesterConfiguration -Hashtable @{
    Run    = @{
        Path     = "$PSScriptRoot/.."
        PassThru = $true
    }
    Output = @{
        Verbosity = 'Detailed'
    }
}

# CI commits without manifest changes produce an empty set of schema test cases.
# Pester 6 rejects empty test cases by default; Pester 5 has no such option.
if ($pesterConfig.Run.PSObject.Properties.Name -contains 'FailOnNullOrEmptyForEach') {
    $pesterConfig.Run.FailOnNullOrEmptyForEach = $false
}

$result = Invoke-Pester -Configuration $pesterConfig
# Discovery and container errors may occur without any failed test cases.
exit [int]($result.Result -ne 'Passed')
