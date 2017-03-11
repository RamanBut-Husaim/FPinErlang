%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Mar 2017 2:04 PM
%%%-------------------------------------------------------------------
-module(funcres).
-author("Rakkatakka").

%% API
-export([compose/1, twice/2, iterate/1]).

iterate(0) ->
    fun same/1;
iterate(N) when is_integer(N) andalso N >= 0 ->
    fun (F) -> iterate(F, N - 1, F) end.

iterate(_, 0, FAccum) ->
    FAccum;
iterate(Func, N, FAccum) ->
    iterate(Func, N - 1, compose(FAccum, Func)).

twice(Func, X) ->
    Twicer = compose([Func, Func]),
    Twicer(X).

compose([]) ->
    fun same/1;
compose([Func | Funcs]) ->
    lists:foldl(fun(X, Acc)-> compose(Acc, X) end, Func, Funcs).

compose(F,G) ->
    fun(X) -> G(F(X)) end.

same(X) ->
    X.