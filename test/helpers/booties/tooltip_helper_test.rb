require 'test_helper'

module Booties
  class TooltipHelperTest < ActionView::TestCase
    test '#tooltip renders span tag with given title' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar') { 'baz' }
    end

    test '#tooltip with bottom placement' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'bottom' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :bottom) { 'baz' }
    end

    test '#tooltip with right placement' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'right' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :right) { 'baz' }
    end

    test '#tooltip with left placement' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip', placement: 'left' }, title: 'foo bar'

      assert_equal expected, tooltip(title: 'foo bar', placement: :left) { 'baz' }
    end

    test '#tooltip with unrecognized placement' do
      e = assert_raises ArgumentError do
        tooltip(title: 'foo bar', placement: :bogus) {}
      end
      assert_equal 'invalid placement: :bogus, valid placements are: :top, :bottom, :left, :right',
        e.message
    end

    test '#tooltip accepts additional html attributes' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo', class: 'bar'

      assert_equal expected, tooltip(title: 'foo', class: 'bar') { 'baz' }
    end
  end
end
