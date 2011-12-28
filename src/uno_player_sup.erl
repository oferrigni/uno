-module(uno_player_sup).

-behaviour(supervisor).

-export([start_link/0, start_players/0]).

-export([init/1]).

-include("include/uno_macros.hrl").

-define(SERVER, ?MODULE).

start_link() -> 
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_players() ->
    supervisor:start_child(?MODULE, []),
    supervisor:start_child(?MODULE, []),
    supervisor:start_child(?MODULE, []),
    supervisor:start_child(?MODULE, []).

init([]) -> 
    {ok, {{simple_one_for_one, 2, 2000}, [?CHILD(uno_player, worker,
                    2000)]}}.

