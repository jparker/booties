require 'test_helper'
require 'minitest/mock'

module Booties
  class ApplicationHelperTest < ActionView::TestCase
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
      assert_equal 'invalid placement: :bogus, valid placements are: :top, :bottom, :right, :left',
        e.message
    end

    test '#tooltip accepts additional html attributes' do
      expected = content_tag :span, 'baz',
        data: { toggle: 'tooltip' }, title: 'foo', class: 'bar'

      assert_equal expected, tooltip(title: 'foo', class: 'bar') { 'baz' }
    end

    test '#render_breadcrumbs renders ol tag with breadcrumb class' do
      expected = '<ol class="breadcrumb"></ol>'
      assert_equal expected, render_breadcrumbs {}
    end

    test '#flag renders span tag with label classes' do
      expected = '<span class="label label-default">content</span>'
      assert_equal expected, flag('content')
    end

    test '#flag accepts a custom context' do
      expected = '<span class="label label-primary">content</span>'
      assert_equal expected, flag('content', context: :primary)
    end

    test '#flag passes miscellaneous options through to #content_tag' do
      expected = '<span class="label label-default" id="foo">content</span>'
      assert_equal expected, flag('content', id: 'foo')
    end

    test '#flag accepts content as a block' do
      expected = '<span class="label label-default">content</span>'
      assert_equal expected, flag { 'content' }
    end

    test '#flag merges optional classes with label classes' do
      expected = '<span class="label label-default foo">content</span>'
      assert_equal expected, flag('content', class: 'foo')
    end

    test '#badge renders span tag with badge class' do
      expected = '<span class="badge">content</span>'
      assert_equal expected, badge('content')
    end

    test '#badge passes miscellaneous options through to #content_tag' do
      expected = '<span class="badge" id="foo">content</span>'
      assert_equal expected, badge('content', id: 'foo')
    end

    test '#badge merges optional classes with badge class' do
      expected = '<span class="badge foo">content</span>'
      assert_equal expected, badge('content', class: 'foo')
    end

    test '#modal instantiates a new Modal and calls render' do
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance, [self, id: 'foo', fade: true]
      modal_instance.expect :render, true

      modal 'foo', with: modal_class

      modal_class.verify
      modal_instance.verify
    end

    test '#panel instantiates a new Panel and calls render' do
      panel_class = Minitest::Mock.new
      panel_instance = Minitest::Mock.new

      panel_class.expect :new, panel_instance, [self, {}]
      panel_instance.expect :render, true

      panel with: panel_class

      panel_class.verify
      panel_instance.verify
    end

    test '#panel instantiates a new Panel with the given context' do
      panel_class = Minitest::Mock.new
      panel_instance = Minitest::Mock.new

      panel_class.expect :new, panel_instance, [self, { context: :primary }]
      panel_instance.expect :render, true

      panel context: :primary, with: panel_class

      panel_class.verify
      panel_instance.verify
    end
  end
end
