exception Break


let affiche_regle () = 
  print_string "\027[31mRègles du jeu :\027[0m\n";
  print_string "L'objectif de ce jeu est de capturer plus de cases que son adversaire.\n";
  print_string "\nà chacun de vos tours, vous devrez colorier une ligne noire avec votre couleur.\n";
  print_string "Pour celà vous devrez entrer les coordonnées de cette ligne. (cf annexe) \n";
  print_string "Si vous coloriez la 4ème ligne, ce qui complète la case, celle-ci prendra votre couleur et vous gagnerez un point.\n";
  print_string "De plus, vous pourrez rejouer au tour suivant. Dans l'autre cas, c'est à l'adversaire de jouer le prochain tour.\n";
  print_string "\n Voulez-vous plus d'informations sur comment colorier une ligne ? Si oui tapez o sinon faites \"entrer\" : ";
  if read_line () = "o" then 
    begin 
      print_string "\n\nPour colorier une ligne il faut tout d'abbord que celle-ci soit une ligne noire !\n";
      print_string "(On ne peut pas colorier un point ou une case, ni une ligne déjà colorée)\n";
      print_string "Une fois que vous avez trouver la ligne noire que vous souhaitez colorier, il va falloir entrer ses coordonnées.\n";
      print_string "Les coordonnées sont de la forme : CL avec C la colonne et L la ligne.\n";
      print_string "La colonne et la ligne sont notées sur le côté du plateau, "
    end


let joueur_joue (tab : Plateau.couleurs array array) (coul : Plateau.couleurs) : unit =
  assert (Plateau.est_bleu coul);
  let coordonnees = ref "" in
  let ligne = ref 0 in 
  let colonne = ref 0 in
  print_string("Quel trait voulez vous colorier ? : ");
  try
    while true do (* boucle qui ne termine pas tant que le joueur n'a pas entré des coordonnées correcte *)
      try 
        coordonnees := read_line ();
        assert(String.length !coordonnees = 2 || String.length !coordonnees = 3); (* Le tableau allant de 0 à 10, et ayant une lettre la coordonnées a une taille de 2 ou de 3 *)
        assert(int_of_char(!coordonnees.[0]) > 64 && int_of_char(!coordonnees.[0])<91); (* Le 1er caractère doit être une lettre majuscule entre A et Z *)
        assert(String.length !coordonnees = 2 || (int_of_char(!coordonnees.[2]) > 47 && int_of_char(!coordonnees.[2]) < 58));(* si la taille est de 3 alors le 3ème caractère doit être un chiffre. *)
        assert(int_of_char(!coordonnees.[1]) > 47 && int_of_char(!coordonnees.[1]) < 58);(* Le 2ème caractère doit être un chiffre aussi. *)
        ligne := int_of_string(String.sub !coordonnees 1 (String.length !coordonnees - 1)); (* récupère le nombre et le transforme en entier *)
        colonne := int_of_char(!coordonnees.[0])- 65; (* récupère la lettre et la passe en code ASCII. Enlève 65 pour que A devienne 0, B devienne 1 etc... *)
        Plateau.change_coul tab !ligne !colonne coul;
        raise Break (* si il n'y a pas eu d'erreurs -> sortie de boucle *)
      with Assert_failure _ -> print_string ("Les coordonnées ne sont pas bonnes ! \n")
    done
  with Break -> () 


let check_score (tab : Plateau.couleurs array array) (score : int) (joueur : Plateau.couleurs) : bool = 
  let score_actuel = ref 0 in
  for i = 0 to 4 do 
    for j = 0 to 4 do 
      if tab.(1 + 2*i).(1+2*j) = Plateau.renvoi_blanc () then 
        if Plateau.remplis_case tab (1 + 2*i) (1+2*j) joueur then incr score_actuel
        else ()
      else incr score_actuel
    done 
  done;
  score <> !score_actuel


let nouvelle_partie () =
  Random.self_init();
  (* initialistion du bot random *)
  let jeu = Plateau.creer_plateau (11) in
  print_string ("Bienvenue ! Quel est votre pseudonyme ?\n");
  let pseudo = read_line() in
  print_string ("Bonjour "^pseudo^" !\n");
  let difficulte = Sys.argv.(1) in

  print_string("Voulez-vous les règles du jeu ? Si oui écrivez o sinon faites \"entrer\" : ");
  if read_line () = "o" then affiche_regle ();
    
  let joueur = ref (Plateau.creer_couleur ()) in
  
  let score_bleu = ref 0 in (* score du joueur *)
  let score_rouge = ref 0 in (* score du bot ou joueur_2 *)

  for i = 1 to 60 do (* Dans ce plateau, il y a exactement 60 coups car 60 lignes. *)
    if Plateau.est_bleu !joueur then print_string("C'est au tour de "^pseudo^" !\n")
    else print_string("C'est au tour de bot "^ difficulte ^" !\n");
    Plateau.affiche jeu; (* affichage du plateau *)

    if Plateau.est_bleu !joueur then joueur_joue jeu !joueur
    else if difficulte = "random" then Random.bot_random_joue jeu !joueur
    else if difficulte = "ia" then Ia.joue_ia jeu !joueur
    else failwith "vous n'avez pas entré une difficulté valide";

        (* Vérification du score, si une case a été remplie ou non. *)
    let score_tmp = !score_bleu + !score_rouge in (* permets de voir si les scores ont changés. *)
        
    if check_score jeu score_tmp !joueur then (* Vérifie si le score a changé, si oui une case a été remplie et le joueur actuel peut rejouer un tour. *)
      if Plateau.est_bleu !joueur then incr score_bleu
      else incr score_rouge
    else joueur := Plateau.changer_couleur !joueur
  done;

  print_string ("Le gagnant de la partie est :\n");
  if !score_bleu > !score_rouge then print_string(pseudo ^" !\n")
  else print_string("Bot "^ difficulte ^" !\n");
  print_string ("Voici les scores :\n");
  print_string (pseudo ^" : "^ string_of_int(!score_bleu) ^"\n");
  print_string ("Bot "^ difficulte ^" : "^ string_of_int(!score_rouge)^"\n");
  print_string "Voici le plateau ! \n";
  Plateau.affiche jeu


let _ = nouvelle_partie ()
