require 'test_helper'
require 'minitest/mock'

module Booties
  class ModalHelperTest < ActionView::TestCase
    test '#modal instantiates a new Modal and calls render' do
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance, [self, id: 'foo', fade: true]
      modal_instance.expect :render, true

      modal 'foo', with: modal_class

      modal_class.verify
      modal_instance.verify
    end
  end
end
