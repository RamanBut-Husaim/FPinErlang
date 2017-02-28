%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Feb 2017 9:48 PM
%%%-------------------------------------------------------------------
-module(pm).
-author("Rakkatakka").

%% API
-export([xOr/2, xOr2/2, xOr3/2, maxOfThree/3, howManyEqual/3]).

xOr(X, Y) ->
    X =/= Y.

xOr2(X, Y) ->
    not(X == Y).

xOr3(A,B) ->
    (not A and B)or(not B and A).

maxOfThree(X, Y, Z) ->
    max(max(X, Y), Z).

howManyEqual(X, X, X) ->
    3;
howManyEqual(X, X, _) ->
    2;
howManyEqual(X, _, X) ->
    2;
howManyEqual(_, X, X) ->
    2;
howManyEqual(_, _, _) ->
    0.
