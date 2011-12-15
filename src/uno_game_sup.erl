%%%-------------------------------------------------------------------
%%% @author oferrigni
%%% @copyright (C) 2011, oferrigni
%%% @doc
%%%
%%% @end
%%% Created : 2011-10-26 22:42:40.892842
%%%-------------------------------------------------------------------
-module(uno_game_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-include("include/uno_macros.hrl").

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
        supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
        RestartStrategy = one_for_one,
        MaxRestarts = 2,
        MaxSecondsBetweenRestarts = 3600,

        SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},


        {ok, {SupFlags, [?CHILD(uno_game, worker, 2000),?CHILD(uno_player, worker, 2000)]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================



