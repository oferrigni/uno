-module(uno_game_sup_test).

-compile([export_all]).

-include("include/uno_macros.hrl").
-include_lib("eunit/include/eunit.hrl").

init_should_return_child_specifications_including_the_uno_game_and_uno_player_sup_test() ->
    {ok, {SupervisorFlags, Children}}  =  uno_game_sup:init([]),
    ?assertMatch({one_for_one, 2, 3600}, SupervisorFlags),
    ?assertMatch([_,_], Children),
    [UnoPlayerSup, UnoGame] = Children,
    ?assertEqual(UnoGame, ?CHILD(uno_game, worker, 2000)),
    ?assertEqual(UnoPlayerSup, ?CHILD(uno_player_sup, supervisor, 2000)).

