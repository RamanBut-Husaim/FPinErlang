%%%-------------------------------------------------------------------
%%% @author Murat Arica
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2017 3:45 PM
%%%-------------------------------------------------------------------
-module(review_tests).
-include_lib("eunit/include/eunit.hrl").
-author("Murat Arica").

-import(review, [perimeter/1, enclose/1, bits/1]).

perimeter_WhenTheCircleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Circle = {circle, 4},
    ExpectedPerimeter = 2 * math:pi() * 4,
    ?assertEqual(ExpectedPerimeter, perimeter(Circle)).

perimeter_WhenTheRectangleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Rectangle = {rectangle, 4, 5},
    ExpectedPerimeter = 18,
    ?assertEqual(ExpectedPerimeter, perimeter(Rectangle)).

perimeter_WhenTheTriangleIsSpecified_ShouldCalculatePerimeterCorrectly_test() ->
    Triangle = {triangle, 3, 4, 5},
    ExpectedPerimeter = 3 + 4 + 5,
    ?assertEqual(ExpectedPerimeter, perimeter(Triangle)).

enclose_WhenTheCircleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Circle = {circle, 4},
    ExpectedRectangle = {rectangle, 8, 8},
    ?assertEqual(ExpectedRectangle, enclose(Circle)).

enclose_WhenTheRectangleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Rectangle = {rectangle, 10, 10},
    ExpectedRectangle = {rectangle, 10, 10},
    ?assertEqual(ExpectedRectangle, enclose(Rectangle)).

enclose_WhenTheTriangleIsSpecified_ShouldCalculateEnclosingRectangleCorrectly_test() ->
    Triangle = {triangle, 3, 4, 5},
    ExpectedRectangle = {rectangle, 4.0, 3},
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