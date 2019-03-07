# frozen_string_literal: true

require 'test_helper'

module Booties
  class TooltipHelperTest < ActionView::TestCase
    def test_tooltip_renders_span_tag_with_given_title
      assert_dom_equal '<span title="required" data-toggle="tooltip">*</span>',
                       tooltip('*', title: 'required')
    end

    def test_tooltip_accepts_content_as_block
      assert_dom_equal '<span title="required" data-toggle="tooltip">*</span>',
                       tooltip(title: 'required') { '*' }
    end

    def test_tooltip_with_bottom_placement
      assert_dom_equal \
        '<span title="required" data-toggle="tooltip" data-placement="bottom">*</span>',
        tooltip('*', title: 'required', placement: :bottom)
    end

    def test_tooltip_with_right_placement
      assert_dom_equal \
        '<span title="required" data-toggle="tooltip" data-placement="right">*</span>',
        tooltip('*', title: 'required', placement: :right)
    end

    def test_tooltip_with_left_placement
      assert_dom_equal \
        '<span title="required" data-toggle="tooltip" data-placement="left">*</span>',
        tooltip('*', title: 'required', placement: :left)
    end

    def test_tooltip_with_unrecognized_placement
      e = assert_raises ArgumentError do
        tooltip '*', title: 'required', placement: :bogus
      end
      assert_equal \
        'invalid placement: :bogus, valid placements are :left, :right, :top, :bottom',
        e.message
    end

    def test_tooltip_renders_tooltip_using_alternative_wrapper_tag
      assert_dom_equal '<abbr title="required" data-toggle="tooltip">*</abbr>',
                       tooltip('*', title: 'required', wrapper_tag: :abbr)
    end

    def test_tooltip_accepts_additional_html_attributes
      assert_dom_equal \
        '<abbr class="initialism" title="HyperText Markup Language" data-toggle="tooltip">HTML</abbr>',
        tooltip('HTML', title: 'HyperText Markup Language', class: 'initialism', wrapper_tag: :abbr)
    end
  end
end
