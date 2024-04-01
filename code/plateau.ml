type couleurs = Rouge | Bleu | Blanc | Point


let creer_couleur ():couleurs = Bleu


let renvoi_blanc ():couleurs = Blanc 


let changer_couleur (coul:couleurs):couleurs =
    if coul = Bleu then Rouge else Bleu


let est_bleu (coul:couleurs):bool = coul = Bleu


let creer_plateau (taille:int)= 
    assert(taille > 0 && taille mod 2 = 1);
    let tab = Array.make_matrix taille taille Blanc in
    for i = 0 to taille - 1 do
    for j = 0 to taille - 1 do
        if i mod 2 = 0 && j mod 2 = 0 then tab.(i).(j) <- Point
    done;
    done; tab


let affiche (tab:couleurs array array):unit = 
    print_string ("  ");
    for i = 0 to Array.length tab - 1 do 
        print_char (char_of_int(i + 65))
    done;
    print_newline();
    for i = 0 to Array.length tab - 1 do 
    print_int i;
    if i < 10 then print_string " ";
    for j = 0 to Array.length tab - 1 do
        if tab.(i).(j) = Point then print_string "○"
        else if tab.(i).(j) = Blanc then
            if i mod 2 = 1 then 
                if j mod 2 = 1 then print_string "□"
                else print_string "|"
            else print_string "-"
        else if tab.(i).(j) = Rouge then 
            if i mod 2 = 1 then 
                if j mod 2 = 1 then print_string "\027[31m□\027[0m"
                else print_string "\027[31m|\027[0m"
            else print_string "\027[31m-\027[0m"
        else if i mod 2 = 1 then 
                if j mod 2 = 1 then print_string "\027[34m□\027[0m"
                else print_string "\027[34m|\027[0m"
            else print_string "\027[34m-\027[0m"
    done; print_newline ();
    done


let change_coul (tab:couleurs array array) (i:int) (j:int) (coul:couleurs):unit = 
    assert(i >= 0 && j >= 0 && i < Array.length(tab) && j < Array.length(tab));
    assert(i mod 2 <> 0 || j mod 2 <> 0);
    assert(i mod 2 <> 1 || j mod 2 <> 1);
    (*assert(tab.(i).(j) = Blanc);*)
    tab.(i).(j) <- coul


let remplis_case (tab:couleurs array array) (i:int) (j:int) (coul:couleurs):bool =
    let remplis = ref false in
    assert(i > 0 && j > 0 && i < Array.length(tab) && j < Array.length(tab));
    assert(i mod 2 = 1 && j mod 2 = 1);
    if (tab.(i+1).(j) <> Blanc && tab.(i-1).(j) <> Blanc && tab.(i).(j+1) <> Blanc && tab.(i).(j-1) <> Blanc) then
    begin
        tab.(i).(j) <- coul;
        remplis := true
    end;
    !remplis