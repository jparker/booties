module Booties
  class Engine < ::Rails::Engine
    isolate_namespace Booties

    initializer 'booties.view_helpers' do
      ActionView::Base.send :include, helpers
    end
  end
end
