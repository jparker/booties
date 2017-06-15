require 'test_helper'

module Booties
  class FlagHelperTest < ActionView::TestCase
    def test_flag_renders_span_tag_with_label_classes
      expected = '<span class="label label-default">content</span>'
      assert_equal expected, flag('content')
    end

    def test_flag_accepts_a_custom_context
      expected = '<span class="label label-primary">content</span>'
      assert_equal expected, flag('content', context: :primary)
    end

    def test_flag_passes_miscellaneous_options_through_to_content_tag
      expected = '<span class="label label-default" id="foo">content</span>'
      assert_equal expected, flag('content', id: 'foo')
    end

    def test_flag_accepts_content_as_a_block
      expected = '<span class="label label-default" id="foo">content</span>'
      assert_equal expected, flag(id: 'foo') { 'content' }
    end

    def test_flag_merges_optional_classes_with_label_classes
      expected = '<span class="label label-default foo">content</span>'
      assert_equal expected, flag('content', class: 'foo')
    end
  end
end
