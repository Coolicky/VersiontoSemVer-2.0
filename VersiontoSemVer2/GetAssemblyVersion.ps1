[CmdletBinding()]
Param ()

$searchPattern = Get-VstsInput -Name 'searchPattern' -Require
$variableName = Get-VstsInput -Name 'variableName' -Require

# Write params to the console.
Write-Host ("Search Pattern: " + $searchPattern)
Write-Host ("Variable Name: " + $variableName)

# Reading File
$fileText = [IO.File]::ReadAllText($searchPattern)

$found = [regex]::Matches("$fileText", '(?m)^\s*[\[\<]\s*[Aa]ssembly:\s*(\w*)\(\s*@?"([^"]*)')

$varValue = ""

foreach ($match in $found) {
    foreach ($Item in $match.Groups) {

        $versionString = [regex]::Match($match, "(\d+)\.?(\d+)?\.?(\d+)?\.?(\d+)?")
        $assemblyString = [regex]::Match($match, "AssemblyVersion")

        if ($versionString.Success -and $assemblyString.Success) {
            $varValue = $versionString.Value.Substring(0, 5)
        }
    }
}

Write-Host ("Setting variable " + $variableName + " to '" + $varValue + "'")
Write-Output ("##vso[task.setvariable variable=" + $variableName + ";]" + $varValue )
