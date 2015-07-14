Rails.application.routes.draw do

  get 'home/badge'
  get 'home/breadcrumbs'
  get 'home/flag'
  get 'home/modal'
  get 'home/panel'

  mount Booties::Engine => "/booties"
end
