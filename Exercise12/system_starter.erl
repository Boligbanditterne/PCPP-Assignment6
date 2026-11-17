-module(system_starter).

-export([system_start/0, make_payments/1, run/0]).

system_start() ->
    A1 = account:start(),
    A2 = account:start(),
    B1 = bank:start(),
    B2 = bank:start(),
    M1 = mobile_app:start(B1),
    M2 = mobile_app:start(B2),
    {A1, A2, M1, M2}.

make_payments({A1, A2, M1, M2}) ->
    M1 ! {payment_request, A1, A2, 100},
    M2 ! {payment_request, A2, A1, 150},
    M1 ! {send_N_requests, 100, A1, A2}.

run() ->
    System = system_start(),
    make_payments(System).
