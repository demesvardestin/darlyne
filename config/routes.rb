DarlyneFramework.router.config do
  get "/", :to => "custom#index"
  get /.*/, :to => "custom#show"
end