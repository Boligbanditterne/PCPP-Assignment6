% raup@itu.dk * 2024-11-14

-module(bank).

%% export any necessary functions
-export([start/0,init/0]).

%% define the bank actor state

%% define a start(...) function that spawns a bank actor
start() ->
    spawn(?MODULE, init, []).

%% define a init(...) function that initalizes the state of the bank actor
init() ->
    loop().

%% loop(...) function with the behavior of the bank actor upon receiving messages
loop() ->
    receive
        {transaction, From, To, Amount} ->
            From ! {deposit, Amount * -1},
            To ! {deposit, Amount},
            loop()
    end.