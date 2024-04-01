Architecture générale du projet
 
Pour réaliser ce projet, nous avons tout d’abord un fichier “main.ml” qui permet de lancer une partie. Ensuite, nous avons créé plusieurs fichiers annexes pour créer les modules nécessaires à l’implémentation du jeu que sont : 
- le fichier “plateau.ml”
- le fichier “bot_random.ml”
- le fichier “ia_coup_simple.ml”.

Les fichiers sont : 
plateau.ml 
plateau.ml est le fichier qui sert de base pour l’implémentation du jeu. Celui-ci définit le type couleur représentant la couleur bleue et rouge comme étant les 2 joueurs qui s’affrontent ainsi que la couleur blanche représentant un fil qui n’est pas encore relié. La couleur point est celle représentant les points sur le plateau de jeu, c’est une “couleur” par défaut. 
Ce type est équipé d’une fonction “creer_couleur” permettant de créer une couleur, une fonction “est_bleu” qui dit si la couleur indiquée est la couleur bleu, une fonction “renvoi_blanc” qui renvoie la couleur blanc, ainsi que “changer_couleur” permettant de passer d’une couleur à une autre parmi le bleu et le rouge. 
 
De plus, ce fichier contient les fonctions nécessaires à la création et l’édition du plateau de jeu. En effet, il possède la fonction “creer_plateau” qui crée une matrice de la taille demandée avec des cases de 3*3 représentant chacune une case du jeu. Une case aura donc des points dans les angles pour relier les fils sur les côtés, ainsi que son cœur au centre. Il possède aussi la fonction “change_coul” qui change une ligne blanche en une ligne de la couleur du joueur ainsi que la fonction “remplis_case” qui remplit une case et la colorie si celle-ci est pleine ( cf règle du jeu ). Cette fonction renvoie un booléen indiquant si une case a été remplie ou non pour permettre au joueur de peut-être rejouer au tour suivant. 

Finalement elle possède une fonction qui permet d’afficher le plateau de jeu avec même ses couleurs ! Les coordonnées des lignes et colonnes à jouer sont placées au-dessus et à gauche de l’affichage pour plus de facilité.

“random.ml”
random.ml est le fichier qui contient, comme son nom l’indique les fonctions permettant de faire jouer le bot qui joue de manière aléatoire. En effet, elle contient la fonction bot_random_joue qui permet au bot de placer sa couleur dans le plateau de jeu. Pour se faire, le bot utilise plusieurs fonctions, dont pos_jouable qui donne les positions en lesquels il peut jouer, ie une case représenté par le type Blanc et une fonction valide_pos qui va vérifier si les coordonnées généres de manière aléatoire sont bien compatible avec le plateau de jeu.

 “ia.ml” 
ia.ml contient lui les fonctions nécessaires pour faire fonctionner le bot qui va jouer de manière intelligente. Elle  contient les fonctions “compte_cote” permettant, à partir des coordonnées du cœur d’une case de renvoyer les lignes de cette case encore blancs. Ensuite il y a la fonction “joue.ia” qui estime quel coup est le meilleur pour le bot, afin qu’il n’offre pas de points, et qu’il prenne le premier qui lui est possible.
 
Ainsi, pour pouvoir lancer le jeu, on doit compiler chacun des fichiers .ml avec la commande “ocamlc -c nom du fichier” afin d’obtenir les fichiers .cmo correspondant, on peut ensuite créer l’exécutable main en exécutant la commande “ocamlc -o main les fichiers .cmo” dont on a besoin. Enfin, on peut exécuter main avec ./main afin de lancer le jeu.


Explications des règles du jeu : 

À chaque tour, chaque joueur colorie un petit trait suivant le quadrillage du plateau de jeu. Le but du jeu est de former des carrés en fermant un quadrillage. Le gagnant est celui qui a fermé le plus de carrés. En fermant un carré, le joueur peut rejouer son tour ce qui peut permettre à celui-ci de jouer plusieurs coups à la suite lorsque se créent des couloirs. 

Comment jouer au jeu ? 

Pour commencer une partie il va falloir exécuter le fichier du jeu avec la commande ./pipopipette *difficulté*. La difficulté à entrer ensuite dépendra de ce contre quoi vous voulez jouer. Si vous voulez jouer contre un adversaire sans stratégie il vous faudra écrire “random” et pour un adversaire avec une stratégie “ia”.

Une fois votre adversaire choisi, la partie peut commencer. Pour colorier une ligne il vous suffira d’entrer ses coordonnées sous forme CL avec C la colonne et L la ligne sur lesquels l’on veut jouer. Sur le plateau, il y a l’indication des coordonnées C et L des cases sur les côtés pour vous repérer plus facilement.
