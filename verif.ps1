$EmplacementFichier = [string]
$echec = 0
$success = 0
$tableau = [string]
$tableau = ""
$EmplacementFichier = "C:\Users\crodr\OneDrive\Documents\LeMotif\permutOutput.log"

$MonFichier = get-content $EmplacementFichier

Write-Output "******************************************* DEBUT DE L ANALYSE DE LA LISTE D'URL(s) *************************************"
Write-Output ""
Write-Output ""
Write-Output ""

foreach ($UneLigne in $MonFichier){
	Write-Output ""
	Write-Output "******************* Curl sur l'url https://www.unsonparjour.com/$UneLigne ******************************"
	Write-Output ""
	Write-Output ""
	$resultat=Invoke-WebRequest -Uri https://www.unsonparjour.com/$UneLigne -UseBasicParsing | Select-Object -ExpandProperty StatusCode
	Write-Output $resultat
	
	If ($resultat -eq "200")
	{
		Write-Output "success"
		Write-Output "L'url en succes est : $UneLigne"
		$tableau=$tableau+$UneLigne+";"
		$success++
	}else{
		Write-Output "echec"
		$echec++
	}
	Clear-Variable -Name resultat
	Write-Output ""
	Write-Output "****************************************************************************"
}

Write-Output ""
Write-Output ""
Write-Output "******************************************* BILAN *************************************"
Write-Output ""
Write-Output ""
Write-Output "Nombre d'url en echec : $echec"
Write-Output "Nombre d'url en succes : $success"
Write-Output ""
Write-Output "Le(s) url(s) en success sont : $tableau"
Write-Output ""
Write-Output "******************************************* FIN *************************************"
