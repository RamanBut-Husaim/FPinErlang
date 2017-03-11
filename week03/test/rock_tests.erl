%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Mar 2017 1:06 PM
%%%-------------------------------------------------------------------
-module(rock_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(rock, [tournament/2, result/2]).

result_WhenRockIsFirstArgument_ShouldReturnCorrectResults_test() ->
    ?assertEqual(win, result(rock, scissors)),
    ?assertEqual(draw, result(rock, rock)),
    ?assertEqual(lose, result(rock, paper)).

result_WhenPaperIsFirstArgument_ShouldReturnCorrectResults_test() ->
    ?assertEqual(win, result(paper, rock)),
    ?assertEqual(draw, result(paper, paper)),
    ?assertEqual(lose, result(paper, scissors)).

result_WhenScissorsIsFirstArgument_ShouldReturnCorrectResults_test() ->
    ?assertEqual(win, result(scissors, paper)),
    ?assertEqual(draw, result(scissors, scissors)),
    ?assertEqual(lose, result(scissors, rock)).

tournament_WhenEmptyListsArePassed_ShouldReturn0_test() ->
    Expected = 0,
    ?assertEqual(Expected, tournament([], [])).

tournament_WhenThereAreThreeWinsForTheFirst_ShouldReturnThree_test() ->
    First = [rock, paper, scissors],
    Second = [scissors, rock, paper],
    Expected = 3,
    ?assertEqual(Expected, tournament(First, Second)).

tournament_WhenThereAreThreeLoseForTheFirst_ShouldReturnMinusThree_test() ->
    First = [rock, paper, scissors],
    Second = [paper, scissors, rock],
    Expected = -3,
    ?assertEqual(Expected, tournament(First, Second)).
