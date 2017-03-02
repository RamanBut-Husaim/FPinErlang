%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 12:41 PM
%%%-------------------------------------------------------------------
-module(factorial).
-author("Rakkatakka").

%% API
-export([fac/1]).

fac(0) ->
    1;
fac(N) when N > 0 ->
    fac(N-1) * N.
