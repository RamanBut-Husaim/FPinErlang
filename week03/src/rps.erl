-module(rps).
-export([
    play/1,
    echo/1,
    play_two/3,
    rock/1,
    no_repeat/1,
    const/1,
    enum/1,
    cycle/1,
    rand/1,
    val/1,
    tournament/2,
    least_frequent/1,
    most_frequent/1,
    random_strategy/1,
    best_strategy/1]).


%
% play one strategy against another, for N moves.
%

play_two(StrategyL,StrategyR,N) ->
    play_two(StrategyL,StrategyR,[],[],N).

% tail recursive loop for play_two/3
% 0 case computes the result of the tournament

% FOR YOU TO DEFINE
% REPLACE THE dummy DEFINITIONS
play_two(_,_,PlaysL,PlaysR,0) ->
    FinalResult = tournament(lists:reverse(PlaysL), lists:reverse(PlaysR)),
    io:format("***Final result is *** ~p~n", [FinalResult]),
    case FinalResult > 0 of
        true -> io:format("***Left wins***");
        false -> case FinalResult < 0 of
                     true -> io:format("***Right wins****");
                     false -> io:format("***It is a draw***")
                 end
    end;

play_two(StrategyL,StrategyR,PlaysL,PlaysR,N) ->
    RightMove = StrategyL(PlaysR),
    LeftMove = StrategyR(PlaysL),
    Result = outcome(result(LeftMove,RightMove)),
    io:format("~n"),
    io:format("Left move: ~p~n",[LeftMove]),
    io:format("Right move: ~p~n",[RightMove]),
    io:format("So result is: ~p ",[Result]),
    case Result of
        1 -> io:format("Left wins ~n");
        0 -> io:format("It's a draw ~n");
        -1 -> io:format("Right wins ~n")
    end,
    play_two(StrategyL, StrategyR, [LeftMove|PlaysL], [RightMove|PlaysR], N-1).

%
% interactively play against a strategy, provided as argument.
%

play(Strategy) ->
    io:format("Rock - paper - scissors~n"),
    io:format("Play one of rock, paper, scissors, ...~n"),
    io:format("... r, p, s, stop, followed by '.'~n"),
    play(Strategy,[]).

% tail recursive loop for play/1

play(Strategy,Moves) ->
    {ok,P} = io:read("Play: "),
    Play = expand(P),
    case Play of
	stop ->
	    io:format("Stopped~n");
	_    ->
	    Result = result(Play,Strategy(Moves)),
	    io:format("Result: ~p~n",[Result]),
	    play(Strategy,[Play|Moves])
    end.

%
% auxiliary functions
%

% transform shorthand atoms to expanded form
    
expand(r) -> rock;
expand(p) -> paper;		    
expand(s) -> scissors;
expand(X) -> X.

% result of one set of plays

result(rock,rock) -> draw;
result(rock,paper) -> lose;
result(rock,scissors) -> win;
result(paper,rock) -> win;
result(paper,paper) -> draw;
result(paper,scissors) -> lose;
result(scissors,rock) -> lose;
result(scissors,paper) -> win;
result(scissors,scissors) -> draw.

% result of a tournament

tournament(PlaysL,PlaysR) ->
    lists:sum(
      lists:map(fun outcome/1,
		lists:zipwith(fun result/2,PlaysL,PlaysR))).

outcome(win)  ->  1;
outcome(lose) -> -1;
outcome(draw) ->  0.

% transform 0, 1, 2 to rock, paper, scissors and vice versa.

enum(0) ->
    rock;
enum(1) ->
    paper;
enum(2) ->
    scissors.

val(rock) ->
    0;
val(paper) ->
    1;
val(scissors) ->
    2.

% give the play which the argument beats.

beat(rock) ->
    paper;
beat(paper) ->
    scissors;
beat(scissors) ->
    rock.

%
% strategies.
%
echo([]) ->
     paper;
echo([Last|_]) ->
    Last.

rock(_) ->
    rock.

% FOR YOU TO DEFINE
% REPLACE THE dummy DEFINITIONS

no_repeat(Plays) when is_list(Plays) ->
    Standards = [rock, paper, scissors],
    UniquePlays = gb_sets:from_list(Plays),
    Last = case Plays of
               [] -> rock;
               [X | _] -> X
           end,
    no_repeat(Standards, UniquePlays, Last).

no_repeat([], _, Last) ->
    beat(Last);
no_repeat([Standard | Standards], UniquePlays, Last) ->
    case gb_sets:is_member(Standard, UniquePlays) of
        true -> no_repeat(Standards, UniquePlays, Last);
        _ -> Standard
    end.

const(_) ->
    rock.

cycle(Xs) ->
    RemOfLength = length(Xs) rem 3,
    enum(RemOfLength).

rand(_) ->
    Random = rand:uniform(3) - 1,
    enum(Random).

least_frequent([]) ->
    rock;
least_frequent(Plays) ->
    InitialPlays = #{ rock => 0, paper => 0, scissors => 0},
    PlaysOccurrence = maps:to_list(calculate_plays_occurrence(Plays, InitialPlays)),
    [{Play, _} | _] = lists:sort(fun ({_, X}, {_, Y}) -> X =< Y end, PlaysOccurrence),
    Play.

most_frequent([]) ->
    rock;
most_frequent(Plays) ->
    PlaysOccurrence = maps:to_list(calculate_plays_occurrence(Plays, #{})),
    [{Play, _} | _] = lists:sort(fun ({_, X}, {_, Y}) -> X > Y end, PlaysOccurrence),
    Play.

calculate_plays_occurrence([], UniquePlays) ->
    UniquePlays;
calculate_plays_occurrence([Play | Plays], UniquePlays) ->
    Count = maps:get(Play, UniquePlays, 0),
    NewMap = maps:put(Play, Count + 1, UniquePlays),
    calculate_plays_occurrence(Plays, NewMap).

random_strategy(List) ->
    RandomStrategyIndex = rand:uniform(length(List)) - 1,
    lists:nth(RandomStrategyIndex, List).

best_strategy(StrategyList) ->

    Head = hd(StrategyList),
    Tail = tl(StrategyList),

    fun (Moves) ->
        BestResult = fun (StrategyL, StrategyR) ->
            case (play_two(StrategyL(Moves),StrategyR(Moves),length(Moves)) >= 0) of
                true -> StrategyL;
                false -> StrategyR
            end
                     end,

        lists:foldl(BestResult, Head, Tail)
    end.
