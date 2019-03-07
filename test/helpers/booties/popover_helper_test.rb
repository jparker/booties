# frozen-string-literal: true

require 'test_helper'

module Booties
  class PopoverHelperTest < ActionView::TestCase
    CONTENT = 'Lorem ipsum dolor sin amet'

    def test_popover_with_string
      expected = '<a role="button" data-toggle="popover" data-content="Lorem ipsum">Link text</a>'
      assert_dom_equal expected, popover('Link text', content: 'Lorem ipsum')
    end

    def test_popover_with_block
      expected = '<a role="button" data-toggle="popover" data-content="Lorem ipsum">Link text</a>'
      assert_equal expected, popover(content: 'Lorem ipsum') { 'Link text' }
    end

    def test_popover_requires_content_argument
      e = assert_raises(ArgumentError) { popover 'Link text' }
      assert_equal 'missing keyword: content', e.message
    end

    def test_popover_with_title
      expected = '<a role="button" title="Lorem ipsum" data-toggle="popover" data-content="Lorem ipsum dolor sin amet">Link text</a>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum dolor sin amet', title: 'Lorem ipsum')
    end

    def test_popover_with_placement
      expected = '<a role="button" data-toggle="popover" data-content="Lorem ipsum" data-placement="top">Link text</a>'
      assert_equal expected, popover('Link text', content: 'Lorem ipsum', placement: :top)
    end

    def test_popover_with_invalid_placement
      e = assert_raises(ArgumentError) {
        popover content: 'Lorem ipsum', placement: :bogus
      }
      assert_equal 'invalid placement: :bogus, ' \
        'valid placements are :left, :right, :top, :bottom', e.message
    end

    def test_popover_with_trigger
      expected = '<a tabindex="10" role="button" data-toggle="popover" data-content="Lorem ipsum" data-trigger="focus">Link text</a>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum', trigger: :focus)
    end

    def test_popover_with_container
      expected = '<a role="button" data-toggle="popover"' \
                 ' data-content="Lorem ipsum" data-container="body">Link text</a>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum', container: 'body')
    end

    def test_popover_with_custom_tabindex
      expected = '<a tabindex="42" role="button" data-toggle="popover" data-content="Lorem ipsum" data-trigger="focus">Link text</a>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum', trigger: :focus, tabindex: 42)
    end

    def test_popover_with_tag
      expected = '<button type="button" data-toggle="popover" data-content="Lorem ipsum">Link text</button>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum', tag: :button)
    end

    def test_popover_passes_other_options_through_to_content_tag
      expected = '<a class="btn btn-default" data-foo="bar" data-toggle="popover" data-content="Lorem ipsum" role="button">Link text</a>'
      assert_dom_equal expected,
        popover('Link text', content: 'Lorem ipsum', class: 'btn btn-default', data: { foo: 'bar' })
    end
  end
end
