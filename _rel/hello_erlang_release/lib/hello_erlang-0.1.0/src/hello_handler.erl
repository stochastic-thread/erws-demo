-module(hello_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

time_bitstring({T1, T2, T3}) -> 
    <<T1, T2, T3>>.

handle(Req, State=#state{}) ->
	{ok, Req2} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], time_bitstring(os:timestamp()), Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
