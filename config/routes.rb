JamesTheGiant::Application.routes.draw do
  root to: 'pages#root'

  get 'releases/james-the-giant/one-sheet' => 'pages#onesheet'
end
