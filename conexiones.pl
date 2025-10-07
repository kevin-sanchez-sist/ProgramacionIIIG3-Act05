esta_conectado(ciudad(vancouver), [con(edmonton, 16), con(calgary, 13)]).
esta_conectado(ciudad(edmonton), [con(saskatoon, 12)]).
esta_conectado(ciudad(saskatoon), [con(winnipeg, 20), con(calgary, 9)]).
esta_conectado(ciudad(winnipeg), []).
esta_conectado(ciudad(calgary), [con(edmonton, 4),con(regina, 14)]).
esta_conectado(ciudad(regina), [con(winnipeg, 4),con(saskatoon, 7)]).

% Verificar si existe una conexión directa entre dos ciudades
verificar_conexion(Ciudad1, Ciudad2) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(Ciudad2, _), Conexiones),!.

existe_conexion_costo(Ciudad1, Ciudad2, Costo) :-
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(Ciudad2, Costo), Conexiones).

tiene_aristas(Ciudad) :-
    esta_conectado(con(Ciudad), Conexiones),
    Conexiones \= [].

%costo conexion pasando por ciudad intermedia
costo_conexion(Ciudad1,Ciudad2,Costo):-
    esta_conectado(ciudad(Ciudad1),Conexiones1),
    member(con(Ciudadmedia,Costo1),Conexiones1),
    esta_conectado(ciudad(Ciudadmedia),Conexiones2),
    member(con(Ciudad2,Costo2),Conexiones2),
    Costo is Costo1+Costo2,!.



%pasando por ciudad intermedia
es_posible_ir_de(Ciudad1,Ciudad2) :-
    esta_conectado(ciudad(Ciudad1),Conexiones1),
    member(con(Ciudadmedia,_),Conexiones1),
    esta_conectado(ciudad(Ciudadmedia),Conexiones2),
    member(con(Ciudad2,_),Conexiones2),!.


%verificar si existe una conexion posible
existe_camino_entre(Ciudad1,Ciudad2,Costo) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(Ciudad2, Costo), Conexiones),!.

existe_camino_entre(Ciudad1,Ciudad2,Costo) :- 
    esta_conectado(ciudad(Ciudad1), Conexiones),
    member(con(Ciudadx, Costo1), Conexiones),
    existe_camino_entre(Ciudadx,Ciudad2,Costo2),
    Costo is Costo1 + Costo2,!.
