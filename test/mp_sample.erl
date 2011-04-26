%%%-------------------------------------------------------------------
%%% File    : mp_sample.erl
%%% Author  : UENISHI Kota <kuenishi@gmail.com>
%%% Description : 
%%%
%%% Created : 25 Apr 2011 by UENISHI Kota <kuenishi@gmail.com>
%%%-------------------------------------------------------------------
-module(mp_sample).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1,
         start/0, stop/0]).

start()->
    application:start(?MODULE).

stop()->
    application:stop(?MODULE).

%%====================================================================
%% Application callbacks
%%====================================================================
%%--------------------------------------------------------------------
%% Function: start(Type, StartArgs) -> {ok, Pid} |
%%                                     {ok, Pid, State} |
%%                                     {error, Reason}
%% Description: This function is called whenever an application 
%% is started using application:start/1,2, and should start the processes
%% of the application. If the application is structured according to the
%% OTP design principles as a supervision tree, this means starting the
%% top supervisor of the tree.
%%--------------------------------------------------------------------
start(_Type, StartArgs) ->
    case mp_server_listener_sup:start_link(StartArgs) of
	{ok, Pid} -> 
	    {ok, Pid};
	Error ->
	    Error
		end.

%%--------------------------------------------------------------------
%% Function: stop(State) -> void()
%% Description: This function is called whenever an application
%% has stopped. It is intended to be the opposite of Module:start/2 and
%% should do any necessary cleaning up. The return value is ignored. 
%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

%% mp_sample_test()->
%%     ok=mp_sample:start(),
%%     ok=mp_sample:stop().

-endif.
