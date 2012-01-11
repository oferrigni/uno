-module(uno_game_test).

-include_lib("eunit/include/eunit.hrl").
-include("include/uno_game.hrl").

-compile([export_all]).

init_starts_players_with_names_test() ->
    meck:new(uno_player_sup),
    try
        meck:expect(uno_player_sup, start_players, 1, []),
        uno_game:init([])
    after
        meck:unload()
    end.

handle_cast_when_register_should_add_from_state_test() ->
    {noreply, State} = uno_game:handle_cast({register, from}, #state{}),
  ?assertEqual({state, [from]}, State).
