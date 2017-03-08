%%%-------------------------------------------------------------------
%%% @author Rakkatakka
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Mar 2017 9:38 PM
%%%-------------------------------------------------------------------
-module(index).
-author("Rakkatakka").

-export([
    get_file_contents/1,
    show_file_contents/1,
    process_text/1,
    process_strings/1,
    to_interval_list/1,
    to_interval/1,
    scan_lines/1,
    scan_line/2,
    transform_strings/1,
    split_string_into_words/1,
    sanitize_words/1,
    to_lower_words/1,
    sanitize_for_stop_words/1]).

% Used to read a file into a list of lines.
% Example files available in:
%   gettysburg-address.txt (short)
%   dickens-christmas.txt  (long)


% Get the contents of a text file into a list of lines.
% Each line has its trailing newline removed.

get_file_contents(Name) ->
    {ok, File} = file:open(Name,[read]),
    Rev = get_all_lines(File,[]),
    lists:reverse(Rev).

% Auxiliary function for get_file_contents.
% Not exported.

get_all_lines(File,Partial) ->
    case io:get_line(File,"") of
        eof -> file:close(File),
            Partial;
        Line ->
            {Strip, _} = lists:split(length(Line)-1, Line),
            get_all_lines(File, [Strip | Partial])
    end.

% Show the contents of a list of strings.
% Can be used to check the results of calling get_file_contents.

show_file_contents([L|Ls]) ->
    io:format("~s~n",[L]),
    show_file_contents(Ls);
show_file_contents([]) ->
    ok.

process_text(FileName) ->
    FileContent = get_file_contents(FileName),
    process_strings(FileContent).

process_strings(Strings) ->
    Lines = transform_strings(Strings),
    RawFileIndex = scan_lines(Lines),
    process_raw_file_index(RawFileIndex).

process_raw_file_index(FileIndex) ->
    FileIndexList = maps:to_list(FileIndex),
    MappedIndex = lists:map(
        fun ({Word, LineSet}) ->
            {Word, to_interval_list(LineSet)}
        end,
        FileIndexList),
    SortedIndex = lists:sort(
        fun ({Word1, _}, {Word2, _}) ->
           Word1 =< Word2
        end,
        MappedIndex
    ),
    SortedIndex.

to_interval_list(LineSet) ->
    SortedList = lists:sort(gb_sets:to_list(LineSet)),
    case SortedList of
        [] -> [];
        [X | _] -> to_interval_listTr(SortedList, X, [], [])
    end.

to_interval_listTr([], _, CurrentInterval, Accum) ->
    Interval = to_interval(lists:reverse(CurrentInterval)),
    lists:reverse([Interval| Accum]);
to_interval_listTr([X | Xs], Cursor, CurrentInterval, Accum) ->
    case Cursor == X of
        true -> to_interval_listTr(Xs, Cursor + 1, [X | CurrentInterval], Accum);
        _ ->
            Interval = to_interval(lists:reverse(CurrentInterval)),
            to_interval_listTr([X | Xs], X, [], [Interval| Accum])
    end.

to_interval([]) ->
    {};
to_interval([X]) ->
    {X, X};
to_interval([X | Xs]) ->
    {X, lists:last(Xs)}.

scan_lines(Lines) ->
    scan_linesTr(Lines, #{}).

scan_linesTr([], Accum) ->
    Accum;
scan_linesTr([Line | Lines], Accum) ->
    AccumAfterLineParse = scan_line(Line, Accum),
    scan_linesTr(Lines, AccumAfterLineParse).

scan_line({Index, Words}, Accum) when Index > 0 ->
    scan_lineTr(Words, Index, Accum).

scan_lineTr([], _, Accum) ->
    Accum;
scan_lineTr([X | Xs], Index, Accum) ->
    LineSet = maps:get(X, Accum, gb_sets:new()),
    LineSetWithIndex = gb_sets:add(Index, LineSet),
    scan_lineTr(Xs, Index, maps:put(X, LineSetWithIndex, Accum)).

transform_strings(X) ->
    transform_stringsTr(X, 1, []).

transform_stringsTr([], _, Accum) ->
    lists:reverse(Accum);
transform_stringsTr([X | Xs], Index, Accum) ->
    Words = split_string_into_words(X),
    Str = {Index, sanitize_words(Words)},
    transform_stringsTr(Xs, Index + 1, [Str | Accum]).

split_string_into_words([]) ->
    [];
split_string_into_words(X) ->
    string:tokens(X, " ,.;-\\?!`'").

sanitize_words(X) ->
    Lowered = to_lower_words(X),
    sanitize_for_stop_words(Lowered).

to_lower_words(X) ->
    to_lower_wordsTr(X, []).

to_lower_wordsTr([], Accum) ->
    lists:reverse(Accum);
to_lower_wordsTr([X | Xs], Accum) ->
    Lowered = string:to_lower(X),
    to_lower_wordsTr(Xs, [Lowered | Accum]).

sanitize_for_stop_words(X) ->
    % The list could be continued for the English lang. It is placed there to show the idea.
    StopWords = [
        "a",
        "about",
        "all",
        "am",
        "an",
        "and",
        "any",
        "for",
        "the"
    ],
    StopWordsSet = gb_sets:from_list(StopWords),
    sanitize_for_stop_wordsTr(X, StopWordsSet, []).

sanitize_for_stop_wordsTr([], _, Accum) ->
    lists:reverse(Accum);
sanitize_for_stop_wordsTr([X | Xs], StopWords, Accum) ->
    case gb_sets:is_member(X, StopWords) of
        true -> sanitize_for_stop_wordsTr(Xs, StopWords, Accum);
        _ -> sanitize_for_stop_wordsTr(Xs, StopWords, [X | Accum])
    end.