%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 1:34 PM
%%%-------------------------------------------------------------------
-module(recursion_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(recursion, [fib/1, pieces/1]).

fib_WhenTheValueIs0_ShouldReturn0_test() ->
    ?assert(0 == fib(0)).

fib_WhenTheValueIs1_ShouldReturn1_test() ->
    ?assert(1 == fib(1)).

fib_WhenTheValueIs4_ShouldReturn3_test() ->
    ?assertEqual(3, fib(4)).

fib_WhenTheValueIs6_ShouldReturn8_test() ->
    ?assertEqual(8, fib(6)).

pieces_WhenTheValueIs0_ShouldReturn0_test() ->
    ?assertEqual(1, pieces(0)).

pieces_WhenTheValueIs1_ShouldReturn2_test() ->
    ?assertEqual(2, pieces(1)).

pieces_WhenTheValueIs3_ShouldReturn7_test() ->
    ?assertEqual(7, pieces(3)).