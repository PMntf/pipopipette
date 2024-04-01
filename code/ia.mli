(** fonction premier_elt_l 
    - entrée : une liste de tuples d'entiers 
    - précondition : La liste est non vide
    - sortie : Un entier
    - postcondition : L'entier est le premier élément du premier tuple de la liste
    - assertions : 
        - la liste n'est pas vide *)

val premier_elt_l : (int * int) list -> int 
    
    
(** fonction second_elt_l 
    - entrée : une liste de tuples d'entiers 
    - précondition : La liste est non vide
    - sortie : Un entier
    - postcondition : L'entier est le deuxième élément du premier tuple de la liste
    - assertions : 
        - la liste n'est pas vide *)

val second_elt_l : (int * int) list -> int 
                                              
    
    (** fonction compte_cote 
    - entrée : une matrice remplie du type couleurs puis 2 entiers 
    - précondition : Aucune
    - sortie : une liste de couple d'entiers de la forme (ligne, colonne)::(ligne, colonne)
    - postcondition : les cases associées à la matrice repérées par les couples sont de contenu Blanc *)

val compte_cote : Plateau.couleurs array array -> int -> int -> (int * int) list 


(** fonction premiere_position
    - entrée : une liste de couple d'entiers de la forme (ligne, colonne)::(ligne, colonne)
    - précondition : la liste n'est pas vide
    - sortie : un couple d'entiers
    - postcondition : le couple d'entiers correspond au premier élement de la liste passée en paramètres.    
    - assertions : 
        - la liste n'est pas vide *)

val premiere_position : (int * int) list -> int * int
                                                           
                                                                              
(** foncition joue_ia
    - entrée : une matrice remplie du type couleurs et une couleur
    - précondition : aucune
    - sortie : aucune
    - postcondition : Un trait blanc du tableau a été changé en Rouge (symbolise le coup joué par l'ia) *)

val joue_ia : Plateau.couleurs array array -> Plateau.couleurs -> unit
