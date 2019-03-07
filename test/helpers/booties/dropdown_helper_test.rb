# frozen_string_literal: true

require 'test_helper'

module Booties
  class DropdownHelperTest < ActionView::TestCase
    def test_link_to_dropdown_renders_link_with_dropdown_options
      expected = '<a class="dropdown-toggle" data-toggle="dropdown" role="button" href="#">Foo<span class="caret"></span></a>'
      actual = link_to_dropdown { 'Foo' }
      assert_dom_equal expected, actual
    end

    def test_link_to_dropdown_with_custom_class
      expected = '<a class="foo dropdown-toggle" data-toggle="dropdown" role="button" href="#">Foo<span class="caret"></span></a>'
      actual = link_to_dropdown(class: 'foo') { 'Foo' }
      assert_dom_equal expected, actual
    end

    def test_button_to_dropdown_renders_button_with_dropdown_options
      expected = '<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Foo<span class="caret"></span></button>'
      actual = button_to_dropdown { 'Foo' }
      assert_dom_equal expected, actual
    end

    def test_button_to_dropdown_with_context
      expected = '<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Foo<span class="caret"></span></button>'
      actual = button_to_dropdown(context: :primary) { 'Foo' }
      assert_dom_equal expected, actual
    end

    def test_button_to_dropdown_with_optional_classes
      expected = '<button type="button" class="btn-xs btn btn-default dropdown-toggle" data-toggle="dropdown">Foo<span class="caret"></span></button>'
      actual = button_to_dropdown(class: 'btn-xs') { 'Foo' }
      assert_dom_equal expected, actual
    end

    def test_dropdown_menu_renders_dropdown_list
      expected = '<ul class="dropdown-menu"><li><a href="#">Foo</a></li></ul>'
      actual = dropdown_menu { content_tag :li, link_to('Foo', '#') }
      assert_dom_equal expected, actual
    end
  end
end
