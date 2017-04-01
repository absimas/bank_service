# Bank service
## Installation

* docker build -t absimas/bank:1.0 .
* docker run -p 80:80 -d absimas/bank:1.0

## Endpoints

| Endpoint               | Explanation                                        |
| ---------------------- | --------------------------------------------------:|
|/accounts               | all accounts                                       |
|/accounts/1             | account with id 1                                  |
|/accounts/1/sent        | transactions sent by account with id 1             |
|/accounts/1/received    | transactions received by account with id 1         |
|/transactions/account/1 | all transactions associated with account with id 1 |
|/transactions           | all transactions                                   |
|/transactions/1         | transaction with id 1                              |

## Structure
### Account
```javascript
{
  "id": 1,
  "first_name": "Simas",
  "last_name": "Abramovas",
  "balance": 150.0
}
```

### Transaction
```javascript
{
"id": 1,
"sender_id": 1,
"receiver_id": 2,
"amount": 10.0
}
```

# External currency service
http://api.fixer.io/latest?symbols=GBP

## Endpoints
| Endpoint                   | Explanation            |
| -------------------------- | ----------------------:|
| /accounts/1/balance/EUR    | balance in euros       |
| /accounts/1/balance/USD    | balance in US dollars  |
| /accounts/1/balance/GBP    | balance in GB pounds   |
| /transactions/1/amount/EUR | amount in euros        |
| /transactions/1/amount/USD | amount in US dollars   |
| /transactions/1/amount/GBP | amount in GB pounds    |
