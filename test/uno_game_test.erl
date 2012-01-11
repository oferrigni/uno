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

handle_cast_when_4_register_call_should_have_deck_deal_players_in_test() ->
    meck:new(uno_deck),
    try
        meck:expect(uno_deck, deal_players, 1, []),
        {noreply, State} = uno_game:handle_cast({register, from},
            #state{players = [one, two, three]}),
        ?assert(meck:called(uno_deck, deal_players, [[one, two,
                    three, from]]))
    after
        meck:unload()
    end.
