%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Feb 2017 11:36 PM
%%%-------------------------------------------------------------------
-module(first).
-author("Rakkatakka").

%% API
-export([double/1, mult/2]).

mult(X, Y) ->
  X * Y.

double(X) ->
  mult(2, X).
