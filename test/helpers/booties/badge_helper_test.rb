require 'test_helper'

module Booties
  class BadgeHelperTest < ActionView::TestCase
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

    test '#badge accepts content as a block' do
      expected = '<span class="badge" id="foo">Bar</span>'
      assert_equal expected, badge(id: 'foo') { 'Bar' }
    end

    test '#badge handles nil content when no block is given' do
      expected = '<span class="badge"></span>'
      assert_equal expected, badge(nil)
    end
  end
end
