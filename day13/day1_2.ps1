function main {
    $chemin = "input\day1_1_test.txt"
    #$coffre = 50
    $compteur = 0
    $negatif = 0
    $positif = 50

    Get-Content -Path $chemin | ForEach-Object {
        if ($_.Substring(0, 1) -eq "L") {
            $negatif -= [int]$_.Substring(1)

        } elseif ($_.Substring(0, 1) -eq "R") {
            $positif += [int]$_.Substring(1)
        }
    }

    
    Write-Output $negatif
    Write-Output $positif

    while ($negatif -lt 0) {
        $compteur++
        $negatif += 100
    }
    while ($positif -gt 99) {
        $compteur++
        $positif -= 100 
    }

    if ($negatif -gt $positif) {
        $compteur++
    }

    return $compteur
}

$resultat = main

Write-Output $resultat