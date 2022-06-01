program test;

uses structures, backend, ihm;


var
    partie: Jeu;
begin
    initialisation(partie);
    repeat
        tour(partie);
    until True;    
    message_fin(partie);

end.