describe "Ansible" {

    Context "File Paths and Installs" {
        $pathsToTest = @(
            'C:\'
        )

        ForEach ($p in $pathsToTest)
        {
            it "$($p) exists" {
                Test-Path -Path $p | Should Be $true
            }
        }
    }
}
