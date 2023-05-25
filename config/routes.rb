Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Defines the root path route ("/")
  root "home#index"

  # Defines the section path route ("/")
  get '/section/:sectionId', to: 'section#index', as: 'section'

  # Defines the article path route ("/")
  get '/section/:sectionId/article/:articleId', to: 'article#index', as: 'article'
end
