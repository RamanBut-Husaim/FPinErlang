%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 6:09 PM
%%%-------------------------------------------------------------------
-module(tailrecursion_tests).
-author("Rakkatakka").

-include_lib("eunit/include/eunit.hrl").

-import(tailrecursion, [fib/1, perfect/1]).

fib_WhenTheValueIs0_ShouldReturn0_test() ->
    ?assertEqual(0, fib(0)).

fib_WhenTheValueIs1_ShouldReturn1_test() ->
    ?assertEqual(1, fib(1)).

fib_WhenTheValueIs2_ShouldReturn1_test() ->
    ?assertEqual(1, fib(2)).

fib_WhenTheValueIs3_ShouldReturn2_test() ->
    ?assertEqual(2, fib(3)).

fib_WhenTheValueIs4_ShouldReturn3_test() ->
    ?assertEqual(3, fib(4)).

perfect_WhenTheValueIs0_ShouldReturnFalse_test() ->
    ?assertEqual(false, perfect(0)).

perfect_WhenTheValueIsNegative_ShouldReturnFalse_test() ->
    ?assertEqual(false, perfect(-10)).

perfect_WhenTheValueIs6_ShouldReturnTrue_test() ->
    ?assertEqual(true, perfect(6)).

perfect_WhenTheValueIs496_ShouldReturnTrue_test() ->
    ?assertEqual(true, perfect(496)).

perfect_WhenTheValueIs8128_ShouldReturnTrue_test() ->
    ?assertEqual(true, perfect(8128)).

perfect_WhenTheValueIs1822_ShouldReturnFalse_test() ->
    ?assertEqual(false, perfect(1822)).
