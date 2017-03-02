%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Mar 2017 12:42 PM
%%%-------------------------------------------------------------------
-module(factorial_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(factorial, [fac/1]).

fac_WhenTheValueIsZero_ShouldReturn1_test() ->
    ?assert(1 == fac(0)).

fac_WhenTheValueIs2_ShouldReturn2_test() ->
    ?assert(2 == fac(2)).

fac_WhenTheValueIsNegative_ShouldFail_test() ->
    ?assertError(function_clause, fac(-3)).
