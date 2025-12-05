function main {
    $chemin = "input\day1_1.txt"
    $coffre = 50
    $compteur = 0

    Get-Content -Path $chemin | ForEach-Object {

        if ($_.Substring(0, 1) -eq "L") {
            $coffre -= [int]$_.Substring(1)

            while ($coffre -lt 0) {
                $coffre = 100 + $coffre
            }
        } elseif ($_.Substring(0, 1) -eq "R") {
            $coffre = ($coffre + [int]$_.Substring(1)) % 100

        } else {
            continue
        }
        
        if ($coffre -eq 0) {
            $compteur += 1
        }
        #Write-Output $_
        #Write-Output $coffre
    }

    return $compteur
}

$resultat = main

Write-Output $resultat
# 1074