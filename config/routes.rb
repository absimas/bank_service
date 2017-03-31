Rails.application.routes.draw do

  resources :transactions
  resources :accounts
  get '/transactions/sender/:id', to: 'transactions#sender'
  get '/transactions/recipient/:id', to: 'transactions#recipient'
  get '/accounts/:id/sent', to: 'transactions#sender'
  get '/accounts/:id/received', to: 'transactions#recipient'

end
