-module(uno_game_sup_test).

-compile([export_all]).

-include("include/uno_macros.hrl").
-include_lib("eunit/include/eunit.hrl").

init_should_return_child_specifications_including_four_players_test() ->
    {ok, {SupervisorFloags, Children}}  =  uno_game_sup:init([]),
    ?assertMatch({one_for_one, 1000, 3600}, SupervisorFloags),
    ?assertMatch([_,_], Children),
    [UnoGame, UnoPlayer] = Children,
    ?assertEqual(UnoGame, ?CHILD(uno_game, worker, 2000)),
    ?assertEqual(UnoPlayer, ?CHILD(uno_player, worker, 2000)).

