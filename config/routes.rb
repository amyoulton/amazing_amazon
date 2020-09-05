Rails.application.routes.draw do
  
  resource :session, only: [:new, :create, :destroy]
  
  resources :products do
    resources :reviews, only: [:create, :destroy] do
      resources :likes, shallow: true, only: [:create, :destroy]
    end
 end

  
  
  get("/", to: "welcome#home")
  # this is a get request for the home method inside of the welcome controller

  get("/about", to: "welcome#about")
  # this is a get request for the about method inside of the welcome controller
  get("/contact_us", to: "welcome#contact_us")

  post("/process_contact", to: "welcome#process_contact")

  get("/bill_splitter", to: "welcome#bill_split")

  post("process_bill", to: "welcome#process_bill")

  get("/admin", to: "welcome#admin")

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: [:index, :show]

    end
  end
end
