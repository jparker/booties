Rails.application.routes.draw do
  get 'samples/badges'

  get 'samples/breadcrumbs'

  get 'samples/buttons'

  get 'samples/dropdowns'

  get 'samples/flags'

  get 'samples/modals'

  get 'samples/panels'

  get 'samples/popovers'

  get 'samples/tooltips'

  mount Booties::Engine => "/booties"
end
