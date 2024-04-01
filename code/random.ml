open Plateau

let pos_jouable (tab : couleurs array array) : (int*int) list =
(* Cette fonction permet de renvoyer sous forme de liste de couple d'entiers ou le bot peut jouer ie des cases de valeur Blanc *)
    
    let res = ref [] in 
    for i=0 to Array.length tab-1 do
        for j=0 to Array.length tab-1 do
        (* On parcourt le tableau *)
        
            if (tab.(i).(j) == Plateau.renvoi_blanc()) && ((i mod 2 == 0 && j mod 2 == 1) ||(i mod 2 == 1)&&(j mod 2 == 0)) then
            (* On vérifie que la case est bien de valeur Blanc et soit une case jouable ie un trait que l'on peut colorier *)
            
                res := !res@[(i,j)];
                (* On peut alors ajouter ce couple à la liste *)
                
        done;
    done;
    !res;;
    

let tete (coord : int * int) : int =
(* fonction qui permet de déconstruire un tuple pour renvoyer la première valeur *)

    match coord with
    | a,b -> a
    

let queue (coord : int * int) : int =
(* fonction qui permet également de déconstruire un tuple pour renvoyer la deuxième valeur *)

    match coord with
    | a,b -> b


let rec valide_pos (coord : int*int) (pos_possible : (int*int) list) : bool =
(* fonction qui permet de vérifier si les coordonnées entrées sont bien des coordonnées jouables *)

    match pos_possible with 
    | [] -> false
    (* si on est arrivé à la fin de la liste, on a pas trouvé les coordonnées donc on renvoie false *)
    
    | x::xs when (tete x == tete coord) && (queue x == queue coord) -> true || valide_pos coord xs
    (* si on trouve les mêmes coordonnées on peut renvoyer true et on effectue l'appel récursif *)
    
    |x::xs -> valide_pos coord xs
    (* sinon, on recherche dans la suite de la liste *)

let bot_random_joue ( tab : couleurs array array ) ( coul : couleurs ) : unit =
(* fonction qui permet de faire jouer le bot *)

let i = ref (Random.int (Array.length tab.(0))) in let j = ref (Random.int (Array.length tab.(0))) 
(* valeur i et j qui seront les coordonnées i j en lesquels le bot va jouer, générés de manière aléatoire *)

in let possibilite = pos_jouable tab in
(* cette variable correspond aux positions jouables dans le tableau actuel *)

 while (valide_pos (!i,!j) possibilite == false) do
 (* tant qu'on a pas de coordonnées valide, on modifie les valeurs de i et j *)
 
    i := Random.int (Array.length tab.(0));
    j := Random.int (Array.length tab.(0));
    
done;

change_coul tab !i !j coul;;
(* si les coordonnées sont valide, on peut changer la couleur à la position correspondante dans le tableau *)
