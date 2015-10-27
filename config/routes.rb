Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  get    'library' => 'static_pages#library'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  get  'tests'         => 'tests#index'
  get  'tests/new'     => 'tests#new'
  post 'tests'         => 'tests#create'
  get 'tests/:id/edit' => 'tests#edit', :as => 'test_edit'
  get 'tests/:id/question/new' => 'test_questions#new',    :as => 'test_questions_new'
  post 'tests/:id/questions'   => 'test_questions#create', :as => 'test_questions_create'
end
