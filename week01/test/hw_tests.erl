%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2017 2:49 PM
%%%-------------------------------------------------------------------
-module(hw_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Rakkatakka").

-import(hw, [perimeter/1, enclose/1, bits/1, bits_rec/1]).

perimeter_WhenTheCircleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Circle = {circle, {2, 3}, 4},
    ExpectedPerimeter = 2 * math:pi() * 4,
    ?assertEqual(ExpectedPerimeter, perimeter(Circle)).

perimeter_WhenTheRectangleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Rectangle = {rectangle, {2, 3}, 4, 5},
    ExpectedPerimeter = 18,
    ?assertEqual(ExpectedPerimeter, perimeter(Rectangle)).

perimeter_WhenTheTriangleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Triangle = {triangle, {0, 0}, {0, 3}, {4, 0}},
    ExpectedPerimeter = 3.0 + 4.0 + 5.0,
    ?assertEqual(ExpectedPerimeter, perimeter(Triangle)).

enclose_WhenTheCircleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Circle = {circle, {2, 3}, 4},
    ExpectedRectangle = {rectangle, {2, 3}, 8, 8},
    ?assertEqual(ExpectedRectangle, enclose(Circle)).

enclose_WhenTheRectangleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Rectangle = {rectangle, {2, 3}, 10, 10},
    ExpectedRectangle = {rectangle, {2, 3}, 10, 10},
    ?assertEqual(ExpectedRectangle, enclose(Rectangle)).

enclose_WhenTheTriangleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Triangle = {triangle, {0, 0}, {0, 3}, {4, 0}},
    ExpectedRectangle = {rectangle, {2.0, 1.5}, 3, 4},
    ?assertEqual(ExpectedRectangle, enclose(Triangle)).

bits_When7IsPassed_ShouldReturn3_test() ->
    Expected = 3,
    ?assertEqual(Expected, bits(7)).

bits_When8IsPassed_ShouldReturn1_test() ->
    Expected = 1,
    ?assertEqual(Expected, bits(8)).

bits_When334IsPassed_ShouldReturn5_test() ->
    Expected = 5,
    ?assertEqual(Expected, bits(334)).

bits_WhenNegativeIsPassed_ShouldReturnError_test() ->
    ?assertError(function_clause, bits(-10)).

bits_rec_When7IsPassed_ShouldReturn3_test() ->
    Expected = 3,
    ?assertEqual(Expected, bits_rec(7)).

bits_rec_When8IsPassed_ShouldReturn1_test() ->
    Expected = 1,
    ?assertEqual(Expected, bits_rec(8)).

bits_rec_When334IsPassed_ShouldReturn5_test() ->
    Expected = 5,
    ?assertEqual(Expected, bits_rec(334)).

bits_rec_WhenNegativeIsPassed_ShouldReturnError_test() ->
    ?assertError(function_clause, bits_rec(-10)).

