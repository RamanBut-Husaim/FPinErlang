%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2017 10:01 PM
%%%-------------------------------------------------------------------
-module(hopractice).
-author("Rakkatakka").

%% API
-export([doubleAll/1, evens/1, product/1]).

doubleAll(X) when is_list(X) ->
    lists:map(fun (El) -> El * 2 end, X).

evens(X) when is_list(X) ->
    lists:filter(fun (El) -> El rem 2 == 0 end, X).

product(X) when is_list(X) ->
    lists:foldr(fun (El, Accum) -> El * Accum end, 1, X).
