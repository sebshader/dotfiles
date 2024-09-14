
(& opam env) -split '\r?\n' | ForEach-Object { Invoke-Expression $_ }

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

Set-PsReadLineOption -EditMode Vi
$j_timer = New-Object System.Diagnostics.Stopwatch

Set-PSReadLineKeyHandler -Key j -ViMode Insert -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("j")
    $j_timer.Restart()
}


Set-PSReadLineKeyHandler -Key k -ViMode Insert -ScriptBlock {
    if (!$j_timer.IsRunning -or $j_timer.ElapsedMilliseconds -gt 500) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("k")
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor, 1)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor-1)
    }
}

$oldprompt = $function:prompt
function prompt {
    & $oldprompt
    # things like vim/nvim can mess the cursor up
    Write-Host -NoNewLine "`e[5 q"
}

# Shows navigable menu of all options when hitting Tab

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-Alias -Name vim nvim
function which ([string]$command) {
    Try {
        Get-Command -Name $command -ErrorAction Stop
    } Catch {
        "No Command found"
    }
}

Remove-Alias -Name ls
function ls () {
    Get-ChildItem -Force @args
}

function vimdiff () {
    vim -d @args
}
