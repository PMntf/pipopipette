(** fonction pos_jouable
    - entrée : une matrice de couleurs
    - précondition : rien
    - sortie : une liste de couple d'entiers
    - postcondition : les éléments de la liste sont des positions dont la valeur est Blanc ie une position où l'on peut jouer
*)
val pos_jouable : Plateau.couleurs array array -> (int*int) list

(** fonction tete
    - entrée : un couple de type 'a
    - précondition : rien
    - sortie : une valeur 'a
    - postcondition : la valeur est la première valeur du couple
*)
val tete : int * int -> int

(** fonction queue
    - entrée : un couple de type int * int
    - précondition : aucune
    - sortie : une valeur 'a
    - postcondition : la valeur est la deuxième valeur du couple
*)
val queue : int * int -> int

(** fonction valide_pos
    - entrée : un couple d'entier et une liste de couple d'entier
    - précondition : aucune
    - sortie : un booléen
    - postcondition : la sortie indique si le couple est dans la liste ou non
*)
val valide_pos : (int*int) -> (int*int) list -> bool

(** fonction bot_random_joue
    - entrée : une matrice de couleurs et une couleurs
    - précondition : aucune
    - sortie : unit
    - postoncondition : effet de bord, le tableau est modifié
*)
val bot_random_joue : Plateau.couleurs array array -> Plateau.couleurs -> unit
