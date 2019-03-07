# frozen_string_literal: true

require 'test_helper'
require 'stub_view'

module Booties
  class PanelTest < Minitest::Test
    def setup
      @template = StubView.new
    end

    def test_default_panel
      expected = '<div class="panel panel-default">content</div>'
      actual = panel.render { 'content' }
      assert_equal expected, actual
    end

    def test_panel_with_custom_context
      panel = Panel.new @template, context: :primary
      expected = '<div class="panel panel-primary">content</div>'
      actual = panel.render { 'content' }
      assert_equal expected, actual
    end

    def test_render_panel_with_custom_wrapper_tag
      panel = Panel.new @template, wrapper_tag: 'fieldset'
      expected = '<fieldset class="panel panel-default"></fieldset>'
      actual = panel.render {}
      assert_equal expected, actual
    end

    def test_optional_arguments_to_panel
      panel = Panel.new @template, id: 'foo', class: 'bar'
      expected = '<div class="panel panel-default bar" id="foo"></div>'
      actual = panel.render {}
      assert_equal expected, actual
    end

    def test_render_yields_panel_to_block
      panel = Panel.new @template
      yielded_panel = nil
      panel.render { |p| yielded_panel = p }
      assert_same panel, yielded_panel
    end

    def test_panel_heading
      expected = '<div class="panel-heading">content</div>'
      actual = panel.heading('content')
      assert_equal expected, actual
    end

    def test_panel_heading_accepts_block
      expected = '<div class="panel-heading">content</div>'
      actual = panel.heading { 'content' }
      assert_equal expected, actual
    end

    def test_panel_heading_with_optional_arguments
      expected = '<div class="panel-heading foo" id="bar"></div>'
      actual = panel.heading('', class: 'foo', id: 'bar')
      assert_equal expected, actual
    end

    def test_panel_title
      expected = '<h3 class="panel-title">content</h3>'
      actual = panel.title('content')
      assert_equal expected, actual
    end

    def test_panel_title_accepts_block
      expected = '<h3 class="panel-title">content</h3>'
      actual = panel.title { 'content' }
      assert_equal expected, actual
    end

    def test_panel_title_with_optional_arguments
      expected = '<h3 class="panel-title foo" id="bar"></h3>'
      actual = panel.title('', class: 'foo', id: 'bar')
      assert_equal expected, actual
    end

    def test_panel_body
      expected = '<div class="panel-body">content</div>'
      actual = panel.body('content')
      assert_equal expected, actual
    end

    def test_panel_body_accepts_block
      expected = '<div class="panel-body">content</div>'
      actual = panel.body { 'content' }
      assert_equal expected, actual
    end

    def test_panel_body_with_optional_arguments
      expected = '<div class="panel-body foo" id="bar"></div>'
      actual = panel.body('', class: 'foo', id: 'bar')
      assert_equal expected, actual
    end

    def test_panel_footer
      expected = '<div class="panel-footer">content</div>'
      actual = panel.footer('content')
      assert_equal expected, actual
    end

    def test_panel_footer_accepts_block
      expected = '<div class="panel-footer">content</div>'
      actual = panel.footer { 'content' }
      assert_equal expected, actual
    end

    def test_panel_footer_with_optional_arguments
      expected = '<div class="panel-footer foo" id="bar"></div>'
      actual = panel.footer('', class: 'foo', id: 'bar')
      assert_equal expected, actual
    end

    private

    def panel
      @panel ||= Panel.new @template
    end
  end
end
