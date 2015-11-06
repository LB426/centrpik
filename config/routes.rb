# coding: utf-8
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
  # тесты
  get    'tests'                => 'tests#index'
  get    'tests/new'            => 'tests#new'
  post   'tests'                => 'tests#create'
  get    'tests/:id/edit'       => 'tests#edit',            :as => 'test_edit'
  patch  'tests/:id'            => 'tests#update',          :as => 'test_update'
  delete 'tests/:id'            => 'tests#destroy',         :as => 'test_destroy'
  # тестовые вопросы
  get    'tests/:id/question/new' => 'test_questions#new',    :as => 'test_questions_new'
  post   'tests/:id/questions'    => 'test_questions#create', :as => 'test_questions_create'
  delete 'tests/:test_id/question/:question_id' => 'test_questions#destroy', :as => 'test_question_destroy'
  patch  'tests/:test_id/question/:question_id' => 'test_questions#update',  :as => 'test_questions_update'
  delete 'tests/:test_id/answer/:answer_id' => 'test_questions#answer_destroy',:as => 'test_questions_answer_destroy'
  # тестирование
  get  'tests/:test_id/questions/:question_id/testing/new'      => 'testing#new',      :as => 'testing_new'
  post 'tests/:test_id/questions/:question_id/testing'          => 'testing#create',   :as => 'testing_result_create'
  get  'tests/:test_id/questions/:question_id/testing/continue' => 'testing#continue', :as => 'testing_continue'
  get  'tests/:id/attempt/:attempt/show'                        => 'testing#show',     :as => 'testing_result_show'
  get  'tests/:id/testing/details'                              => 'testing#details',  :as => 'testing_details'  
end
