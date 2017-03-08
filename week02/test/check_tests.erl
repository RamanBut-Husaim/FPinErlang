%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Mar 2017 5:55 PM
%%%-------------------------------------------------------------------
-module(check_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(check, [nand_01/2, nand_02/2, nand_03/2, nand_04/2, square/2, foo/2, baz/1]).

nand_01_WhenBothAreFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_01(false, false)).

nand_01_WhenTrueFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_01(true, false)).

nand_01_WhenFalseTrue_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_01(false, true)).

nand_01_WhenTrueTrue_ShouldBeFalse_test() ->
    ?assertEqual(false, nand_01(true, true)).

nand_02_WhenBothAreFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_02(false, false)).

nand_02_WhenTrueFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_02(true, false)).

nand_02_WhenFalseTrue_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_02(false, true)).

nand_02_WhenTrueTrue_ShouldBeFalse_test() ->
    ?assertEqual(false, nand_02(true, true)).

nand_03_WhenBothAreFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_03(false, false)).

nand_03_WhenTrueFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_03(true, false)).

nand_03_WhenFalseTrue_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_03(false, true)).

nand_03_WhenTrueTrue_ShouldBeFalse_test() ->
    ?assertEqual(false, nand_03(true, true)).

nand_04_WhenBothAreFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_04(false, false)).

nand_04_WhenTrueFalse_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_04(true, false)).

nand_04_WhenFalseTrue_ShouldBeTrue_test() ->
    ?assertEqual(true, nand_04(false, true)).

nand_04_WhenTrueTrue_ShouldBeFalse_test() ->
    ?assertEqual(false, nand_04(true, true)).

square_WhenTheValuesAreIdentical_ShouldReturnTrue_test() ->
    ?assertEqual(true, square(1, 1)).

foo_test() ->
    ?assertEqual([4, 0], foo(0,[4,0,1])).

baz_test() ->
    Data = [3, 3, 2, 2, 1, 4],
    ?assertEqual(length(Data), length(baz(Data))).
