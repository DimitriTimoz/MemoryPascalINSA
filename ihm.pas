unit ihm;
    
interface

uses
    structures, crt;

procedure demander_parametres (var config : Configuration);
procedure afficher_plateau (partie : Jeu);
procedure sauvegarder_stats (partie : Jeu); 
procedure message_fin (partie : Jeu);

implementation
	
procedure sauvegarder_stats (partie : Jeu); 
var 
    ft: Text;
    nom_fichier: String;
begin
    nom_fichier := 'resultats.txt'; 
    assign(ft, nom_fichier);
    rewrite(ft); 
    writeln(ft,'Le joueur est ', partie.config.nom, '. Son score est ', partie.n_tour, '.'); (* TODO: Ajouter des caractères de décoration ex: ---///--- *)
    close(ft);
end; 

procedure message_fin (partie : Jeu);
begin 
    writeln('Votre score est ', partie.n_tour); (* TODO: changer score par "nombre de tour" ? *)
    if partie.n_tour < 19 then
        writeln('Tu es un giga crack pose ce clavier de suite')
    else if partie.n_tour < 31 then 
        writeln('Tu es bon, bravo !')
    else if partie.n_tour < 100 then 
        writeln('Un ethylotest vous est necessaire')
    else 
        writeln('Bravo, tu es tellement une merde que tu viens de dÃ©couvrir ce message'); 
    sauvegarder_stats(partie);
end;

procedure demander_parametres (var config : Configuration);
var 
    mode: char;
begin
    (*TODO si temps suffisant système flèche haute / flèche basse pour changer la sélection  *)
	config.nom := '';
	writeln('Choisissez votre nom de joueur');
	readln(config.nom);
	writeln('Voulez vous jouer en mode facile ou difficile ?');
	writeln('1 : facile');
	writeln('2 : difficile');
	readln(mode);
	case mode of 
		'1' : config.taille_grille := 4;
		'2' : config.taille_grille := 6;
	end;
end;

procedure afficher_plateau (partie : Jeu);
var 
    l, c: integer;
begin
    (* TODO: Afficher la carte à la position partie.curseur_position si les positions sont positives *)
    (* TODO: Ajouter des espaces, (encadrer le plateau ??)*)
    (* TODO: Afficher la position du curseur ??)*)

	clrScr();
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

end.