%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Mar 2017 5:55 PM
%%%-------------------------------------------------------------------
-module(check).
-author("Rakkatakka").

%% API
-export([nand_01/2, nand_02/2, nand_03/2, nand_04/2, square/2, foo/2, baz/1]).


nand_01(A, B) ->
    not(A) or not(B).

nand_02(A, B) ->
    not(A and B).

nand_03(A, B) ->
    not(A andalso B).

nand_04(A, B) ->
    (not(A) and B) or (not(B) and A).

square(_X,_Y) ->
    false;
square(X,X) ->
    true.

foo(_,[])              -> [];
foo(Y,[X|_]) when X==Y -> [X];
foo(Y,[X|Xs])          -> [X | foo(Y,Xs) ].

baz([])     -> [];
baz([X|Xs]) -> [X | baz(zab(X,Xs))].

zab(_,[])     -> [];
zab(N,[N|Xs]) -> zab(N,Xs);
zab(N,[X|Xs]) -> [X | zab(N,Xs)].


