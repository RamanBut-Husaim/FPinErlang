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

-import(hopractice, [doubleAll/1, evens/1, product/1, zip/2, zip_with/3, zip_with2/3, zip2/2]).

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

zip_WhenTheListsAreEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, zip([], [])).

zip_WhenTheFirstListIsLongerThanSecond_ShouldProcessElementsAccordingToFirstListLength_test() ->
    L1 = [3, 4, 12, 5],
    L2 = [8, 11, 88, 7, 9, 8],
    Expected = [{3, 8}, {4, 11}, {12, 88}, {5, 7}],
    ?assertEqual(Expected, zip(L1, L2)).

zip_WhenTheSecondListIsLongerThanFirst_ShouldProcessElementsAccordingToSecondListLength_test() ->
    L1 = [3, 4, 12, 5, 19, 31],
    L2 = [8, 11, 88, 7],
    Expected = [{3, 8}, {4, 11}, {12, 88}, {5, 7}],
    ?assertEqual(Expected, zip(L1, L2)).

zip_WhenTheListsAreOfTheSameLength_ShouldProcessBothListsCompletely_test() ->
    L1 = [1, 14, 5, 8, 4],
    L2 = [8, 1, 12, 3, 5],
    Expected = [{1, 8}, {14, 1}, {5, 12}, {8, 3}, {4, 5}],
    ?assertEqual(Expected, zip(L1, L2)).

zip_with_WhenTheListsAreEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, zip_with(fun (X, Y) -> X + Y end, [], [])).

zip_with_WhenTheFirstListIsLongerThanSecond_ShouldProcessElementsAccordingToFirstListLength_test() ->
    L1 = [3, 4, 12, 5],
    L2 = [8, 11, 88, 7, 9, 8],
    Expected = [11, 15, 100, 12],
    ?assertEqual(Expected, zip_with(fun (X, Y) -> X + Y end, L1, L2)).

zip_with_WhenTheSecondListIsLongerThanFirst_ShouldProcessElementsAccordingToSecondListLength_test() ->
    L1 = [3, 4, 12, 5, 19, 31],
    L2 = [8, 11, 88, 7],
    Expected = [11, 15, 100, 12],
    ?assertEqual(Expected, zip_with(fun (X, Y) -> X + Y end, L1, L2)).

zip_with_WhenTheListsAreOfTheSameLength_ShouldProcessBothListsCompletely_test() ->
    L1 = [1, 14, 5, 8, 4],
    L2 = [8, 1, 12, 3, 5],
    Expected = [9, 15, 17, 11, 9],
    ?assertEqual(Expected, zip_with(fun (X, Y) -> X + Y end, L1, L2)).

zip_with2_WhenTheListsAreEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, zip_with2(fun (X, Y) -> X + Y end, [], [])).

zip_with2_WhenTheFirstListIsLongerThanSecond_ShouldProcessElementsAccordingToFirstListLength_test() ->
    L1 = [3, 4, 12, 5],
    L2 = [8, 11, 88, 7, 9, 8],
    Expected = [11, 15, 100, 12],
    ?assertEqual(Expected, zip_with2(fun (X, Y) -> X + Y end, L1, L2)).

zip_with2_WhenTheSecondListIsLongerThanFirst_ShouldProcessElementsAccordingToSecondListLength_test() ->
    L1 = [3, 4, 12, 5, 19, 31],
    L2 = [8, 11, 88, 7],
    Expected = [11, 15, 100, 12],
    ?assertEqual(Expected, zip_with2(fun (X, Y) -> X + Y end, L1, L2)).

zip_with2_WhenTheListsAreOfTheSameLength_ShouldProcessBothListsCompletely_test() ->
    L1 = [1, 14, 5, 8, 4],
    L2 = [8, 1, 12, 3, 5],
    Expected = [9, 15, 17, 11, 9],
    ?assertEqual(Expected, zip_with2(fun (X, Y) -> X + Y end, L1, L2)).

zip2_WhenTheListsAreEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, zip2([], [])).

zip2_WhenTheFirstListIsLongerThanSecond_ShouldProcessElementsAccordingToFirstListLength_test() ->
    L1 = [3, 4, 12, 5],
    L2 = [8, 11, 88, 7, 9, 8],
    Expected = [{3, 8}, {4, 11}, {12, 88}, {5, 7}],
    ?assertEqual(Expected, zip2(L1, L2)).

zip2_WhenTheSecondListIsLongerThanFirst_ShouldProcessElementsAccordingToSecondListLength_test() ->
    L1 = [3, 4, 12, 5, 19, 31],
    L2 = [8, 11, 88, 7],
    Expected = [{3, 8}, {4, 11}, {12, 88}, {5, 7}],
    ?assertEqual(Expected, zip2(L1, L2)).

zip2_WhenTheListsAreOfTheSameLength_ShouldProcessBothListsCompletely_test() ->
    L1 = [1, 14, 5, 8, 4],
    L2 = [8, 1, 12, 3, 5],
    Expected = [{1, 8}, {14, 1}, {5, 12}, {8, 3}, {4, 5}],
    ?assertEqual(Expected, zip2(L1, L2)).
