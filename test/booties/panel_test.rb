require 'test_helper'
require 'stub_view'

module Booties
  class PanelTest < Minitest::Test
    def setup
      @view_context = StubView.new
    end

    def test_render_renders_a_default_panel
      expected = '<div class="panel panel-default">content</div>'
      assert_equal expected, panel.render { 'content' }
    end

    def test_render_renders_a_panel_with_the_given_context
      panel = Panel.new @view_context, context: :primary
      expected = '<div class="panel panel-primary">content</div>'
      assert_equal expected, panel.render { 'content' }
    end

    def test_render_renders_a_panel_with_optional_attributes
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

    def test_heading_renders_a_panel_heading
      expected = '<div class="panel-heading">content</div>'
      assert_equal expected, panel.heading('content')
    end

    def test_heading_accepts_content_as_a_block
      expected = '<div class="panel-heading">content</div>'
      assert_equal expected, panel.heading { 'content' }
    end

    def test_title_renders_a_panel_title
      expected = '<h3 class="panel-title">content</h3>'
      assert_equal expected, panel.title('content')
    end

    def test_title_accepts_content_as_a_block
      expected = '<h3 class="panel-title">content</h3>'
      assert_equal expected, panel.title { 'content' }
    end

    def test_body_renders_a_panel_body
      expected = '<div class="panel-body">content</div>'
      assert_equal expected, panel.body('content')
    end

    def test_body_accepts_content_as_a_block
      expected = '<div class="panel-body">content</div>'
      assert_equal expected, panel.body { 'content' }
    end

    def test_footer_renders_a_panel_footer
      expected = '<div class="panel-footer">content</div>'
      assert_equal expected, panel.footer('content')
    end

    def test_footer_accepts_content_as_a_block
      expected = '<div class="panel-footer">content</div>'
      assert_equal expected, panel.footer { 'content' }
    end

    private

    def panel
      @panel ||= Panel.new @view_context
    end
  end
end
