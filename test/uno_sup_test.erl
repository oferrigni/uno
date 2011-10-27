-module(uno_sup_test).

-compile([export_all]).

-include_lib("eunit/include/eunit.hrl").

foo_test() ->
  ?assertEqual(true, true).
