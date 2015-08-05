require 'test_helper'
require 'minitest/mock'

module Booties
  class PanelHelperTest < ActionView::TestCase
    test '#panel instantiates a new Panel and calls render' do
      panel_class = Minitest::Mock.new
      panel_instance = Minitest::Mock.new

      panel_class.expect :new, panel_instance, [self, {}]
      panel_instance.expect :render, true

      panel with: panel_class

      panel_class.verify
      panel_instance.verify
    end

    test '#panel instantiates a new Panel with the given context' do
      panel_class = Minitest::Mock.new
      panel_instance = Minitest::Mock.new

      panel_class.expect :new, panel_instance, [self, { context: :primary }]
      panel_instance.expect :render, true

      panel context: :primary, with: panel_class

      panel_class.verify
      panel_instance.verify
    end
  end
end
