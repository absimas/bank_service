Rails.application.routes.draw do
  resources :transactions
  resources :accounts
  get '/accounts/:id/balance', to: 'accounts#balance'
  get '/accounts/:id/balance/:currency', to: 'accounts#balance'
  get '/transactions/:id/amount', to: 'transactions#amount'
  get '/transactions/:id/amount/:currency', to: 'transactions#amount'
  get '/transactions/sender/:id', to: 'transactions#sender'
  get '/transactions/recipient/:id', to: 'transactions#recipient'
  get '/transactions/account/:id', to: 'transactions#account', as: :account_transactions
  get '/accounts/:id/sent', to: 'transactions#sender', as: :transactions_sent_by
  get '/accounts/:id/received', to: 'transactions#recipient', as: :transactions_received_by
end