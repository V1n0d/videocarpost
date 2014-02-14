Videocarpost::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  get "/dynamic_models", :to => "cars#dynamic_models"
  resources :cars

  #paypal response
  get "/response" , :to => "home#handle_response"
  get "/buy_credits" , :to => "cars#buy_credits", :as=> "buy_credits"
  get "/about_us" , :to => "home#about_us", :as=> "about_us"

  get "/faq" , :to => "home#faq", :as=> "faq"
  get "/contact_us" , :to => "home#contact_us", :as=> "contact_us"


  #paypal error handling
  get "/paypal_error", :to=> "home#paypal_error", :as => "paypal_error"
  get "/display_user/:id" => "home#display"

  match "/is_email_avail", :to => "application#is_email_avail", via: [:get,:post]
  # You can have the root of your site routed with "root"
  root 'cars#index'

  
end
