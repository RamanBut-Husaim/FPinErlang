%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 5:42 PM
%%%-------------------------------------------------------------------
-module(tailrecursion).
-author("Rakkatakka").

%% API
-export([fib/1, perfect/1]).

fib(0) ->
    0;
fib(1) ->
    1;
fib(X) when X > 1 ->
    fib(X - 2, 1, 0).

fib(0, AccumFirst, AccumSecond) ->
    AccumFirst + AccumSecond;
fib(X, AccumFirst, AccumSecond) when X > 0 ->
    fib(X - 1, AccumFirst + AccumSecond, AccumFirst).

perfect(X) when X < 6 ->
    false;
perfect(X) when X >= 6 ->
    perfect(X, 1, 2).

perfect(X, X, _) ->
    true;
perfect(X, _, Divisor) when (X / 2) < Divisor ->
    false;
perfect(X, SumSoFar, Divisor) ->
    if
        X rem Divisor == 0 ->
            perfect(X, SumSoFar + Divisor, Divisor + 1);
        true ->
            perfect(X, SumSoFar, Divisor + 1)
    end.


