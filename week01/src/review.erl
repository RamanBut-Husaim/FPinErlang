%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2017 3:44 PM
%%%-------------------------------------------------------------------
-module(review).
-author("Rakkatakka").

-export([perimeter/1, area/1, triangle/1, enclose/1, bits/1]).

%%% perimeter takes the shape and calclute perimeter

perimeter({circle, R}) ->
    2 * math:pi() * R;

perimeter({triangle, A, B, C}) ->
    A + B + C;

perimeter({rectangle, H, W}) ->
    2 * (H + W).

%%% area triangle

area({triangle, A, B, C}) ->
    S = (A + B + C) /2,
    math:sqrt(S * (S - A) * (S - B) * (S - C)).

%%% triangle area and perimeter

triangle({A, B, C}) ->
    { {perimeter, perimeter({triangle, A, B, C})}, {area, area({triangle, A, B, C}) } }.

%%% takes shape and return smallest rectangle

enclose({circle, R}) ->
    {rectangle, 2 * R, 2 * R};

enclose({rectangle, H, W}) ->
    { rectangle, H,W };

enclose({triangle, A, B, C}) ->
    Area = area( {triangle, A, B, C} ),
    { rectangle, 2 * Area / A, A }.

%%% bits takes positive number and returns the sum of the bits

bits(N) when N > 0 ->
    bits(N, 0).

bits(0, Bits) ->
    Bits;

bits(N, Bits) ->
    bits(N div 2, Bits + (N rem 2)).
