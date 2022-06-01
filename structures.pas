Unit structures;

    
interface
    type
        Position = record
            x: integer;
            y: integer;
        end;
        Paire = record
            lettre: char;
            decouverte: boolean;
        end;
        Configuration = record
            taille_grille: integer;
            nom: String;
        end;
        PPaire = ^Paire;
        PPPaire = ^PPaire;
        PPPPaire = ^PPPaire;
        Jeu = record
            config: Configuration;
            liste_paires: PPPPaire;
            curseur_position: Position;
            pos_retournee: Position;
            n_tour: integer;
        end;

implementation
end.