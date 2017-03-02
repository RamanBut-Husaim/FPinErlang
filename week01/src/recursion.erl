%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 1:31 PM
%%%-------------------------------------------------------------------
-module(recursion).
-author("Rakkatakka").

%% API
-export([fib/1, pieces/1]).

fib(0) ->
    0;
fib(1) ->
    1;
fib(X) when X > 1 ->
    fib(X - 2) + fib(X - 1).

pieces(0) ->
    1;
pieces(X) when X > 0 ->
    X + pieces(X - 1).
