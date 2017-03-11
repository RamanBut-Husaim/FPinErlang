%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Mar 2017 2:23 PM
%%%-------------------------------------------------------------------
-module(funcres_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

%% API
-import(funcres, [compose/1, twice/2, iterate/1]).

compose_WhenAnEmptyListIsPassed_ShouldReturnFunctionThatReturnsTheElement_test() ->
    Actual = compose([]),
    Expected = fun (X) -> X end,
    ?assertEqual(Expected(12), Actual(12)).

compose_WhenTheFunctionsAreSpecified_ShouldApplyThemInCorrectOrder_test() ->
    Data = [fun (X) -> X + 2 end, fun(X) -> X * 2 end],
    Actual = compose(Data),
    Value = 12,
    Expected = 28,
    ?assertEqual(Expected, Actual(Value)).

twice_WhenTheFunctionIsSpecified_ShouldApplyItToTheArgumentTwice_test() ->
    Func = fun (X) -> X * 3 end,
    Data = 2,
    Expected = 18,
    ?assertEqual(Expected, twice(Func, Data)).

iterate_WhenTheNumberIsZero_ShouldReturnFunctionThatReturnsTheElement_test() ->
    Data = 12,
    Actual = iterate(0),
    Expected = 12,
    ?assertEqual(Expected, Actual(Data)).

iterate_WhenTheNumberIs3_ShouldReturnFunctionThatIteratesThreeTimes_test() ->
    Func = fun (X) -> X + 2 end,
    Data = 3,
    Actual = iterate(Data),
    ActualFunc = Actual(Func),
    Expected = 9,
    ?assertEqual(Expected, ActualFunc(Data)).
