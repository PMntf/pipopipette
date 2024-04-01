exception Break
exception Continue

let premier_elt_l (lst:(int*int) list):int = match lst with
  | [] -> failwith "liste vide"
  | (x,_)::xs -> x
  
let second_elt_l (lst:(int*int) list) = match lst with
  | [] -> failwith "liste vide"
  | (_,y)::xs -> y

let compte_cote (tab : Plateau.couleurs array array) (num_tab : int) (tab_indice : int) : (int * int) list =
  let lst_positions = ref [] in
  
  if tab.(num_tab).(tab_indice - 1) = Plateau.renvoi_blanc () then
    lst_positions := !lst_positions @ [(num_tab, tab_indice - 1)];
  if tab.(num_tab + 1).(tab_indice - 2) = Plateau.renvoi_blanc () then 
    lst_positions := !lst_positions @ [(num_tab + 1, tab_indice - 2)];
  if tab.(num_tab + 2).(tab_indice - 1) = Plateau.renvoi_blanc () then
    lst_positions := !lst_positions @ [(num_tab + 2, tab_indice - 1)]; 
  if tab.(num_tab + 1).(tab_indice) = Plateau.renvoi_blanc () then 
    lst_positions := !lst_positions @ [(num_tab + 1, tab_indice)]; 
  !lst_positions



let premiere_position (lst : (int * int) list) : int * int =
match lst with
|[] -> failwith "Il n'y a aucune position dans la liste"
|x::xs -> x

let joue_ia (tab : Plateau.couleurs array array) (joueur:Plateau.couleurs):unit =                   
  let premier_point = ref (compte_cote tab 0 2) in        (* Test premier point *)
  let taille_premier_point = ref (List.length !premier_point) in     (* Taille premier point *)
  try 
  for num_tab = 0 to 8 do 
    try
      if num_tab mod 2 = 1 then           (* S'il n'y a pas de point dans la ligne assiilée à un tableau *)
        raise Continue
      else 
        for indice = 2 to 10 do
          try
            if indice mod 2 = 1  then
              raise Continue              (* Eviter les non points et lignes sans points *)
            else 
            if !taille_premier_point = 0 then
              begin 
                premier_point := compte_cote tab num_tab indice;
                taille_premier_point := List.length !premier_point;
                raise Continue
              end;
            if !taille_premier_point = 1 then          (* S'il est possible de fermer un carre *)
              begin
                Plateau.change_coul tab (premier_elt_l !premier_point) (second_elt_l !premier_point) joueur;
                raise Break;
              end
              
            else
              let check_point = compte_cote tab num_tab indice in    (* La liste des côtés blanc au point *)
              let taille_check_point = List.length check_point in    (*  le nb de côtés blanc du point en haut à gauche (2ème colonne) *) 
              
              if taille_check_point = 1 then                 (* S'il le point testé permet de fermer un carré *)
                begin
                  taille_premier_point := 1;
                  premier_point := check_point
                end
              else if taille_check_point = 3 || taille_check_point = 4 then   (* S'il le point testé ne donne pas de point au joueur *) 
                  begin
                    taille_premier_point := taille_check_point;
                    premier_point := check_point
                  end;
          with Continue -> ();
        done
    with Continue -> ();
  done;
  Plateau.change_coul tab (premier_elt_l !premier_point) (second_elt_l !premier_point) joueur
  with Break -> ()  
