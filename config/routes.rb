Rails.application.routes.draw do
  get '/birds' => 'birds#index' #index
  get '/birds/:id' => 'birds#show' #new
end