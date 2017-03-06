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