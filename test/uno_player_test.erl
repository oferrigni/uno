-module(uno_player_test).

-compile([export_all]).

-include_lib("eunit/include/eunit.hrl").

init_should_return_ok_args_zero_test() ->
    Result = uno_player:init([]),
    ?assertEqual({ok, [], 0}, Result).

init_should_return_zero_to_cause_timeout_test() ->
    {_, _, Zero} = uno_player:init([]),
    ?assertEqual(0, Zero).

handle_info_when_timeout_should_register_with_game_test() ->
    meck:new(uno_game),
    try
        meck:expect(uno_game, register_player, 0, []),
        uno_player:handle_info(timeout, state)
    after
        meck:unload()
    end.

player_ready_should_notify_game_test() ->
    meck:new(uno_game),
    try
        meck:expect(uno_game, deal_me_in, 0, []),
        uno_player:player_ready()
    after
        meck:unload()
    end.
