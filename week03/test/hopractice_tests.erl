%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2017 10:06 PM
%%%-------------------------------------------------------------------
-module(hopractice_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(hopractice, [doubleAll/1, evens/1, product/1]).

doubleAll_WhenEmptyListIsPassed_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, doubleAll([])).

doubleAll_WhenElementsArePresentInTheList_ShouldDoubleEachOfThem_test() ->
    Data = [3, -10, 4, 0, 12],
    Expected = [6, -20, 8, 0, 24],
    ?assertEqual(Expected, doubleAll(Data)).

evens_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, evens([])).

evens_WhenTheListHasEvenNumbers_ShouldLeaveOnlyThem_test() ->
    Data = [3, 5, 2, 18, 7, 9, 4, 6],
    Expected = [2, 18, 4, 6],
    ?assertEqual(Expected, evens(Data)).

product_WhenTheListIsEmpty_ShouldReturn1_test() ->
    Expected = 1,
    ?assertEqual(Expected, product([])).

product_WhenTheListIsNonEmpty_ShouldFindTheElementProduct_test() ->
    Data = [3, 5, 2, 4, 10],
    Expected = 1200,
    ?assertEqual(Expected, product(Data)).
