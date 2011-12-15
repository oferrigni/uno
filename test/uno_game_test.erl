-module(uno_game_test).

-include_lib("eunit/include/eunit.hrl").

-compile([export_all]).

handle_call_get_arg_should_return_last_arg_in_state_record_test() ->
    Result = uno_game:handle_call(get_arg, from, {state, foo, []}),
    ?assertMatch({reply, foo, {state, foo, []}}, Result).

handle_cast_when_register_should_add_from_state_test() ->
  {noreply, State} = uno_game:handle_cast({register, from}, {state,
          last_arg, []}),
  ?assertEqual({state,undefined, [from]}, State).
