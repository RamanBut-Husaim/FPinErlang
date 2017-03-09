%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mar 2017 10:01 PM
%%%-------------------------------------------------------------------
-module(hopractice).
-author("Rakkatakka").

%% API
-export([doubleAll/1, evens/1, product/1, zip/2, zip_with/3, zip_with2/3, zip2/2]).

doubleAll(X) when is_list(X) ->
    lists:map(fun (El) -> El * 2 end, X).

evens(X) when is_list(X) ->
    lists:filter(fun (El) -> El rem 2 == 0 end, X).

product(X) when is_list(X) ->
    lists:foldr(fun (El, Accum) -> El * Accum end, 1, X).

zip(Xl, Yl) when is_list(Xl) andalso is_list(Yl) ->
    zip(Xl, Yl, []).

zip([], [], Accum) ->
    lists:reverse(Accum);
zip([], [_Y | _Ys], Accum) ->
    lists:reverse(Accum);
zip([_X | _Xs], [], Accum) ->
    lists:reverse(Accum);
zip([X | Xs], [Y | Ys], Accum) ->
    zip(Xs, Ys, [{X, Y} | Accum]).

zip_with(Func, Xl, Yl) when is_function(Func) andalso is_list(Xl) andalso is_list(Yl) ->
    zip_with(Func, Xl, Yl, []).

zip_with(_, [], [], Accum) ->
    lists:reverse(Accum);
zip_with(_, [], [_Y | _Ys], Accum) ->
    lists:reverse(Accum);
zip_with(_, [_X | _Xs], [], Accum) ->
    lists:reverse(Accum);
zip_with(Func, [X | Xs], [Y | Ys], Accum) ->
    zip_with(Func, Xs, Ys, [Func(X, Y) | Accum]).

zip_with2(Func, Xl, Yl) when is_function(Func) andalso is_list(Xl) andalso is_list(Yl) ->
    lists:map(fun ({X, Y}) -> Func(X, Y) end, zip(Xl, Yl)).

zip2(Xl, Yl) when is_list(Xl) andalso is_list(Yl) ->
    zip_with2(fun (X, Y) -> {X, Y} end, Xl, Yl).
