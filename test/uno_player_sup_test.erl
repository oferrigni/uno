-module(uno_player_sup_test).

-compile([export_all]).

-include("include/uno_macros.hrl").
-include_lib("eunit/include/eunit.hrl").

init_should_return_simple_one_for_one_supervisor_test() -> 
    {ok, {SupervisorFlags, Children}} = uno_player_sup:init([]),
    ?assertMatch({simple_one_for_one, 2, 2000}, SupervisorFlags),
    [UnoPlayer] = Children,
    ?assertEqual(UnoPlayer, ?CHILD(uno_player, worker, 2000)).
