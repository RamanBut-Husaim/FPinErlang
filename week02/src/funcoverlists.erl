%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 12:27 PM
%%%-------------------------------------------------------------------
-module(funcoverlists).
-author("Rakkatakka").

%% API
-export([product/1, product_rec/1, maximum/1, maximum_rec/1]).

product(X) ->
    product_internal(X, 1).

product_internal([], Product) ->
    Product;
product_internal([X | XS], Product) ->
    product_internal(XS, X * Product).

product_rec([]) ->
    1;
product_rec([X | XS]) ->
    X * product_rec(XS).

maximum([X]) ->
    X;
maximum([X | XS]) ->
    maximum_internal(XS, X).

maximum_internal([], Max) ->
    Max;
maximum_internal([X| XS], Max) ->
    if
        X > Max -> maximum_internal(XS, X);
        true -> maximum_internal(XS, Max)
    end.

maximum_rec([X]) ->
    X;
maximum_rec([X | XS]) ->
    max(X, maximum_rec(XS)).


