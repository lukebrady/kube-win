# New-PSSession -ComputerName 100.64.12.200 -Name kube-win-1 -Credential $cred
# New-PSSession -ComputerName 100.64.12.201 -Name kube-win-2 -Credential $cred

$s1 = Get-PSSession -Id 1
$s2 = Get-PSSession -Id 2

Invoke-Command -Session $s1, $s2 -ScriptBlock { 
    Start-Service docker
}

Invoke-Command -Session $s1, $s2 -ScriptBlock { 
    docker pull microsoft/windowsservercore:1709
}
