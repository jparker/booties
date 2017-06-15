require 'test_helper'
require 'minitest/mock'

module Booties
  class PanelHelperTest < ActionView::TestCase
    def test_panel_instantiates_a_new_Panel_and_calls_render
      panel_class = Minitest::Mock.new
      panel_instance = Minitest::Mock.new

      panel_class.expect :new, panel_instance, [self, {}]
      panel_instance.expect :render, true

      panel with: panel_class

      panel_class.verify
      panel_instance.verify
    end

    def test_panel_instantiates_a_new_Panel_with_the_given_context
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
