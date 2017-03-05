%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 6:35 PM
%%%-------------------------------------------------------------------
-module(nub_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(nub, [nub/1]).

nub_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, nub([])).

nub_WhenTheListHasDuplicates_ShouldReturnUniqueValues_test() ->
    Data = [4, 2, 3, 2, 3, 8, 5, 5, 8],
    Expected = [4, 2, 3, 8, 5],
    ?assertEqual(Expected, nub(Data)).