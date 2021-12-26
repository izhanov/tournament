Rails.application.routes.draw do
  root 'welcome#index'

  resources :teams
  resources :divisions do
    resources :teams_in_divisions
  end

  get :tourney, to: 'tourneys#index'
end
