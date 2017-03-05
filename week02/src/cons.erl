%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 8:16 PM
%%%-------------------------------------------------------------------
-module(cons).
-author("Rakkatakka").

%% API
-export([join/2, concat/1, member/2, mergeSort/1, qsort/1, isort/1, permute/1]).

join(First, Second) ->
    joinTl(lists:reverse(First), Second).

joinTl(First, []) ->
    lists:reverse(First);
joinTl(First, [X | Xs]) ->
    joinTl([X | First], Xs).

concat([]) ->
    [];
concat(X) ->
    concatTl(X, []).

concatTl([], Result) ->
    Result;
concatTl([X | Xs], Result) ->
    concatTl(Xs, join(Result, X)).

member(_X, []) ->
    false;
member(X, [X | _]) ->
    true;
member(X, [_Y | XS]) ->
    member(X, XS).

mergeSort([]) ->
    [];
mergeSort(L) when length(L) == 1 ->
    L;
mergeSort(L) when length(L) > 1 ->
    {L1, L2} = lists:split(length(L) div 2, L),
    lists:merge(mergeSort(L1), mergeSort(L2)).

qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

isort(L) -> lists:foldl(fun insert/2, [], L).

insert(X,[]) -> [X];
insert(X, L = [H | _]) when X =< H -> [X | L];
insert(X, [H | T]) -> [H | insert(X, T)].

permute([]) -> [[]];
permute(L) -> [[X|Y] || X <- L, Y <- permute(L -- [X])].
