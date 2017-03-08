%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Mar 2017 10:06 PM
%%%-------------------------------------------------------------------
-module(index_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(index, [
    split_string_into_words/1,
    process_strings/1,
    to_interval_list/1,
    to_interval/1,
    scan_lines/1,
    scan_line/2,
    transform_strings/1,
    sanitize_words/1,
    to_lower_words/1,
    sanitize_for_stop_words/1
]).

split_string_into_words_WhenTheStringIsEmpty_ShouldReturnEmptyString_test() ->
    Expected = [],
    ?assertEqual(Expected, split_string_into_words([])).

split_string_into_words_WhenTheStringContainsSpaces_ShouldSplitStringBySpaces_test() ->
    Data = "Four score and seven years ago our fathers brought",
    Expected = ["Four", "score", "and", "seven", "years", "ago", "our", "fathers", "brought"],
    ?assertEqual(Expected, split_string_into_words(Data)).

split_string_into_words_WhenStringContainsCommas_ShouldSplitStringCorrectly_test() ->
    Data = "that nation, or any nation so conceived and dedicated,",
    Expected = ["that", "nation", "or", "any", "nation", "so", "conceived", "and", "dedicated"],
    ?assertEqual(Expected, split_string_into_words(Data)).

to_lower_words_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, to_lower_words([])).

to_lower_words_WhenTheListContainsValues_ShouldLowercaseEachWord_test() ->
    Data = ["Four", "score", "and", "FOR", "ThE", "GrEaTeR"],
    Expected = ["four", "score", "and", "for", "the", "greater"],
    ?assertEqual(Expected, to_lower_words(Data)).

sanitize_for_stop_words_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, sanitize_for_stop_words([])).

sanitize_for_stop_words_WhenTheListContainsStopWords_ShouldExcludeThemFromOutput_test() ->
    Data = ["four", "score", "and", "for", "the", "greater"],
    Expected = ["four", "score", "greater"],
    ?assertEqual(Expected, sanitize_for_stop_words(Data)).

sanitize_words_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, sanitize_words([])).

sanitize_words_WhenTheListContainsWords_ShouldSanitizeThemCorrectly_test() ->
    Data = ["Four", "score", "and", "FOR", "ThE", "GrEaTeR"],
    Expected = ["four", "score", "greater"],
    ?assertEqual(Expected, sanitize_words(Data)).

transform_strings_WhenTheListIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, transform_strings([])).

transform_strings_WhenTheListContainsValues_ShouldTransformCorrectly_test() ->
    Data = [
        "Four score and seven years ago the fathers brought",
        "that nation, or any nation so conceived and dedicated,"
    ],
    Expected = [
        {1, ["four", "score", "seven", "years", "ago", "fathers", "brought"]},
        {2, ["that", "nation", "or", "nation", "so", "conceived", "dedicated"]}
    ],
    ?assertEqual(Expected, transform_strings(Data)).

scan_line_WhenTheLineContainsDuplicateWords_ShouldReturnCorrectResult_test() ->
    Data = {1, ["that", "some", "that"]},
    Expected = #{
        "that" => gb_sets:add(1, gb_sets:new()),
        "some" => gb_sets:add(1, gb_sets:new())
    },
    ?assertEqual(Expected, scan_line(Data, #{})).

scan_line_WhenTheLineContainsWordsThatHasAlreadyBeenAdded_ShouldAddLineCorrectly_test() ->
    Data = {4, ["that"]},
    Accum = #{
        "that" => gb_sets:add(1, gb_sets:new()),
        "some" => gb_sets:add(1, gb_sets:new())
    },
    Expected = #{
        "that" => gb_sets:add(4, gb_sets:add(1, gb_sets:new())),
        "some" => gb_sets:add(1, gb_sets:new())
    },
    ?assertEqual(Expected, scan_line(Data, Accum)).

