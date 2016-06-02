Rails.application.routes.draw do

  get 'home/badge'
  get 'home/breadcrumbs'
  get 'home/button'
  get 'home/flag'
  get 'home/modal'
  get 'home/panel'
  get 'home/tooltip'
  get 'home/popover'

  mount Booties::Engine => "/booties"
end
