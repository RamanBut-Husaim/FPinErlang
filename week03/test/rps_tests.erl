%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Mar 2017 4:03 PM
%%%-------------------------------------------------------------------
-module(rps_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(rps, [no_repeat/1, cycle/1, least_frequent/1, most_frequent/1]).

no_repeat_WhenTheListIsEmpty_ShouldReturnRock_test() ->
    Expected = rock,
    ?assertEqual(Expected, no_repeat([])).

no_repeat_WhenTheListContainsRock_ShouldReturnPaper_test() ->
    Expected = paper,
    ?assertEqual(Expected, no_repeat([rock])).

no_repeat_WhenTheListContainsRockAndPaper_ShouldReturnScissors_test() ->
    Expected = scissors,
    ?assertEqual(Expected, no_repeat([rock, paper])).

no_repeat_WhenTheListContainsAllElements_ShouldReturnValueThatBeatsTheFirstOne_test() ->
    Data = [rock, paper, scissors],
    Expected = paper,
    ?assertEqual(Expected, no_repeat(Data)).

cycle_WhenTheEmptyListIsPassed_ShouldReturnRock_test() ->
    Expected = rock,
    ?assertEqual(Expected, cycle([])).

cycle_WhenTheLengthOfTheListModule3EqualTo0_ShouldReturnRock_test() ->
    Expected = rock,
    ?assertEqual(Expected, cycle(lists:duplicate(3, rock))),
    ?assertEqual(Expected, cycle(lists:duplicate(6, rock))).

cycle_WhenTheLengthOfTheListModule3EqualTo1_ShouldReturnPaper_test() ->
    Expected = paper,
    ?assertEqual(Expected, cycle(lists:duplicate(1, rock))),
    ?assertEqual(Expected, cycle(lists:duplicate(4, rock))),
    ?assertEqual(Expected, cycle(lists:duplicate(7, rock))).

cycle_WhenTheLengthOfTheListModule3EqualTo2_ShouldReturnScissors_test() ->
    Expected = scissors,
    ?assertEqual(Expected, cycle(lists:duplicate(2, rock))),
    ?assertEqual(Expected, cycle(lists:duplicate(5, rock))),
    ?assertEqual(Expected, cycle(lists:duplicate(8, rock))).

least_frequent_WhenTheEmptyListIsPassed_ShouldReturnRock_test() ->
    Expected = rock,
    ?assertEqual(Expected, least_frequent([])).

least_frequent_WhenPaperOccursLessFrequent_ShouldReturnPaper_test() ->
    Data = [paper, rock, rock, scissors, rock, scissors],
    Expected = paper,
    ?assertEqual(Expected, least_frequent(Data)).

most_frequent_WhenTheEmptyListIsPassed_ShouldReturnRock_test() ->
    Expected = rock,
    ?assertEqual(Expected, most_frequent([])).

most_frequent_WhenRockOccursMostFrequent_ShouldReturnRock_test() ->
    Data = [paper, rock, rock, scissors, rock, scissors],
    Expected = rock,
    ?assertEqual(Expected, most_frequent(Data)).
