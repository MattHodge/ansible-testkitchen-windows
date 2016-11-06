describe "win_iis_demo ansible role" {

    Context "windows features" {
        $featuresToGet = @(
            'Web-Server'
        )

        $x = Get-WindowsFeature
        ForEach ($f in $featuresToGet)
        {
            it "$($f) feature is installed" {
                ($x | Where-Object { $_.Name -eq $f }).Installed | Should Be $true
            }
        }
    }

    Context "iis config" {
        $pathsToTest = @(
            'C:\inetpub\wwwroot\iisstart.htm'
        )

        ForEach ($p in $pathsToTest)
        {
            it "$($p) exists" {
                Test-Path -Path $p | Should Be $true
            }
        }

        It "port 80 is listening" {
            (Test-NetConnection -ComputerName localhost -Port 80).TcpTestSucceeded | Should be $true
        }

        It "the word 'twitter' is on the web page" {
            ((Invoke-WebRequest -UseBasicParsing -Uri localhost).Content).contains('twitter') | Should be $true
        }
    }
}
