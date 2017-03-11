%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Mar 2017 12:42 PM
%%%-------------------------------------------------------------------
-module(rock).
-author("Rakkatakka").

%% API
-export([tournament/2, result/2]).

tournament(X, Y) ->
    Adjusted = lists:zip(X, Y),
    Result = lists:foldr(
        fun({L, R}, Accum) ->
            Value = case result(L, R) of
                win -> 1;
                lose -> -1;
                _ -> 0
            end,
            Accum + Value
        end, 0, Adjusted),
    Result.

result(X, X) when is_atom(X) ->
    draw;
result(X, Y) ->
    case beat(X) of
        Y -> lose;
        _ -> win
    end.

beat(rock) ->
    paper;
beat(paper) ->
    scissors;
beat(scissors) ->
    rock.

%%lose(rock) ->
%%    scissors;
%%lose(scissors) ->
%%    paper;
%%lose(paper) ->
%%    rock.
