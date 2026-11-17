## 12.1

### 12.1.1

***see mobile_app.erl***

1. It is as simple as possible alligned with the figure from exercises.
2. A Mobile app is created and initialize with init. Init takes a Bank, which will be it's reciever. Init only calls the loop with this bank. Recieve recieves messages and instantly send to the bank. 

### 12.1.2

***see bank.erl***

1. It is as simple as possible alligned with the figure from exercises.
2. Bank is just a middleman that takes nothing, it just recieves a message and sends that message to the correct account.

### 12.1.3

***see account.erl***

1. It is as simple as possible alligned with the figure from exercises.
2. It is initialized with an initial value 0, when it recieves deposit messages it edits the balance with these, and prints that it recieved this. It continously waits for new deposits. 

### 12.1.4

***see system_starter.erl***

Run with:

***make:all([load]). ***    
***system_starter:run().***

### 12.1.5

***see mobile_app.erl***

### 12.1.6

1. A2 has a balance of 100, and A1 -100.

2. Yes

3. 100.

### 12.1.7

No data races, since it will only handle one message at a time. However the ordering is unknown.
