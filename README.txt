Présentation du Projet:



Il s'agit d'un paquetage "Gestion_Fractions" en ADA pour la gestion de fractions.

Ce paquetage offre notamment comme fonctionaités la saisie, l'affichage, l'addition, la soustraction, la mutiplication et la division des fractions. 

Les fractions sont stockées sous la forme irrédutible. Dans le paquetage, on déclare aussi une exception "DIV_PAR_ZERO".

On a un programme "calcul_fractions.adb" qui utilise le paquetage "Gestion_Fractions", et qui affiche le résultat d'un calcul passé en argument sur la ligne de commande (comme l'addition de deux fractions). 

Ce programme traite l'exception "DIV_PAR_ZERO" quand une division par zero est propagée.



Utilisation du programme:


- Pour l'utilisation du programme on doit compiler le fichier "calcul_fractions.adb".


- Une fois compilé, on peut utiliser le programme à l'aide de GIT BASH, CMD, TERMINAL, etc de la manière suivante:



Exemple pour les fractions 3/10 + 8/5 : 

	
./calcul_fractions 3 10 + 8 5
	
./calcul_fractions 3 10 - 8 5
	
./calcul_fractions 3 10 x 8 5
	
./calcul_fractions 3 x 8 5   (pour la multiplication entre un entier et une fraction)
	

./calcul_fractions 3 10 x 8  (pour la multiplication entre une fraction et un entier)
	

.calcul_fractions 3 10 p -2  (l'argument "p" pour la puissance -2 de la fraction 3/10)
	

./calcul_fractions 3 10 : 8 5 (l'argument ":" pour la division. On peut diviser entier entre fraction et viceversa)

	

./calcul_fractions 15 10 g  (pour calculer le PGCD entre deux nombres)  
