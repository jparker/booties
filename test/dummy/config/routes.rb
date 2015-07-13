Rails.application.routes.draw do

  get 'home/show'

  get 'breadcrumbs/show'

  mount Booties::Engine => "/booties"
end
