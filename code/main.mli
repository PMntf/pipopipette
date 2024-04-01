(** fonction affiche_regle 
    - entrée : aucune 
    - précondition : aucne
    - sortie : couleur
    - postcondition : Les règles ont été affichées. *)

val affiche_regle : unit -> unit 

  
(** fonction joueur_joue
    - entrée : Une matrice de couleurs et une couleur
    - précondition : La couleur est Bleu
    - sortie : Aucune
    - postcondition : Le côté choisi par l'utilisateur est changé en Bleu
    - assertions : 
        - La couleur est Bleu *)

val joueur_joue : Plateau.couleurs array array -> Plateau.couleurs -> unit


(** fonction check_score
    - entrée : Une matrice de couleurs, un entier et une couleur
    - précondition : la couleur est Rouge ou Bleu
    - sortie : un booléen 
    - postcondition : renvoie true si un carré a pu être complété et donc le joueur de couleur passé en paramètre à marqué un point. *)

val check_score : Plateau.couleurs array array -> int -> Plateau.couleurs -> bool



(** fonction nouvelle_partie
    - entrée : aucune
    - précondition : aucune
    - sortie : aucune
    - postcondition : une partie a été jouée intégralement. 
    - assertions : 
        - arrête le programme si la difficulté choisi à l'execution ne correspond ni à "random" ni à "ia" *)

val nouvelle_partie : unit -> unit
  




