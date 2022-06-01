program testss;


var 

    i: ^integer;

begin
    i := GetMem(sizeof(integer)*2);
    i[0] := 1;
end;
