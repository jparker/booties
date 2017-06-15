require 'test_helper'

module Booties
  class ButtonHelperTest < ActionView::TestCase
    def test_btn_link_to_renders_link_with_btn_classes
      expected = link_to 'Foo', '/foo', class: 'btn btn-default'
      assert_equal expected, btn_link_to('Foo', '/foo')
    end

    def test_btn_link_to_context_can_be_overridden
      expected = link_to 'Foo', '/foo', class: 'btn btn-primary'
      assert_equal expected, btn_link_to('Foo', '/foo', context: :primary)
    end

    def test_btn_link_to_passes_extra_as_html_options_to_link_to
      expected = link_to 'Foo', '/foo', class: 'btn btn-default btn-xs', method: :delete
      assert_equal expected, btn_link_to('Foo', '/foo', class: 'btn-xs', method: :delete)
    end

    def test_btn_link_to_with_a_block
      expected = link_to 'Foo', '/foo', class: 'btn btn-default btn-xs'
      assert_equal expected, btn_link_to('/foo', class: 'btn-xs') { 'Foo' }
    end
  end
end
