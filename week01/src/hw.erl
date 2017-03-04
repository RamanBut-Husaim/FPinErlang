%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2017 2:13 PM
%%%-------------------------------------------------------------------
-module(hw).
-author("Rakkatakka").

%% API
-export([perimeter/1, enclose/1, bits/1, bits_rec/1]).

perimeter({circle, {_X, _Y}, R}) when R > 0 ->
    2 * math:pi() * R;
perimeter({rectangle, {_X, _Y}, H, W}) when H > 0, W > 0 ->
    2 * (H + W);
perimeter({triangle, {X1, Y1}, {X2, Y2}, {X3, Y3}}) ->
    A = math:sqrt(math:pow(X1 - X2, 2) + math:pow(Y1 - Y2, 2)),
    B = math:sqrt(math:pow(X2 - X3, 2) + math:pow(Y2 - Y3, 2)),
    C = math:sqrt(math:pow(X1 - X3, 2) + math:pow(Y1 - Y3, 2)),
    A + B + C.

enclose({circle, {X, Y}, R}) when R > 0 ->
    {rectangle, {X, Y}, R * 2, R * 2};
enclose({rectangle, {X, Y}, H, W}) when H > 0, W > 0 ->
    {rectangle, {X, Y}, H, W};
enclose({triangle, {X1, Y1}, {X2, Y2}, {X3, Y3}}) ->
    MinX = min(min(X1, X2), X3),
    MaxX = max(max(X1, X2), X3),
    MinY = min(min(Y1, Y2), Y3),
    MaxY = max(max(Y1, Y2), Y3),
    X = (MinX + MaxX) / 2,
    Y = (MinY + MaxY) / 2,
    W = abs(MaxX - MinX),
    H = abs(MaxY - MinY),
    {rectangle, {X, Y}, H, W}.

bits(X) when X >= 0 ->
    bit_tail(X, 0, 1).

bit_tail(X, Counter, Mask) when Mask > X ->
    Counter;
bit_tail(X, Counter, Mask) ->
    if
        X band Mask == 0 -> bit_tail(X, Counter, Mask bsl 1);
        true -> bit_tail(X, Counter + 1, Mask bsl 1)
    end.

bits_rec(0) ->
    0;
bits_rec(X) when X > 0 ->
    Rest = X rem 2,
    Rest + bits_rec(X bsr 1).




