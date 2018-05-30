Rails.application.routes.draw do
  root "welcome#index"
  post '/word-search', to: 'word_search#create'

  namespace :api do
    namespace :v1 do
      resources :games, only: %i[show]
    end
  end
end
