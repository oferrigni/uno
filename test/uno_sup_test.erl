-module(uno_sup_test).

-compile([export_all]).

-include_lib("eunit/include/eunit.hrl").
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

init_should_return_one_for_one_restart_strategy_test() ->
  {_,{ RestartStrategy, _}} = uno_sup:init([]),
  ?assertMatch({one_for_one, 5, 10}, RestartStrategy).

init_should_return_uno_game_supervisor_test() ->
  {_, {_, Children}} = uno_sup:init([]),
  ?assertMatch([?CHILD(uno_game_sup, supervisor)], Children).
