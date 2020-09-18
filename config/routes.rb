Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'static_pages/contact'

end
