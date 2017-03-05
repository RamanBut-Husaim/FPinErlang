%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 6:17 PM
%%%-------------------------------------------------------------------
-module(nub).
-author("Rakkatakka").

%% API
-export([nub/1]).

nub(Data) ->
    nubTr(Data, [], gb_sets:new()).

nubTr([], Elements, _) ->
    lists:reverse(Elements);
nubTr([X | Xs], Elements, Set) ->
    case gb_sets:is_member(X, Set) of
        true -> nubTr(Xs, Elements, Set);
        _ -> nubTr(Xs,[X | Elements], gb_sets:add(X, Set))
    end.

