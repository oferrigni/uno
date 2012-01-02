-module(uno_game_sup_test).

-compile([export_all]).

-include("include/uno_macros.hrl").
-include_lib("eunit/include/eunit.hrl").

init_should_return_child_specificaitons_with_children_test() ->
    {ok, {SupervisorFlags, Children}}  =  uno_game_sup:init([]),
    [UnoPlayerSup, UnoGame, UnoDeck] = Children,
    ?assertEqual(UnoPlayerSup, ?CHILD(uno_player_sup, supervisor, 2000)),
    ?assertEqual(UnoGame, ?CHILD(uno_game, worker, 2000)),
    ?assertEqual(UnoDeck, ?CHILD(uno_deck, worker, 2000)).

init_supervisor_flags_should_one_set_test() ->
    {ok, {SupervisorFlags, Children}}  =  uno_game_sup:init([]),
    ?assertMatch({one_for_one, 2, 3600}, SupervisorFlags).
