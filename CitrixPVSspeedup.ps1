# Script path and INI file
$BaseFolder = $(Split-Path -parent $MyInvocation.MyCommand.Definition) + "\";
$CitrixCSV = $BaseFolder + "CitrixSpeedUp.csv"

# Funtions
function FileToCache ($File) {
    # Slow
    #[System.IO.File]::ReadAllBytes($File)
    #
    # Quicker but need to be tested
    #Get-Content -Raw $File.FullName
    Write-Output $File
}


# Read CSV configuration file
$csv = Import-Csv -Path $($CitrixCSV) -Delimiter ","

# CSV
# AppFileDirectory,extension1,extension2,extension3
#
foreach ($line in $csv) {
    if ($line.AppFileDirectory -ne ""){
        # is a file?
        if (Test-Path $line.AppFileDirectory -PathType Leaf){
            FileToCache -File $line.AppFileDirectory
        }
        # is a directory?
        if (Test-Path $line.AppFileDirectory -PathType Container){
            if ($line.SearchFilter -eq ""){
                $line.SearchFilter = "*.exe"
                }
                foreach ($File in (Get-ChildItem -Path $line.AppFileDirectory -Recurse -File -Include $line.SearchFilter)) {
                FileToCache -File $File.FullName
            }
        }
    } 
}
