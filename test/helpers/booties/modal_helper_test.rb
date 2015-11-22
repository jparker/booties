require 'test_helper'
require 'minitest/mock'

module Booties
  class ModalHelperTest < ActionView::TestCase
    test '#modal instantiates a new Modal and calls render' do
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance,
        [self, id: 'foo', fade: true, size: nil]
      modal_instance.expect :render, true, [{}]

      modal 'foo', with: modal_class

      modal_class.verify
      modal_instance.verify
    end

    test '#modal passes keyword arguments on to Modal constructor' do
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance,
        [self, id: 'foo', fade: false, size: :large]
      modal_instance.expect :render, true, [{}]

      modal 'foo', fade: false, size: :large, with: modal_class

      modal_class.verify
      modal_instance.verify
    end

    test '#modal passes optional arguments on to Modal#render' do
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance,
        [self, id: 'foo', fade: true, size: nil]
      modal_instance.expect :render, true,
        [{ class: 'foo', data: { bar: 'baz' } }]

      modal 'foo', with: modal_class, class: 'foo', data: { bar: 'baz' }

      modal_class.verify
      modal_instance.verify
    end
  end
end
