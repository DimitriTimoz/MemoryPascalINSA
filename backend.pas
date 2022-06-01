unit Backend;


interface
uses structures, crt;


procedure creer_partie(var l_paires: PPPPaire; config: Configuration);
    
implementation
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
                n := (i)*config.taille_grille + j + 1;
                if n mod 2 = 1 then
                begin
                    // demande à stocker une paire
                    tmp_paire := GetMem(sizeof(Paire));
                    tmp_paire^.decouverte := true;
                    tmp_paire^.lettre := chr(ord('a') + n div 2 );
          
                end;
                l_paires[i][j] := tmp_paire;
                writeln(i, ' ', j, ' :', l_paires[i][j]^.lettre);
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
end.