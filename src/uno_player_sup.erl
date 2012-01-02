-module(uno_player_sup).

-behaviour(supervisor).

-export([start_link/0, start_players/1]).

-export([init/1]).

-include("include/uno_macros.hrl").

-define(SERVER, ?MODULE).

start_link() -> 
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_players(Players) ->
    lists:foreach(fun(Val) -> 
        supervisor:start_child(?MODULE, [Val]) 
        end, 
    Players).

init([]) -> 
    {ok, {{simple_one_for_one, 2, 2000}, [?CHILD(uno_player, worker,
                    2000)]}}.

