require 'test_helper'

module Booties
  class ButtonHelperTest < ActionView::TestCase
    test '#btn_link_to renders link with btn classes' do
      expected = link_to 'Foo', '/foo', class: 'btn btn-default'
      assert_equal expected, btn_link_to('Foo', '/foo')
    end

    test '#btn_link_to context can be overridden' do
      expected = link_to 'Foo', '/foo', class: 'btn btn-primary'
      assert_equal expected, btn_link_to('Foo', '/foo', context: :primary)
    end

    test '#btn_link_to passes extra as html options to #link_to' do
      expected = link_to 'Foo', '/foo', class: 'btn btn-default btn-xs', method: :delete
      assert_equal expected, btn_link_to('Foo', '/foo', class: 'btn-xs', method: :delete)
    end

    test '#btn_link_to with a block' do
      expected = link_to 'Foo', '/foo', class: 'btn btn-default btn-xs'
      assert_equal expected, btn_link_to('/foo', class: 'btn-xs') { 'Foo' }
    end
  end
end
