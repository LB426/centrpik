# coding: utf-8
Rails.application.routes.draw do
  root                'static_pages#home'
  get       'help' => 'static_pages#help'
  get      'about' => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get  'dlearning' => 'static_pages#dlearning'
  get    'library' => 'static_pages#library'
  # session  
  get      'login' => 'sessions#new'
  post     'login' => 'sessions#create'
  delete  'logout' => 'sessions#destroy'
  # users
  get     'signup' => 'users#new'
  resources :users
  resources :corporates,  controller: 'users', type: 'Corporate'
  resources :individuals, controller: 'users', type: 'Individual'
  get '/employe/new' => 'users#employe_new', :as => 'employe_new'
  get '/employes'    => 'users#employes', :as => 'employes'
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # posts
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
  get  'tests/:test_id/attempt/:attempt/comment' => 'testing#attempt_comment', :as => 'testing_attempt_comment'
  get  'tests/:id/attempt/:attempt/show'                        => 'testing#show',     :as => 'testing_result_show'
  get  'tests/:id/testing/details'                              => 'testing#details',  :as => 'testing_details'  
  # обучающее видео
  get 'tvideo' => 'training_video#index', :as => 'training_video'
  # учебные курсы
  resources :courses
  # статистика
  get 'statistics/index'
  get 'statistics/user/:id/courses' => 'statistics#courses', :as => 'stat_courses'
  get 'statistics/user/:user_id/course/:course_id/attempt/:attempt_id' => 'statistics#course', :as => 'stat_course'
  # компания
  resources :companies
end
