# frozen_string_literal: true

require 'test_helper'

module Booties
  class ButtonHelperTest < ActionView::TestCase
    def test_btn_link_to_renders_link_with_btn_classes
      expected = '<a href="/foo" class="btn btn-default">Foo</a>'
      assert_dom_equal expected, btn_link_to('Foo', '/foo')
    end

    def test_btn_link_to_context_can_be_overridden
      expected = '<a href="/foo" class="btn btn-primary">Foo</a>'
      assert_dom_equal expected, btn_link_to('Foo', '/foo', context: :primary)
    end

    def test_btn_link_to_passes_extra_as_html_options_to_link_to
      expected = '<a href="/foo" class="btn btn-default btn-xs" data-method="delete" rel="nofollow">Foo</a>'
      assert_dom_equal expected, btn_link_to('Foo', '/foo', class: 'btn-xs', method: :delete)
    end

    def test_btn_link_to_with_a_block
      expected = '<a href="/foo" class="btn btn-default btn-xs">Foo</a>'
      assert_dom_equal expected, btn_link_to('/foo', class: 'btn-xs') { 'Foo' }
    end
  end
end
