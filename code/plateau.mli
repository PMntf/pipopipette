(** type couleurs
    - représente les différentes couleurs
    - Blanc par défaut, Rouge celle du joueur, Bleu de l'adversaire, Point pour les angles où le joueur ne peut pas jouer.
    *)

type couleurs

(** fonction creer_couleur 
    - entrée : rien 
    - précondition : rien
    - sortie : couleur
    - postcondition : la couleur est bleue *)

val creer_couleur : unit -> couleurs 

(** fonction renvoi_blanc
    - entrée : rien
    - précondition : rien
    - sortie : couleur
    - postcondition : la couleur est blanc *)

val renvoi_blanc : unit -> couleurs 

(** fonction changer_couleur
    - entrée : couleurs
    - précondition : la couleur est Rouge ou Bleu
    - sortie : couleurs 
    - postcondition : renvoie l'autre couleur *)

val changer_couleur : couleurs -> couleurs

(** fonction est_bleu 
    - entrée : couleurs
    - précondition : aucune
    - sortie : booléen
    - postcondition : renvoie true si la couleur entrée et bleu false sinon *)

val est_bleu : couleurs -> bool

(** fonction creer_plateau
    - entrée : entier
    - précondition : positif et impair, représente la taille du plateau. 
    - sortie : couleurs array array
    - postcondition : le tableau est de la forme 
    Point Blanc Point ... Point
    Blanc Blanc Blanc ... Blanc
    Point Blanc Point ... Point
    ...               ...
    Point Blanc Point ... Point
    assertions :
        - Le tableau a une taille strictement positive
        - Sa taille est un nombre impair pour qu'il y ait un point dans chaque coins. 
    *)

val creer_plateau: int -> couleurs array array

(** fonction affiche
    - entrée : couleurs array array
    - précondition : aucune
    - sortie : rien
    - postcondition : affiche sur le terminal l'état actuel du plateau, pas d'effets de bord
    *)

val affiche : couleurs array array -> unit

(** fonction change_coul
    - entrée : une matrice 2*2 de couleurs, deux entiers, une couleur
    - précondition : la matrice est le tableau de jeu, les entiers sont les coordonnées (ligne puis colonne) où il faut changer la couleur, la couleur est celle qu'on veut appliquer.
    - sortie : rien
    - postcondition : Possède des effets de bord, le tableau prends la couleur indiquée à la position indiquée.
    assertions : 
        - i et j sont des coordonnées valides ( positives et plus petites que la taille max du tableau )
        - i et j représentent les coordonnées d'une ligne et non d'une case ou d'un point. 
        - i et j représentent les coordonnées d'une ligne qui n'est pas déjà coloriée *)

val change_coul : couleurs array array -> int -> int -> couleurs -> unit

(** fonction remplis_case
    - entrée : une matrice 2*2 de couleurs, deux entiers, une couleur
    - précondition : La matrice est le plateau, les deux entiers sont les coordonnées (ligne et colonne) du centre de la case.
    - sortie : booléen
    - postconditions : Renvoie true si une case a été remplie false sinon. Possède des effets de bord, le tableau prends la couleur indiquée à la position indiquée si la case est pleine.
    assertions : 
        - i et j sont des coordonnées valides ( positives et plus petites que la taille max du tableau )
        - i et j représentent les coordonnées d'une case et non d'un point ou d'une ligne *)

val remplis_case : couleurs array array -> int -> int -> couleurs -> bool
