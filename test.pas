program test;

uses structures, Backend, crt;

procedure afficher_plateau (partie : Jeu);
var l,c : integer;
begin
	clrScr();
    writeln(partie.liste_paires[0][0]^.lettre);
	for l := 0 to partie.config.taille_grille - 1 do
	begin
		for c := 0 to partie.config.taille_grille - 1 do 
		begin
			if partie.liste_paires[l][c]^.decouverte = true then
				write(partie.liste_paires[l][c]^.lettre)
			else
				write('#');
		end;
		writeln();
	end;
end;

var
    l_paires: PPPPaire;
    config: Configuration;
    partie: Jeu;
begin
    config.taille_grille := 6;
    partie.config := config;
    creer_partie(l_paires, config);
    partie.liste_paires := l_paires;
    afficher_plateau(partie);
    freeMem(l_paires);
end.