# frozen_string_literal: true

module Booties
  class Engine < ::Rails::Engine # :nodoc:
    isolate_namespace Booties

    initializer 'booties.view_helpers' do
      ActionView::Base.send :include, helpers
    end
  end
end
