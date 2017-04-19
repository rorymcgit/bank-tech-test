# Bank - Tech Test

I decided to solve this problem in Ruby, as the solution requires a back-end CLI interface.

```
$ irb
2.4.0 :001 > require './lib/account'
 => true
2.4.0 :002 > account = Account.new
 => #<Account:0x007fd173035d80 @balance=0, @log=#<Log:0x007fd173035d58 @history=[]>>
2.4.0 :003 > account.deposit(50)
2.4.0 :004 > account.withdraw(40)
2.4.0 :005 > account.withdraw(30)
Insufficient funds - you have been charged a 10% overdraft fee
2.4.0 :006 > account.balance
 => -22
2.4.0 :007 > account.view_statement
Date				              Amount		 Balance
Wed Apr 19 14:03:02 2017	50		     50
Wed Apr 19 14:03:12 2017	-40		     10
Wed Apr 19 14:03:30 2017	-30		     -22
```

### User Stories
```
As an account-holder,  
So I can add to my account,  
I want to deposit an amount of money.  

As an account-holder,  
So I can use money in my account,  
I want to withdraw an amount of money.  

As an account-holder,  
So I have visibility over my bank account status and history,  
I want to see my account statement with date, credit/debit and running balance.  


As a bank manager,  
So the bank can make money,  
I want to charge people if they go overdrawn.  

```
