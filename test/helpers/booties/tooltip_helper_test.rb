require 'test_helper'

module Booties
  class TooltipHelperTest < ActionView::TestCase
    def test__tooltip_renders_span_tag_with_given_title
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar') { 'baz' }
    end

    def test__tooltip_with_bottom_placement
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'bottom' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :bottom) { 'baz' }
    end

    def test__tooltip_with_right_placement
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'right' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :right) { 'baz' }
    end

    def test__tooltip_with_left_placement
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'left' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :left) { 'baz' }
    end

    def test__tooltip_with_unrecognized_placement
      e = assert_raises ArgumentError do
        tooltip(title: 'foo bar', placement: :bogus) {}
      end
      assert_equal 'invalid placement: :bogus, ' \
        'valid placements are :left, :right, :top, :bottom', e.message
    end

    def test__tooltip_renders_tooltip_using_alternative_wrapper_tag
      expected = content_tag :abbr, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo'

      assert_equal expected, tooltip(title: 'foo', wrapper_tag: :abbr) { 'baz' }
    end

    def test__tooltip_accepts_additional_html_attributes
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo', class: 'bar'

      assert_equal expected, tooltip(title: 'foo', class: 'bar') { 'baz' }
    end
  end
end
