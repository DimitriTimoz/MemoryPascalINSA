program test;

uses structures, backend, ihm;


var
    partie: Jeu;
begin
    initialisation(partie);
    repeat
        tour(partie);
    until fin_partie(partie);    
    message_fin(partie);
end.