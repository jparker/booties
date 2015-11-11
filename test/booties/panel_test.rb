require 'test_helper'
require 'stub_view'

module Booties
  class PanelTest < Minitest::Test
    def setup
      @view_context = StubView.new
    end

    def test_default_panel
      expected = '<div class="panel panel-default">content</div>'
      assert_equal expected, panel.render { 'content' }
    end

    def test_panel_with_custom_context
      panel = Panel.new @view_context, context: :primary
      expected = '<div class="panel panel-primary">content</div>'
      assert_equal expected, panel.render { 'content' }
    end

    def test_render_panel_with_custom_wrapper_tag
      panel = Panel.new @view_context, wrapper_tag: 'fieldset'
      expected = '<fieldset class="panel panel-default"></fieldset>'
      assert_equal expected, panel.render {}
    end

    def test_optional_arguments_to_panel
      panel = Panel.new @view_context, id: 'foo', class: 'bar'
      expected = '<div class="panel panel-default bar" id="foo"></div>'
      assert_equal expected, panel.render {}
    end

    def test_render_yields_panel_to_block
      panel = Panel.new @view_context
      yielded_panel = nil
      panel.render do |p|
        yielded_panel = p
      end
      assert_same panel, yielded_panel
    end

    def test_panel_heading
      expected = '<div class="panel-heading">content</div>'
      assert_equal expected, panel.heading('content')
    end

    def test_panel_heading_accepts_block
      expected = '<div class="panel-heading">content</div>'
      assert_equal expected, panel.heading { 'content' }
    end

    def test_panel_title
      expected = '<h3 class="panel-title">content</h3>'
      assert_equal expected, panel.title('content')
    end

    def test_panel_title_accepts_block
      expected = '<h3 class="panel-title">content</h3>'
      assert_equal expected, panel.title { 'content' }
    end

    def test_panel_body
      expected = '<div class="panel-body">content</div>'
      assert_equal expected, panel.body('content')
    end

    def test_panel_body_accepts_block
      expected = '<div class="panel-body">content</div>'
      assert_equal expected, panel.body { 'content' }
    end

    def test_panel_footer
      expected = '<div class="panel-footer">content</div>'
      assert_equal expected, panel.footer('content')
    end

    def test_panel_footer_accepts_block
      expected = '<div class="panel-footer">content</div>'
      assert_equal expected, panel.footer { 'content' }
    end

    private

    def panel
      @panel ||= Panel.new @view_context
    end
  end
end
