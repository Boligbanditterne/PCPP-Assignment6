% raup@itu.dk * 2024-11-14

-module(account).

%% export any necessary functions
-export([start/0,init/1]).

%% define the account actor state
-record(balance_state, {balance}).


%% define a start(...) function that spawns an account actor
start () ->
    spawn(?MODULE, init, [0]).

%% define a init(...) function that initalizes the state of the account actor
init(InitalValue) ->
    InitalBalance = #balance_state{balance = InitalValue},
    loop(InitalBalance).

%% loop(...) function with the behavior of the account actor upon receiving messages
loop(State) ->
    receive
        {deposit, Amount} -> 
            CurrentBalance = State#balance_state.balance,
            NewState = State#balance_state{balance = CurrentBalance + Amount}, 
            loop(NewState);
        print_balance ->
            io:format("The balance is ~p~n",
                [State#balance_state.balance]),
            loop(State)
    end.