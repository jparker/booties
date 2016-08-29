require 'test_helper'

module Booties
  class BreadcrumbHelperTest < ActionView::TestCase
    def test_breadcrumbs_renders_ol_tag_with_breadcrumb_class
      expected = '<ol class="breadcrumb"><li class="active">Hi</li></ol>'
      actual = render_breadcrumbs { '<li class="active">Hi</li>'.html_safe }
      assert_equal expected, actual
    end
  end
end
