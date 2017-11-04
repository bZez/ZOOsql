<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Simplon exemples sql</title>
</head>
<body style="text-align:center">
<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

define('NOM_DB', 'ZOO');
define('UTILISATEUR_DB', 'XXXX');
define('MDP_DB', 'XXXX');

$dbconnexion = new PDO('mysql:host=localhost;dbname='.NOM_DB, UTILISATEUR_DB, MDP_DB, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
?>
<h1>Tous les Animaux</h1>
<?php
$Repas = $dbconnexion->query("
SELECT a.nom, a.dateNaissance, 
GROUP_CONCAT(r.heureRepas SEPARATOR ' <br/> ') heuresRepas,
GROUP_CONCAT(m.poids SEPARATOR ' + ') poids,
GROUP_CONCAT(al.nomAliments SEPARATOR ' <br/> ') nomsAliments,
GROUP_CONCAT(f.nomFournisseurs SEPARATOR ' <br/> ') nomsFournisseurs
FROM repas r, animaux a, menus m, aliments al, fournisseurs f 
WHERE a.id_animaux=r.id_animaux 
AND r.id_repas=m.id_repas 
AND m.id_aliments=al.id_aliments 
AND al.id_fournisseurs=f.id_fournisseurs
GROUP BY a.nom, a.dateNaissance
");
foreach ($Repas as $Rp) {
    
$nom = mb_strtoupper($Rp['nom']);
$nomsFour = $Rp['nomsFournisseurs'];
$nomsAlim = $Rp['nomsAliments'];
$heuresRep = $Rp['heuresRepas'];
$poids = $Rp['poids'];
$heureUnique = explode (" <br/> ", $heuresRep);
$fourUnique = explode(" <br/> ", $nomsFour);
$alimUnique = explode(" <br/> ", $nomsAlim);
$poidsUnique = explode(" + ", $poids);
$pdsTxt = '';
$cmTxt = '';
if ($heureUnique[0] == next($heureUnique)) {
    $heuresRep = $heureUnique[0];
}
if ($fourUnique[0] == next($fourUnique)) {
    $nomsFour = $fourUnique[0];
}
if ($alimUnique[0] == next($alimUnique)) {
    $nomsAlim = $alimUnique[0];
 /*   $i=0;
    foreach ($poidsUnique as $pU){
    $i += $pU;
    }
    $poids = $i;
*/
    $poids = $poidsUnique[0];
    $pdsTxt = "<i>$poids Kg de $nomsAlim</i><br/><b>".$heuresRep." </b>";

}
elseif ($alimUnique[0] != next($alimUnique)){
	$i = 0;
	foreach ($alimUnique as $aU) {
     $pdsTxt .=  "<b>".$heureUnique[$i]." <br/></b><i>".$poidsUnique[$i]." Kg de " .$aU."</i><br/>";
$i++;
		}
}
    echo '<strong>'.$nom.'</strong><br/>'.$Rp['dateNaissance'].'<br/><br/><u> Alimentation:</u><br/>'.$pdsTxt.'<br/><u>Fournisseur:</u><br/><i>'.$nomsFour.'</i><hr>';
};

?>
<h1>Ce qu'ils mangent</h1>
SOON
</body>
</html>
