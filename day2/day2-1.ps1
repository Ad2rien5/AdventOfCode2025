# une fonction qui test si un nombre est invalide
function is_incorrect {
    param(
        [int]$valeur
    )
    $nombre = [string]$valeur
    $taille = $nombre.Length

    if ($taille%2 -ne 0) {
        return $false
    }
    $maxi = [int]($taille/2)
    Write-Host $nombre.Substring(0, $maxi) $nombre.Substring($maxi+1)

    if ($nombre.Substring(0, $maxi-1) -eq $nombre.Substring($maxi+1)) {
        Write-Host $nombre
        return $true
    }


    return $false
}

# une fonction qui cherche toutes les nombre entre les deux range qui accumule les faux ID
function compute_range {
    param(
        [string]$inter1,
        [string]$inter2
    )

    if ($inter1.Substring(0, 1) -eq "0" -or $inter2.Substring(0, 1) -eq "0") {
        return $null
    }

    $start = [int]$inter1
    $end = [int]$inter2
    $somme_invalid = 0

    for ($i = $start; $i -le $end; $i++) {
        if (is_incorrect -valeur $i) {
            $somme_invalid += $i
        }
    }

    return $somme_invalid
}

# une fonction qui lit le fichier et qui appelle les la fonction compute_range
function main {
    if ($test) {
        $chemin = "input\day2_1_test.txt"
    } else {
        $chemin = "input\day2_1.txt"
    }
    $result = 0

    (Get-Content -Path $chemin -TotalCount 1) -split ',' | ForEach-Object {
        $start, $end = $_ -split '-'
        $petit_test = compute_range -inter1 $start -inter2 $end
        $result += $petit_test
    }
    return $result
}

$test = $true
$resultat = main


Write-Output "résultat : " $resultat "|"