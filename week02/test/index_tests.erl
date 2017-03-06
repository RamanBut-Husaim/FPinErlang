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


