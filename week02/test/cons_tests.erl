%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 8:16 PM
%%%-------------------------------------------------------------------
-module(cons_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(cons, [join/2, concat/1, member/2, mergeSort/1, qsort/1, isort/1, permute/1]).

join_WhenTheSecondListIsEmpty_ShouldReturnTheFirstList_test() ->
    First = [3, 1, 2, 4],
    Second = [],
    Expected = First,
    ?assertEqual(Expected, join(First, Second)).

join_WhenTheFirstListIsEmpty_ShouldReturnTheSecondList_test() ->
    First = [],
    Second = [1, 2, 9, 2, 3],
    Expected = Second,
    ?assertEqual(Expected, join(First, Second)).

join_WhenTheListsAreSpecified_ShouldJoinCorrectly_test() ->
    First = "abc",
    Second = "hello",
    Expected = "abchello",
    ?assertEqual(Expected, join(First, Second)).

concat_WhenTheEmptyListIsPassed_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, concat([])).

concat_WhenTheListWithElementsIsSpecified_ShouldConcatCorrectly_test() ->
    Data = ["for", " ", "the", " ", "greater", " ", "good"],
    Expected = "for the greater good",
    ?assertEqual(Expected, concat(Data)).

member_WhenTheListIsEmpty_ShouldReturnFalse_test() ->
    Expected = false,
    ?assertEqual(Expected, member(10, [])).

member_WhenThereIsNoElementInTheList_ShouldReturnFalse_test() ->
    Data = [10, 13, 88, 11, 27],
    Element = 9,
    Expected = false,
    ?assertEqual(Expected, member(Element, Data)).

member_WhenTheElementExistsInTheList_ShouldReturnTrue_test() ->
    Data = [10, 11, 772, 112, 747, 71, 666],
    Element = 666,
    Expected = true,
    ?assertEqual(Expected, member(Element, Data)).

mergeSort_WhenTheEmptyListIsPassed_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, mergeSort([])).

mergeSort_WhenListWithOneElementIsPassed_ShouldReturnListWithOneElement_test() ->
    Data = [1],
    Expected = Data,
    ?assertEqual(Expected, mergeSort(Data)).

mergeSort_WhenListWithEvenNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [2, 1],
    Expected = [1, 2],
    ?assertEqual(Expected, mergeSort(Data)).

mergeSort_WhenListWithOddNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [3, 2, 1],
    Expected = [1, 2, 3],
    ?assertEqual(Expected, mergeSort(Data)).

qsort_WhenTheEmptyListIsPassed_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, qsort([])).

qsort_WhenListWithOneElementIsPassed_ShouldReturnListWithOneElement_test() ->
    Data = [1],
    Expected = Data,
    ?assertEqual(Expected, qsort(Data)).

qsort_WhenListWithEvenNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [2, 1],
    Expected = [1, 2],
    ?assertEqual(Expected, qsort(Data)).

qsort_WhenListWithOddNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [3, 2, 1],
    Expected = [1, 2, 3],
    ?assertEqual(Expected, qsort(Data)).

isort_WhenTheEmptyListIsPassed_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, isort([])).

isort_WhenListWithOneElementIsPassed_ShouldReturnListWithOneElement_test() ->
    Data = [1],
    Expected = Data,
    ?assertEqual(Expected, isort(Data)).

isort_WhenListWithEvenNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [2, 1],
    Expected = [1, 2],
    ?assertEqual(Expected, isort(Data)).

isort_WhenListWithOddNumberOfElementsIsPassed_ShouldSortCorrectly_test() ->
    Data = [3, 2, 1],
    Expected = [1, 2, 3],
    ?assertEqual(Expected, isort(Data)).

permute_WhenTheEmptyListIsPassed_ShouldReturnCorrectValue_test() ->
    Expected = [[]],
    ?assertEqual(Expected, permute([])).

permute_WhenTheValueIsPassed_ShouldReturnCorrectResult_test() ->
    Data = [1,2,3],
    Expected = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]],
    ?assertEqual(Expected, permute(Data)).