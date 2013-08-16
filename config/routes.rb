JamesTheGiant::Application.routes.draw do
  root to: 'pages#root'

  get 'releases/james-the-giant/one-sheet' => 'pages#onesheet'
  get 'epk' => 'pages#epk'
  get 'reviews/monkey-buzz-translation' => 'pages#monkeybuzz'
end
