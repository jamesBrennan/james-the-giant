JamesTheGiant::Application.routes.draw do
  root to: 'pages#root'

  get 'releases/james-the-giant/one-sheet' => 'pages#onesheet'
  get 'epk' => 'pages#epk'
  get 'reviews/monkey-buzz-translation' => 'pages#monkeybuzz'

  get '/auth/:provider/callback' => 'admin/sessions#create'
  post '/auth/:provider/callback' => 'admin/sessions#create'
  get '/auth/failure' => 'admin/sessions#failure'

  namespace :admin do
    root to: 'admin#index'

    get '/sign_in'  => 'sessions#new',           as: :sign_in
    get '/sign_out' => 'sessions#destroy',       as: :sign_out
  end
end
