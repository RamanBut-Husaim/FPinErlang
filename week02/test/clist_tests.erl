%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 1:27 PM
%%%-------------------------------------------------------------------
-module(clist_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(constructinglists, [double/1, evens/1, median/1, mode/1]).

double_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, double([])).

double_WhenTheListHasElements_ShouldDoubleThemCorrectly_test() ->
    Data = [-10, 3, 4, 16],
    Expected = [-20, 6, 8, 32],
    ?assertEqual(Expected, double(Data)).

evens_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, evens([])).

evens_WhenTheListHasElements_ShouldReturnOnlyEvenNumbers_test() ->
    Data = [7, 2, 3, 12, 4, 18, 21],
    Expected = [2, 12, 4, 18],
    ?assertEqual(Expected, evens(Data)).

median_WhenTheListIsEmpty_ShouldReturnError_test() ->
    ?assertError(function_clause, median([])).

median_WhenTheListContainsEvenNumberOfElements_ShouldCalculateMedianCorrectly_test() ->
    Data = [8, 1, 2 ,3, 12, 7, 9, 5],
    Expected = 6.0,
    ?assertEqual(Expected, median(Data)).

median_WhenTheListContainsOddNumberOfElements_ShouldCalculateMedianCorrectly_test() ->
    Data = [8, 1, 2 ,3, 12, 7, 9],
    Expected = 7.0,
    ?assertEqual(Expected, median(Data)).

mode_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, mode([])).

mode_WhenTheListContainsTheSameElement_ShouldReturnListWithThisElement_test() ->
    Data = [1, 1, 1, 1, 1, 1, 1],
    Expected = [1],
    ?assertEqual(Expected, mode(Data)).

mode_WhenTheListContainsDifferentElements_ShouldReturnListInCorrectOrder_test() ->
    Data = [1, 1, 3, 3, 3, 3, 2, 2, 2, 5, 5, 5, 5, 5, 6, 6],
    Expected = [5, 3, 2, 1, 6],
    ?assertEqual(Expected, mode(Data)).

