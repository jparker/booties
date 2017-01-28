# frozen-string-literal: true

require 'test_helper'

module Booties
  class PopoverHelperTest < ActionView::TestCase
    CONTENT = 'Lorem ipsum dolor sin amet'

    def test_popover_with_string
      expected = content_tag :a, 'Link text',
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, }
      assert_equal expected, popover('Link text', content: CONTENT)
    end

    def test_popover_with_block
      expected = content_tag :a, 'Link text',
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, }
      assert_equal expected, popover(content: CONTENT) { 'Link text' }
    end

    def test_popover_requires_content_argument
      e = assert_raises(ArgumentError) { popover 'Link text' }
      assert_equal 'missing keyword: content', e.message
    end

    def test_popover_with_title
      expected = content_tag :a, 'Link text',
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, },
        title: 'Lorem ipsum'
      assert_equal expected,
        popover('Link text', content: CONTENT, title: 'Lorem ipsum')
    end

    def test_popover_with_placement
      expected = content_tag :a, 'Link text',
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, placement: :top, }
      assert_equal expected,
        popover('Link text', content: CONTENT, placement: :top)
    end

    def test_popover_with_invalid_placement
      e = assert_raises(ArgumentError) {
        popover content: CONTENT, placement: :bogus
      }
      assert_equal 'invalid placement: :bogus, ' \
        'valid placements are :left, :right, :top, :bottom', e.message
    end

    def test_popover_with_trigger
      expected = content_tag :a, 'Link text',
        tabindex: 10,
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, trigger: 'focus', }
      assert_equal expected,
        popover('Link text', content: CONTENT, trigger: :focus)
    end

    def test_popover_with_container
      expected = content_tag :a, 'Link text',
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, container: 'body', }
      assert_equal expected,
        popover('Link text', content: CONTENT, container: 'body')
    end

    def test_popover_with_custom_tabindex
      expected = content_tag :a, 'Link text',
        tabindex: 42,
        role: 'button',
        data: { toggle: 'popover', content: CONTENT, trigger: 'focus', }
      assert_equal expected,
        popover('Link text', content: CONTENT, trigger: :focus, tabindex: 42)
    end

    def test_popover_with_tag
      expected = content_tag :button, 'Link text',
        type: 'button',
        data: { toggle: 'popover', content: CONTENT, }
      assert_equal expected,
        popover('Link text', content: CONTENT, tag: :button)
    end

    def test_popover_passes_other_options_through_to_content_tag
      expected = content_tag :a, 'Link text',
        class: 'btn btn-default',
        data: { foo: 'bar', toggle: 'popover', content: CONTENT, },
        role: 'button'
      assert_equal expected,
        popover('Link text', content: CONTENT, class: 'btn btn-default', data: { foo: 'bar' })
    end
  end
end
