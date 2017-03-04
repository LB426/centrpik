# coding: utf-8
Rails.application.routes.draw do
  root                'static_pages#home'
  get       'help' => 'static_pages#help'
  get      'about' => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get  'dlearning' => 'static_pages#dlearning'
  get    'library' => 'static_pages#library'
  # session  
  get     'login'      => 'sessions#new'
  post    'login'      => 'sessions#create'
  delete  'logout'     => 'sessions#destroy'
  post    'changeuser/:user_id' => 'sessions#changeuser', :as => 'session_changeuser'
  # users
  get  'signup'                 => 'users#new'
  get  'users/search'           => 'users#search',        :as => 'users_search'
  post 'users/search'           => 'users#searchexec',    :as => 'users_searchexec'
  post 'users/allowtesting/:id' => 'users#allow_testing', :as => 'users_allow_testing'
  post 'users/requesttesting/:id/:course_id' => 'users#request_testing', :as => 'users_request_testing_create'
  get 'users/requesttesting' => 'users#request_testing_show', :as => 'users_request_testing'
  resources :users
  resources :corporates,  controller: 'users', type: 'Corporate'
  resources :individuals, controller: 'users', type: 'Individual'
  # работа корпоративного юзера с сотрудниками
  get    '/employes'    => 'users#employes',       :as => 'employes'
  get    '/employe/new' => 'users#employe_new',    :as => 'employe_new'
  post   '/employe'     => 'users#employe_create', :as => 'employe_create'
  get    '/employe/:id' => 'users#employe_edit',   :as => 'employe_edit'
  patch  '/employe/:id' => 'users#employe_update', :as => 'employe_update'
  delete '/employe/:id' => 'users#employe_destroy',:as => 'employe_destroy'
  
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
  post   'tests/:test_id/question/:question_id' => 'test_questions#update',  :as => 'test_questions_update'
  delete 'tests/:test_id/answer/:answer_id' => 'test_questions#answer_destroy',:as => 'test_questions_answer_destroy'
  # тестирование
  get  'testing/user/:user_id/course/:course_id/test/:test_id/question/:question_id/new'      => 'testing#new',      :as => 'testing_new'
  post 'testing/user/:user_id/course/:course_id/test/:test_id/question/:question_id/create'   => 'testing#create', :as=>'testing_result_create'
  get  'testing/user/:user_id/course/:course_id/test/:test_id/question/:question_id/continue' => 'testing#continue', :as => 'testing_continue'
  get  'tests/:test_id/attempt/:attempt/comment' => 'testing#attempt_comment', :as => 'testing_attempt_comment'
  get  'tests/:id/attempt/:attempt/show'                        => 'testing#show',     :as => 'testing_result_show'
  get  'tests/:id/testing/details'                              => 'testing#details',  :as => 'testing_details'
  # тестирование для корпоративного пользователя
  get 'enterprise/course/:course_id/test/:test_id/employe/select' => 'enterprise#testing_employe_select', :as => 'enterprise_testing_employe_select'
  get 'enterprise/employe/:user_id/course/:course_id/test/:test_id/question/:question_id/testing' => 'enterprise#testing', :as => 'enterprise_testing'
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
  # учебные материалы
  resources :edumaterials
  resources :books,  controller: 'edumaterials', type: 'Book'
  resources :videos,  controller: 'edumaterials', type: 'Video'
  # линк курса с тестом
  post   'links/course/:course_id/test/:test_id'   => 'links#create_course_to_test_link',   :as => 'link_course_test_create'
  delete 'links/course/:course_id/test/:test_id'   => 'links#destroy_course_to_test_link',  :as => 'link_course_test_destroy'
  # линк курса с видео
  post   'links/course/:course_id/video/:video_id' => 'links#create_course_to_video_link',  :as => 'link_course_video_create'
  delete 'links/course/:course_id/video/:video_id' => 'links#destroy_course_to_video_link', :as => 'link_course_video_destroy'
  # линк курса с книгой
  post   'links/course/:course_id/book/:book_id'   => 'links#create_course_to_book_link',   :as => 'link_course_book_create'
  delete 'links/course/:course_id/book/:book_id'   => 'links#destroy_course_to_book_link',  :as => 'link_course_book_destroy'   
  # обучение
  get 'training/courses' => 'training#courses', :as => 'training_courses'
end
