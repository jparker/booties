require 'test_helper'

module Booties
  class ApplicationHelperTest < ActionView::TestCase
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
  end
end
