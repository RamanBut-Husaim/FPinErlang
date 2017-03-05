%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 7:07 PM
%%%-------------------------------------------------------------------
-module(palindrome_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(palindrome, [palindrome/1]).

palindrome_WhenTheStringIsEmpty_ShouldReturnFalse_test() ->
    Expected = false,
    ?assertEqual(Expected, palindrome("")).

palindrome_WhenTheStringIsLowercasePalindrome_ShouldReturnTrue_test() ->
    Data = "madammadam",
    Expected = true,
    ?assertEqual(Expected, palindrome(Data)).

palindrome_WhenTheStringIsRegisterBasedPalindrome_ShouldReturnTrue_test() ->
    Data = "MaDammADAm",
    Expected = true,
    ?assertEqual(Expected, palindrome(Data)).

palindrome_WhenTheStringHasNonLetterCharactersAndPalindrome_ShouldReturnTrue_test() ->
    Data = "M a9dam m9adam",
    Expected = true,
    ?assertEqual(Expected, palindrome(Data)).

palindrome_WhenTheStringIsNotPalindrome_ShouldReturnFalse_test() ->
    Data = "Madam Madams",
    Expected = false,
    ?assertEqual(Expected, palindrome(Data)).
