# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Endpoints
* /accounts           - id, name, lastname, balance
* /accounts/123
* /accounts/123/transactions
* /transactions       - id, source_account, destination_account, amount
* /transactions/123

## External currency service
http://api.fixer.io/latest?symbols=USD,GBP

## External service usage
* /accounts/123/balance/euros   - default
* /accounts/123/balance/dollars - euros to dollars
* /accounts/123/balance/pounds  - euros to pounds
* /transactions/123/amount/euros   - default
* /transactions/123/amount/dollars - euros to dollars
* /transactions/123/amount/pounds  - euros to pounds