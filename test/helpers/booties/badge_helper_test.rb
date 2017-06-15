require 'test_helper'

module Booties
  class BadgeHelperTest < ActionView::TestCase
    def test_badge_renders_span_tag_with_badge_class
      expected = '<span class="badge">content</span>'
      assert_equal expected, badge('content')
    end

    def test_badge_passes_miscellaneous_options_through_to_content_tag
      expected = '<span class="badge" id="foo">content</span>'
      assert_equal expected, badge('content', id: 'foo')
    end

    def test_badge_merges_optional_classes_with_badge_class
      expected = '<span class="badge foo">content</span>'
      assert_equal expected, badge('content', class: 'foo')
    end

    def test_badge_accepts_content_as_a_block
      expected = '<span class="badge" id="foo">Bar</span>'
      assert_equal expected, badge(id: 'foo') { 'Bar' }
    end

    def test_badge_handles_nil_content_when_no_block_is_given
      expected = '<span class="badge"></span>'
      assert_equal expected, badge(nil)
    end
  end
end
