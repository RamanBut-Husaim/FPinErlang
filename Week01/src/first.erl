%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Feb 2017 11:36 PM
%%%-------------------------------------------------------------------
-module(first).
-author("Rakkatakka").

%% API
-export([double/1, mult/2, area/3]).

mult(X, Y) ->
    X * Y.

double(X) ->
    mult(2, X).

area(A, B, C) ->
    S = (A + B + C) / 2,
    math:sqrt(S * (S - A) * (S - B) * (S - C)).