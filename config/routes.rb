Rails.application.routes.draw do

  resources :transactions
  resources :accounts
  get '/transactions/sender/:id', to: 'transactions#sender'
  get '/transactions/recipient/:id', to: 'transactions#recipient'
  get '/accounts/:id/sent', to: redirect('/transactions/sender/%{id}')
  get '/accounts/:id/received', to: redirect('/transactions/recipient/%{id}')

end
