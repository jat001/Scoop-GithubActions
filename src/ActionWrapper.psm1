Join-Path $PSScriptRoot 'Helpers.psm1' | Import-Module
Join-Path $PSScriptRoot 'Action' | Get-ChildItem -Filter '*.psm1' | Import-Module

function Invoke-Action {
    <#
    .SYNOPSIS
        Invoke specific action handler.
    #>
    switch ($EVENT_TYPE) {
        'pull_request' { Initialize-PR }
        'issue_comment' { Initialize-PR }
        'schedule' { Initialize-Scheduled }
        'workflow_dispatch' { Initialize-Scheduled }
        'issues' { Initialize-Issue }
        default { Write-Log 'Not supported event type' }
    }
}

Export-ModuleMember -Function Invoke-Action
