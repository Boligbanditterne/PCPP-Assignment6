% raup@itu.dk * 2024-11-14

-module(mobile_app).

%% export any necessary functions
-export([start/1, init/1, send_N_requests/4]).

%% define a start(...) function that spawns a mobile app actor
start(Bank) ->
    spawn(?MODULE, init, [Bank]).

%% define a init(...) function that initalizes the state of the mobile app actor
init(Bank) ->
    loop(Bank).

%% Called from the shell: mobile_app:send_N_requests(MobileApp, N, From, To)
send_N_requests(MobileApp, N, From, To) ->
    MobileApp ! {send_N_requests, N, From, To}.

%% loop(...) function with the behavior of the mobile app actor upon receiving messages
loop(Bank) ->
    receive
        {payment_request, From, To, Amount} ->
            Bank ! {transaction, From, To, Amount},
            loop(Bank);
        {send_N_requests, 0, From, To} -> loop(Bank);
        {send_N_requests, N, From, To} ->
            Bank ! {transaction, From,To,1},
            self() ! {send_N_requests, N-1,From,To},
            loop(Bank)
    end.


