# frozen_string_literal: true

require 'test_helper'
require 'minitest/mock'

module Booties
  class ModalHelperTest < ActionView::TestCase
    def test_modal_instantiates_a_new_modal_and_calls_render
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance,
                         [self, id: 'foo', fade: true, size: nil]
      modal_instance.expect :render, true, [{}]

      modal 'foo', with: modal_class

      modal_class.verify
      modal_instance.verify
    end

    def test_modal_passes_keyword_arguments_on_to_modal_constructor
      modal_class = Minitest::Mock.new
      modal_instance = Minitest::Mock.new

      modal_class.expect :new, modal_instance,
                         [self, id: 'foo', fade: false, size: :large]
      modal_instance.expect :render, true, [{}]

      modal 'foo', fade: false, size: :large, with: modal_class

      modal_class.verify
      modal_instance.verify
    end

    def test_modal_passes_optional_arguments_on_to_modal_render
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
