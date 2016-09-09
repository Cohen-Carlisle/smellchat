Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'message#all'
  post 'message/create' => 'message#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
