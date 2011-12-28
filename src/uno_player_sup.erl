-module(uno_player_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-include("include/uno_macros.hrl").

-define(SERVER, ?MODULE).

start_link() -> 
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) -> 
    {ok, {{simple_one_for_one, 2, 2000}, []}}.

