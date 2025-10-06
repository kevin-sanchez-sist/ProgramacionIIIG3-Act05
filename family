papa_de(hombre(abraham),[hombre(homero),hombre(herbert)]).

papa_de(hombre(clancy),[mujer(marge),mujer(patty),mujer(selma)]).

papa_de(hombre(homero),[mujer(lisa),hombre(bart),mujer(maggie)]).

mama_de(mujer(mona),[hombre(homero)]).

mama_de(mujer(jacqueline),[mujer(marge),mujer(patty),mujer(selma)]).

mama_de(mujer(marge),[hombre(bart),mujer(lisa),mujer(maggie)]).

mama_de(mujer(selma),[mujer(ling)]).

abuelo_de(Abuelo, Nieto) :-
    papa_de(hombre(Abuelo), Hijos),
    member(Hijo, Hijos),
    (papa_de(Hijo, Nietos); mama_de(Hijo, Nietos)),
    (member(hombre(Nieto), Nietos); member(mujer(Nieto), Nietos)).


abuela_de(Abuela, Nieto) :-
    mama_de(mujer(Abuela), Hijos),
    member(Hijo, Hijos),
    (papa_de(Hijo, Nietos); mama_de(Hijo, Nietos)),
    (member(hombre(Nieto), Nietos); member(mujer(Nieto), Nietos)).


hermano_de(Hermano1, Hermano2) :-
    (papa_de(_, Hijos); mama_de(_, Hijos)),
    member(hombre(Hermano1), Hijos),
    (member(mujer(Hermano2), Hijos) ; member(hombre(Hermano2), Hijos)),
    Hermano1 \= Hermano2.

hermana_de(Hermana, Hermano2) :-
    (papa_de(_, Hijos); mama_de(_, Hijos)),
    member(mujer(Hermana), Hijos),
    (member(mujer(Hermano2), Hijos) ; member(hombre(Hermano2), Hijos)),
    Hermana \= Hermano2.

tio_de(Tio, Sobrino) :-
    hermano_de(Tio, Hermano),
    (papa_de(hombre(Hermano), Hijos); mama_de(mujer(Hermano), Hijos)),
    (member(hombre(Sobrino), Hijos); member(mujer(Sobrino), Hijos)).

tia_de(Tia, Sobrino) :-
    hermana_de(Tia, Hermano),
    (papa_de(hombre(Hermano), Hijos); mama_de(mujer(Hermano), Hijos)),
    (member(hombre(Sobrino), Hijos); member(mujer(Sobrino), Hijos)).

primo_de(Primo1, Primo2) :-
    (papa_de(hombre(Padre1), Hijos1); mama_de(mujer(Padre1), Hijos1)),
    (papa_de(hombre(Padre2), Hijos2); mama_de(mujer(Padre2), Hijos2)),
    member(hombre(Primo1), Hijos1),
    (member(hombre(Primo2), Hijos2); member(mujer(Primo2), Hijos2)),
    (hermano_de(Padre1, Padre2); hermana_de(Padre1, Padre2)).

prima_de(Primo1, Primo2) :-
    (papa_de(hombre(Padre1), Hijos1); mama_de(mujer(Padre1), Hijos1)),
    (papa_de(hombre(Padre2), Hijos2); mama_de(mujer(Padre2), Hijos2)),
    member(mujer(Primo1), Hijos1),
    (member(hombre(Primo2), Hijos2); member(mujer(Primo2), Hijos2)),
    (hermano_de(Padre1, Padre2); hermana_de(Padre1, Padre2)).

son_esposos(Padre, Madre) :-
    papa_de(hombre(Padre), HijosPadre),
    mama_de(mujer(Madre), HijosMadre),
    member(Hijo, HijosPadre),
    member(Hijo, HijosMadre), !.

