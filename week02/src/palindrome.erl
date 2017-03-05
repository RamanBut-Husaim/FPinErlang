%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 7:06 PM
%%%-------------------------------------------------------------------
-module(palindrome).
-author("Rakkatakka").

%% API
-export([palindrome/1]).

palindrome([]) ->
    false;
palindrome(Str) ->
    LowerStr = string:to_lower(Str),
    SanitizedStr = sanitize(LowerStr, []),
    Reversed = lists:reverse(SanitizedStr),
    SanitizedStr == Reversed.

sanitize([], Result) ->
    lists:reverse(Result);
sanitize([X | Xs], Result) ->
    case X >= 97 andalso X =< 122 of
        true -> sanitize(Xs, [X | Result]);
        _ -> sanitize(Xs, Result)
    end.
