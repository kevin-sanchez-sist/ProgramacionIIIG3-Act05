esta_conectado(ciudad(vancouver), [con(ciudad(edmonton), precio(16)), con(ciudad(calgary), precio(13))]).
esta_conectado(ciudad(edmonton), [con(ciudad(saskatoon), precio(12))]).
esta_conectado(ciudad(saskatoon), [con(ciudad(winnipeg), precio(20)), con(ciudad(calgary), precio(9))]).
esta_conectado(ciudad(winnipeg), []).
esta_conectado(ciudad(calgary), [con(ciudad(edmonton), precio(4)),con(ciudad(regina), precio(14))]).
esta_conectado(ciudad(regina), [con(ciudad(winnipeg), precio(4)),con(ciudad(saskatoon), precio(7))]).

% Verificar si existe una conexión directa entre dos ciudades
verificar_conexion(Ciudad1, Ciudad2) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(ciudad(Ciudad2),precio(_)), Conexiones),!.

existe_conexion_costo(Ciudad1, Ciudad2, Costo) :-
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(ciudad(Ciudad2), precio(Costo)), Conexiones).

tiene_aristas(Ciudad) :-
    esta_conectado(ciudad(Ciudad), Conexiones),
    Conexiones \= [].

%costo conexion pasando por ciudad intermedia
costo_conexion(Ciudad1,Ciudad2,Costo):-
    esta_conectado(ciudad(Ciudad1),Conexiones1),
    member(con(ciudad(Ciudadmedia),precio(Costo1)),Conexiones1),
    esta_conectado(ciudad(Ciudadmedia),Conexiones2),
    member(con(ciudad(Ciudad2),precio(Costo2)),Conexiones2),
    Costo is Costo1+Costo2,!.



%pasando por ciudad intermedia
es_posible_ir_de(Ciudad1,Ciudad2) :-
    esta_conectado(ciudad(Ciudad1),Conexiones1),
    member(con(ciudad(Ciudadmedia),precio(_)),Conexiones1),
    esta_conectado(ciudad(Ciudadmedia),Conexiones2),
    member(con(ciudad(Ciudad2),precio(_)),Conexiones2),!.


%verificar si existe una conexion posible
existe_camino_entre(Ciudad1,Ciudad2,Costo) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(ciudad(Ciudad2), precio(Costo)), Conexiones),!.

existe_camino_entre(Ciudad1,Ciudad2,Costo) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(ciudad(Ciudadx), precio(Costo1)), Conexiones),
    existe_camino_entre(Ciudadx,Ciudad2,Costo2),
    Costo is Costo1 + Costo2,!.
