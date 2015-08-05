require 'test_helper'
require 'minitest/mock'

module Booties
  class ApplicationHelperTest < ActionView::TestCase
    test '#render_breadcrumbs renders ol tag with breadcrumb class' do
      expected = '<ol class="breadcrumb"></ol>'
      assert_equal expected, render_breadcrumbs {}
    end
  end
end
