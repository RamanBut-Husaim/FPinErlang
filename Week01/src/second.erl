%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Feb 2017 12:03 AM
%%%-------------------------------------------------------------------
-module(second).
-author("Rakkatakka").

%% API
-export([calculate_hypotenuse/2, calculate_perimeter/2, calculate_area/2]).

calculate_hypotenuse(X, Y) ->
    Square_Sum = first:square(X) + first:square(Y),
    math:sqrt(Square_Sum).

calculate_perimeter(X, Y) ->
    Hypotenuse = calculate_hypotenuse(X, Y),
    X + Y + Hypotenuse.

calculate_area(X, Y) ->
    1 / 2 * X * Y.


