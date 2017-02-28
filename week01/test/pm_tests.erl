%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Feb 2017 10:10 PM
%%%-------------------------------------------------------------------
-module(pm_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(pm, [maxOfThree/3, howManyEqual/3]).

maxOfThree_WhenAllValuesAreEqual_ShouldReturnCorrectValue_test() ->
    12 = maxOfThree(12, 12, 12).

maxOfThree_WhenTheValuesAreDifferent_ShouldReturnCorrectValue_test() ->
    33 = maxOfThree(14, 28, 33).

howManyEqual_WhenAllValuesAreEqual_ShouldReturn3_test() ->
    3 = howManyEqual(3, 3, 3).

howManyEqual_WhenTwoValuesAreEqual_ShouldReturn2_test() ->
    ?assert(2 == howManyEqual(3, 3, 4)),
    ?assert(2 == howManyEqual(3, 4, 3)),
    ?assert(2 == howManyEqual(4, 3, 3)).

howManyEqual_WhenAllValuesAreDifferent_ShouldReturn0_test() ->
    ?assert(0 == howManyEqual(3, 1, 2)).
