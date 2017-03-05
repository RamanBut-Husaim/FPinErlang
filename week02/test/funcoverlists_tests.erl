%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 12:31 PM
%%%-------------------------------------------------------------------
-module(funcoverlists_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(funcoverlists, [product/1, product_rec/1, maximum/1, maximum_rec/1]).

product_WhenTheListIsEmpty_ShouldReturn1_test() ->
    Expected = 1,
    ?assertEqual(Expected, product([])).

product_WhenTheListHasValues_ShouldReturnCorrectResult_test() ->
    Data = [3, 2, 11],
    Expected = 3 * 2 * 11,
    ?assertEqual(Expected, product(Data)).

product_rec_WhenTheListIsEmpty_ShouldReturn1_test() ->
    Expected = 1,
    ?assertEqual(Expected, product_rec([])).

product_rec_WhenTheListHasValues_ShouldReturnCorrectResult_test() ->
    Data = [3, 2, 11],
    Expected = 3 * 2 * 11,
    ?assertEqual(Expected, product_rec(Data)).

maximum_WhenTheListIsEmpty_ShouldReturnError_test() ->
    ?assertError(function_clause, maximum([])).

maximum_WhenTheListContainsOneElement_ShouldReturnThisElement_test() ->
    Data = [13],
    Expected = 13,
    ?assertEqual(Expected, maximum(Data)).

maximum_WhenTheListIsFullOfData_ShouldReturnCorrectMaximumElement_test() ->
    Data = [-13, 18, 22, 4, 81],
    Expected = 81,
    ?assertEqual(Expected, maximum(Data)).

maximum_rec_WhenTheListIsEmpty_ShouldReturnError_test() ->
    ?assertError(function_clause, maximum_rec([])).

maximum_rec_WhenTheListContainsOneElement_ShouldReturnThisElement_test() ->
    Data = [13],
    Expected = 13,
    ?assertEqual(Expected, maximum_rec(Data)).

maximum_rec_WhenTheListIsFullOfData_ShouldReturnCorrectMaximumElement_test() ->
    Data = [-13, 18, 22, 4, 81],
    Expected = 81,
    ?assertEqual(Expected, maximum_rec(Data)).
