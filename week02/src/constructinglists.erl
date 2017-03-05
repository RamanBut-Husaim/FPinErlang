%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2017 1:27 PM
%%%-------------------------------------------------------------------
-module(constructinglists).
-author("Rakkatakka").

%% API
-export([double/1, evens/1, median/1, mode/1]).

double([]) ->
    [];
double([X | XS]) ->
    [X * 2 | double(XS)].

evens(X) ->
    evensTail(X, []).

evensTail([], Evens) ->
    lists:reverse(Evens);
evensTail([X | XS], Evens) when X rem 2 == 0 ->
    evensTail(XS, [X | Evens]);
evensTail([_ | XS], Evens) ->
    evensTail(XS, Evens).

median([X]) ->
    X;
median(X) ->
    SortedData = lists:sort(X),
    Length = length(SortedData),
    
    if
        Length rem 2 == 0 ->
            LeftMid = Length bsr 1,
            RightMid = (Length bsr 1) + 1,
            (lists:nth(LeftMid, SortedData) + lists:nth(RightMid, SortedData)) / 2;
        true ->
            Mid = (Length bsr 1) + 1,
            float(lists:nth(Mid, SortedData))
    end.

mode([]) ->
    [];
mode(X) ->
    Elements = maps:to_list(get_element_occurrences(X, #{})),
    SortedElements =lists:sort(
        fun({_, V1}, {_, V2}) ->
            V1 >= V2
        end,
        Elements),
    lists:map(fun({Key, _}) -> Key end, SortedElements).

get_element_occurrences([], Map) ->
    Map;
get_element_occurrences([X | XS], Map) ->
    case maps:is_key(X, Map) of
        true ->
            Counter = maps:get(X, Map),
            Map2 = maps:update(X, Counter + 1, Map),
            get_element_occurrences(XS, Map2);
        _ ->
            Map2 = maps:put(X, 1, Map),
            get_element_occurrences(XS, Map2)
    end.

