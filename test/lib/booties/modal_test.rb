# frozen_string_literal: true

require 'test_helper'
require 'stub_view'

module Booties
  class ModalTest < Minitest::Test
    def setup
      @template = StubView.new
      @backend = I18n.backend
      I18n.backend = I18n::Backend::KeyValue.new({})
      I18n.enforce_available_locales = false
    end

    def teardown
      I18n.backend = @backend
    end

    def test_render_renders_a_fading_modal_with_an_id_and_a_dialog
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal fade" id="foo"><div class="modal-dialog">' \
                 '<div class="modal-content"></div></div></div>'
      actual = modal.render {}
      assert_equal expected, actual
    end

    def test_render_renders_a_non_fading_modal_when_fade_is_falsey
      modal = Modal.new @template, id: 'foo', fade: false
      expected = '<div class="modal" id="foo"><div class="modal-dialog">' \
                 '<div class="modal-content"></div></div></div>'
      actual = modal.render {}
      assert_equal expected, actual
    end

    def test_render_passes_misc_options_to_outer_container
      modal = Modal.new @template, id: 'foo'
      expected = /<div class="modal fade foo" id="foo" data-bar="baz">/
      actual = modal.render(class: 'foo', data: { bar: 'baz' }) {}
      assert_match expected, actual
    end

    def test_large_modal
      modal = Modal.new @template, id: 'foo', size: :large
      expected = /<div class="modal-dialog modal-lg">/
      actual = modal.render {}
      assert_match expected, actual
    end

    def test_small_modal
      modal = Modal.new @template, id: 'foo', size: :small
      expected = /<div class="modal-dialog modal-sm">/
      actual = modal.render {}
      assert_match expected, actual
    end

    def test_dialog_renders_a_modal_dialog_with_a_modal_content
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-dialog"><div class="modal-content">' \
                 '</div></div>'
      actual = modal.dialog {}
      assert_equal expected, actual
    end

    def test_content_renders_a_modal_content
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-content"></div>'
      actual = modal.content {}
      assert_equal expected, actual
    end

    def test_content_yields_modal_to_block
      modal = Modal.new @template, id: 'foo'
      yielded_modal = nil
      modal.content do |m|
        yielded_modal = m
      end
      assert_same modal, yielded_modal
    end

    def test_header_renders_a_modal_header_with_a_title_and_a_dismissal
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-header">' \
                 '<button class="close" data-dismiss="modal" type="button">' \
                 '&times;' \
                 '</button><h4 class="modal-title">content</h4></div>'
      actual = modal.header { 'content' }
      assert_equal expected, actual
    end

    def test_header_renders_a_modal_header_withouth_a_dismissal
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-header">' \
                 '<h4 class="modal-title">content</h4></div>'
      actual = modal.header(close: false) { 'content' }
      assert_equal expected, actual
    end

    def test_header_uses_html_dismissal
      icon = '<span class="glyphicon glyphicon-remove" aria-label="Dismiss"></span>'
      translations = {}
      I18n.backend = I18n::Backend::KeyValue.new translations
      I18n.backend.store_translations I18n.locale,
                                      booties: { modal: { dismiss_html: icon } }

      modal = Modal.new @template, id: 'foo'
      expected = %r{<button class="close" data-dismiss="modal" type="button">#{icon}</button>}
      actual = modal.header { 'content' }
      assert_match expected, actual
    end

    def test_header_falls_back_on_non_html_dismissal
      translations = {}
      I18n.backend = I18n::Backend::KeyValue.new translations
      I18n.backend.store_translations I18n.locale,
                                      booties: { modal: { dismiss: 'close' } }

      modal = Modal.new @template, id: 'foo'
      expected = %r{<button class="close" data-dismiss="modal" type="button">close</button>}
      actual = modal.header { 'content' }
      assert_match expected, actual
    end

    def test_header_falls_back_on_default_dismissal
      translations = {}
      I18n.backend = I18n::Backend::KeyValue.new translations

      modal = Modal.new @template, id: 'foo'
      expected = %r{<button class="close" data-dismiss="modal" type="button">&times;</button>}
      actual = modal.header { 'content' }
      assert_match expected, actual
    end

    def test_body_renders_a_modal_body
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-body">content</div>'
      actual = modal.body { 'content' }
      assert_equal expected, actual
    end

    def test_footer_renders_a_modal_footer
      modal = Modal.new @template, id: 'foo'
      expected = '<div class="modal-footer">content</div>'
      actual = modal.footer { 'content' }
      assert_equal expected, actual
    end

    def test_title_renders_a_modal_title
      modal = Modal.new @template, id: 'foo'
      expected = '<h4 class="modal-title">content</h4>'
      actual = modal.title('content')
      assert_equal expected, actual
    end

    def test_title_accepts_content_as_a_block
      modal = Modal.new @template, id: 'foo'
      expected = '<h4 class="modal-title">content</h4>'
      actual = modal.title { 'content' }
      assert_equal expected, actual
    end

    def test_dismiss_renders_a_dismiss_button
      modal = Modal.new @template, id: 'foo'
      expected = '<button class="close" data-dismiss="modal" type="button">' \
                 'content</button>'
      actual = modal.dismiss('content')
      assert_equal expected, actual
    end

    def test_dismiss_accepts_content_as_a_block
      modal = Modal.new @template, id: 'foo'
      expected = '<button class="close" data-dismiss="modal" type="button">' \
                 'content</button>'
      actual = modal.dismiss { 'content' }
      assert_equal expected, actual
    end

    def test_dismiss_accepts_custom_class
      modal = Modal.new @template, id: 'foo'
      expected = '<button class="btn btn-default" data-dismiss="modal"' \
                 ' type="button">content</button>'
      actual = modal.dismiss('content', class: 'btn btn-default')
      assert_equal expected, actual
    end

    def test_dismiss_accepts_custom_class_and_block
      modal = Modal.new @template, id: 'foo'
      expected = '<button class="btn btn-default" data-dismiss="modal"' \
                 ' type="button">content</button>'
      actual = modal.dismiss(class: 'btn btn-default') { 'content' }
      assert_equal expected, actual
    end
  end
end