scan_line_WhenThereAreNoWordsInTheLine_ShouldNotModifyAccumulator_test() ->
    Data = {4, []},
    Accum = #{
        "that" => gb_sets:add(1, gb_sets:new()),
        "some" => gb_sets:add(1, gb_sets:new())
    },
    Expected = #{
        "that" => gb_sets:add(1, gb_sets:new()),
        "some" => gb_sets:add(1, gb_sets:new())
    },
    ?assertEqual(Expected, scan_line(Data, Accum)).

scan_lines_WhenThereAreNotLines_ShouldReturnEmptyMap_test() ->
    Expected = #{},
    ?assertEqual(Expected, scan_lines([])).

scan_lines_WhenTheLinesArePassed_ShouldReturnCorrectMap_test() ->
    Data = [
        {1, ["that", "some", "that"]},
        {4, ["go", "some", "that"]},
        {5, ["go", "forever"]}
    ],
    Expected = #{
        "that" => gb_sets:add(4, gb_sets:add(1, gb_sets:new())),
        "some" => gb_sets:add(4, gb_sets:add(1, gb_sets:new())),
        "go" => gb_sets:add(5, gb_sets:add(4, gb_sets:new())),
        "forever" => gb_sets:add(5, gb_sets:new())
    },
    ?assertEqual(Expected, scan_lines(Data)).

to_interval_WhenTheListIsEmpty_ShouldReturnEmptyTuple_test() ->
    Expected = {},
    ?assertEqual(Expected, to_interval([])).

to_interval_WhenTheListWithEmptyElementIsPassed_ShouldReturnTupleWithSameElement_test() ->
    Data = [3],
    Expected = {3, 3},
    ?assertEqual(Expected, to_interval(Data)).

to_interval_WhenListWithSeveralElementsIsPassed_ShouldReturnTupleWithFirstAndLastElement_test() ->
    Data = [8, 1, 22, 12, 4],
    Expected = {8, 4},
    ?assertEqual(Expected, to_interval(Data)).

to_interval_list_WhenTheSetIsEmpty_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, to_interval_list(gb_sets:new())).

to_interval_list_WhenTheSetContainsOneElement_ShouldReturnListWithOneTuple_test() ->
    Data = gb_sets:from_list([3]),
    Expected = [{3, 3}],
    ?assertEqual(Expected, to_interval_list(Data)).

to_interval_list_WhenThereAreConsequentElements_ShouldReturnCorrectResult_test() ->
    Data = gb_sets:from_list([2, 1, 3, 5, 8]),
    Expected = [{1, 3}, {5, 5}, {8, 8}],
    ?assertEqual(Expected, to_interval_list(Data)).

to_interval_list_WhenThereAreSeveralGroupsWithConsequentElements_ShouldReturnCorrectResult_test() ->
    Data = gb_sets:from_list([1, 3, 2, 4, 6, 8, 10, 9, 33, 34, 11, 35]),
    Expected = [{1, 4}, {6, 6}, {8, 11}, {33, 35}],
    ?assertEqual(Expected, to_interval_list(Data)).

to_interval_list_WhenThereAreNoConsequentIntervals_ShouldReturnCorrectResult_test() ->
    Data = gb_sets:from_list([3, 5, 12, 1, 88, 9122]),
    Expected = [{1, 1}, {3, 3}, {5, 5}, {12, 12}, {88, 88}, {9122, 9122}],
    ?assertEqual(Expected, to_interval_list(Data)).

process_strings_WhenThereAreNoStrings_ShouldReturnEmptyList_test() ->
    Expected = [],
    ?assertEqual(Expected, process_strings([])).

process_strings_WhenThereAreStrings_ShouldProcessThemCorrectly_test() ->
    Data = [
        "for greater good",      %1
        "fire and wisdom",       %2
        "honor, greater, fire",  %3
        "sorrow night good"      %4
    ],
    Expected = [
        { "fire", [{2, 3} ]},
        { "good", [{1, 1}, {4, 4}] },
        { "greater", [{1, 1}, {3, 3}] },
        { "honor", [{3, 3}] },
        { "night", [{4, 4}] },
        { "sorrow", [{4, 4}] },
        { "wisdom", [{2, 2}] }
    ],
    ?assertEqual(Expected, process_strings(Data)).



