-module(uno_sup_test).

-compile([export_all]).

-include_lib("eunit/include/eunit.hrl").

init_should_return_one_for_one_restart_strategy_test() ->
  {_,{ RestartStrategy, _}} = uno_sup:init([]),
  ?assertMatch({one_for_one, 5, 10}, RestartStrategy).
