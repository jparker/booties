require 'test_helper'
require 'stub_view'

module Booties
  class ModalTest < Minitest::Test
    def setup
      @view_context = StubView.new
      @backend      = I18n.backend
      I18n.backend  = I18n::Backend::KeyValue.new({})
      I18n.enforce_available_locales = false
    end

    def teardown
      I18n.backend  = @backend
    end

    def test_render_renders_a_fading_modal_with_an_id_and_a_dialog
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal fade" id="foo"><div class="modal-dialog">' \
        '<div class="modal-content"></div></div></div>'
      assert_equal expected, modal.render {}
    end

    def test_render_renders_a_non_fading_modal_when_fade_is_falsey
      modal = Modal.new @view_context, id: 'foo', fade: false
      expected = '<div class="modal" id="foo"><div class="modal-dialog">' \
        '<div class="modal-content"></div></div></div>'
      assert_equal expected, modal.render {}
    end

    def test_dialog_renders_a_modal_dialog_with_a_modal_content
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal-dialog"><div class="modal-content">' \
        '</div></div>'
      assert_equal expected, modal.dialog {}
    end

    def test_content_renders_a_modal_content
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal-content"></div>'
      assert_equal expected, modal.content {}
    end

    def test_content_yields_modal_to_block
      modal = Modal.new @view_context, id: 'foo'
      yielded_modal = nil
      modal.content do |m|
        yielded_modal = m
      end
      assert_same modal, yielded_modal
    end

    def test_header_renders_a_modal_header_with_a_title_and_a_dismissal
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal-header">' \
        '<button class="close" data-dismiss="modal" type="button">&times;' \
        '</button><h4 class="modal-title">content</h4></div>'
      assert_equal expected, modal.header { 'content' }
    end

    def test_header_translates_html_dismissals
      icon = '<span class="glyphicon glyphicon-remove" aria-label="Dismiss"></span>'
      translations = {}
      I18n.backend = I18n::Backend::KeyValue.new translations
      I18n.backend.store_translations I18n.locale,
        { booties: { modal: { dismiss_html: icon } } }

      modal = Modal.new @view_context, id: 'foo'
      expected = %r{<button class="close" data-dismiss="modal" type="button">#{icon}</button>}
      assert_match expected, modal.header { 'content' }
    end

    def test_header_translates_non_html_dismissals
      translations = {}
      I18n.backend = I18n::Backend::KeyValue.new translations
      I18n.backend.store_translations I18n.locale,
        { booties: { modal: { dismiss: 'close' } } }

      modal = Modal.new @view_context, id: 'foo'
      expected = %r{<button class="close" data-dismiss="modal" type="button">close</button>}
      assert_match expected, modal.header { 'content' }
    end

    def test_body_renders_a_modal_body
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal-body">content</div>'
      assert_equal expected, modal.body { 'content' }
    end

    def test_footer_renders_a_modal_footer
      modal = Modal.new @view_context, id: 'foo'
      expected = '<div class="modal-footer">content</div>'
      assert_equal expected, modal.footer { 'content' }
    end

    def test_title_renders_a_modal_title
      modal = Modal.new @view_context, id: 'foo'
      expected = '<h4 class="modal-title">content</h4>'
      assert_equal expected, modal.title('content')
    end

    def test_title_accepts_content_as_a_block
      modal = Modal.new @view_context, id: 'foo'
      expected = '<h4 class="modal-title">content</h4>'
      assert_equal expected, modal.title { 'content' }
    end

    def test_dismiss_renders_a_dismiss_button
      modal = Modal.new @view_context, id: 'foo'
      expected = '<button class="close" data-dismiss="modal" type="button">' \
        'content</button>'
      assert_equal expected, modal.dismiss('content')
    end

    def test_dismiss_accepts_content_as_a_block
      modal = Modal.new @view_context, id: 'foo'
      expected = '<button class="close" data-dismiss="modal" type="button">' \
        'content</button>'
      assert_equal expected, modal.dismiss { 'content' }
    end

    def test_dismiss_accepts_custom_class
      modal = Modal.new @view_context, id: 'foo'
      expected = '<button class="btn btn-default" data-dismiss="modal"' \
       ' type="button">content</button>'
      assert_equal expected, modal.dismiss('content', class: 'btn btn-default')
    end

    def test_dismiss_accepts_custom_class_and_block
      modal = Modal.new @view_context, id: 'foo'
      expected = '<button class="btn btn-default" data-dismiss="modal"' \
       ' type="button">content</button>'
      assert_equal expected, modal.dismiss(class: 'btn btn-default') { 'content' }
    end
  end
end
