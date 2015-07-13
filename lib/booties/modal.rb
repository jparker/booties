require 'forwardable'

module Booties
  class Modal
    extend Forwardable

    def initialize(view_context, id:, fade: true)
      @view_context = view_context
      @id           = id
      @fade         = fade ? 'fade' : nil
    end

    def_delegators :@view_context, :button_tag, :capture, :content_tag,
      :raw, :t, :translate

    def render(&block)
      content_tag :div, class: ['modal', @fade], id: @id do
        dialog &block
      end
    end

    def dialog(&block)
      content_tag :div, class: 'modal-dialog' do
        content &block
      end
    end

    def content(&block)
      content_tag :div, class: 'modal-content' do
        capture self, &block
      end
    end

    # TODO: lookup header dismissal content in locale booties.button.close_html
    def header(&block)
      dismissal = t :'booties.modal.dismiss_html',
        default: [:'booties.modal.dismiss', raw('&times;')]
      content_tag :div, class: 'modal-header' do
        dismiss(dismissal) << title(&block)
      end
    end

    def body(&block)
      content_tag :div, capture(&block), class: 'modal-body'
    end

    def footer(&block)
      content_tag :div, capture(&block), class: 'modal-footer'
    end

    def title(content = nil, &block)
      content ||= capture &block
      content_tag :h4, content, class: 'modal-title'
    end

    def dismiss(content = nil, **options, &block)
      content ||= capture &block
      options[:class] ||= 'close'
      options.update data: { dismiss: 'modal' }, type: 'button'
      button_tag content, options
    end
  end
end
