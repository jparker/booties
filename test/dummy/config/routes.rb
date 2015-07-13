Rails.application.routes.draw do

  get 'home/breadcrumbs'
  get 'home/flag'
  get 'home/modal'

  mount Booties::Engine => "/booties"
end
