unit Backend;


interface

uses structures, crt, ihm;

CONST UP = #72;
	DOWN = #80;
	LEFT = #75;
	RIGHT = #77;
	

procedure initialisation(var partie: Jeu);
procedure creer_partie(var l_paires: PPPPaire; config: Configuration);
    
procedure tour(var partie : Jeu);
procedure action(var partie : Jeu);
procedure retourner(var partie : Jeu);

function fin_partie(partie: Jeu): boolean;

implementation

    function fin_partie(partie: Jeu): boolean;
    var
        i, j: integer;
    begin
        fin_partie := True;
        for i := 0 to partie.config.taille_grille - 1 do
        begin
            for j := 0 to partie.config.taille_grille - 1 do
            begin
                if not(partie.liste_paires[i][j]^.decouverte) then 
                    fin_partie := False;
            end;
        end;
        if fin_partie then
            for i := 0 to partie.config.taille_grille - 1 do
                for j := 0 to partie.config.taille_grille - 1 do
                    freeMem(partie.liste_paires[i][j]);

        fin_partie := fin_partie or partie.fin;
    end;

    procedure creer_partie(var l_paires: PPPPaire; config: Configuration);
    var
        n, i, j: integer;
        tmp_paire: ^Paire;
        p: Position;
    begin
        (* Initialisation des paires sur le plateau *)
        l_paires := GetMem(sizeof(PPPaire) * config.taille_grille);    
        for i := 0 to config.taille_grille - 1 do
        begin
            l_paires[i] := GetMem(sizeof(PPaire) * config.taille_grille);
            for j := 0 to config.taille_grille - 1 do
            begin
                n := i * config.taille_grille + j + 1;
                if n mod 2 = 1 then
                begin
                    // demande à stocker une paire
                    tmp_paire := GetMem(sizeof(Paire));
                    tmp_paire^.decouverte := false;
                    tmp_paire^.lettre := chr(ord('a') + n div 2 );
          
                end;
                l_paires[i][j] := tmp_paire;
            end;
        end;

        (* Mélange des cartes *)
        randomize();
        
        for i := 0 to config.taille_grille - 1 do
        begin
            for j := 0 to config.taille_grille - 1 do
            begin
                // Récupère une position aléatoire
                p.x := random(config.taille_grille);
                p.y := random(config.taille_grille);
                
                // Intervertit les cartes
                tmp_paire := l_paires[p.x][p.y];
                l_paires[p.x][p.y] := l_paires[i][j];
                l_paires[i][j] := tmp_paire;
            end;
        end;
    end;

    procedure initialisation(var partie: Jeu);
    begin
        demander_parametres(partie.config);
        creer_partie(partie.liste_paires, partie.config);
    end;

    procedure tour(var partie: Jeu);
    begin
        action(partie);
        afficher_plateau(partie);
    end;

    procedure action(var partie: Jeu);
    var
        touche_pressee : Char;
        new_pos : Position;
    begin
        repeat
            begin
                touche_pressee := readkey;
                case touche_pressee of
                    UP : new_pos.y := partie.curseur_position.y - 1;
                    DOWN: new_pos.y := partie.curseur_position.y + 1;
                    LEFT : new_pos.x := partie.curseur_position.x - 1;
                    RIGHT : new_pos.x := partie.curseur_position.x + 1;
                end;
                if (new_pos.y >= 0) or (new_pos.y < partie.config.taille_grille) then
                    partie.curseur_position.y := new_pos.y
                else if (new_pos.x >= 0) or (new_pos.x < partie.config.taille_grille) then
                    partie.curseur_position.x := new_pos.x;
            end;
        until (touche_pressee = 'q') or (touche_pressee = 'e');
        if touche_pressee = 'e' then
            retourner(partie);
    end;

    procedure retourner(var partie : Jeu);
    begin
       // partie.liste_paires[partie.curseur_position.x][partie.curseur_position.y].decouverte:=True;
    end;
end.

