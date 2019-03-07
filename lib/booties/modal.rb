# frozen_string_literal: true

require 'forwardable'

module Booties
  class Modal # :nodoc:
    include Utils
    extend Forwardable

    DEFAULT_DISMISSAL = '&times;'.html_safe
    MODAL_SIZE        = { small: 'modal-sm', large: 'modal-lg' }.freeze

    ##
    # Instantiates a new Modal. Several helper methods like #content_tag will
    # be delegated to +view_context+. The required keyword +id+ will be used as
    # the DOM ID of the modal element. By default, the modal will exhibit
    # fading behavior, but this can be disabled by setting +fade+ to a falsey
    # value.
    def initialize(view_context, id:, fade: true, size: nil)
      @view_context = view_context
      @id           = id
      @fade         = fade ? 'fade' : nil
      @size         = MODAL_SIZE[size]
    end

    def_delegators :@view_context, :button_tag, :capture, :content_tag,
                   :raw, :t, :translate

    ##
    # Renders the top-level div for the modal dialog. +block+ is passed to
    # #dialog to fill in the content of the modal. +@id+ is used as the DOM ID
    # of the modal. +@fade+ is used to include or exclude fading behavior.
    def render(**options, &block)
      classes = merge_classes ['modal', @fade], options.delete(:class)
      content_tag :div, class: classes, id: @id, **options do
        dialog(&block)
      end
    end

    ##
    # Renders the dialog section of the modal. +block+ is passed to #content to
    # fill in the content of the dialog.
    def dialog(&block)
      content_tag :div, class: ['modal-dialog', @size] do
        content(&block)
      end
    end

    ##
    # Renders the content section of the modal. The content of the dialog is
    # captured from +block+. The Modal object will be passed as a paramter to
    # +block+.
    def content(&block)
      content_tag :div, class: 'modal-content' do
        capture self, &block
      end
    end

    ##
    # Renders the header section of a modal.
    #
    # +block+ will be passed to #title to generate the title portion included
    # within the header.
    #
    # If +close+ is truthy, a dismissal button will be rendered within the
    # header as well. The default is +true+. The default dismissal is a
    # +&times;+ symbol, but this can be customized by adding a translation for
    # +booties.modal.dismiss_html+ or +booties.modal.dismiss+.

    # TODO: rename +close+ option to +dismissible+?
    def header(close: true, &block)
      content_tag :div, class: 'modal-header' do
        if close
          dismissal = t :'booties.modal.dismiss_html',
                        default: [:'booties.modal.dismiss', DEFAULT_DISMISSAL]
          dismiss(dismissal) + title(&block)
        else
          title(&block)
        end
      end
    end

    ##
    # Renders the main body of the modal. The content of the section is
    # captured from +block+.
    def body(&block)
      content_tag :div, capture(&block), class: 'modal-body'
    end

    ##
    # Renders the footer of the modal. The content of the section is captured
    # from +block+.
    def footer(&block)
      content_tag :div, capture(&block), class: 'modal-footer'
    end

    ##
    # Renders the title of the modal. The content can be passed through the
    # +content+ parameter. Otherwise it will be captured from +block+.
    #
    # #title is called automatically from #header.
    def title(content = nil, &block)
      content ||= capture(&block)
      content_tag :h4, content, class: 'modal-title'
    end

    ##
    # Renders a button for dismissing the modal. The label can be passed in
    # through the +content+ parameter. Otherwise, it will be captured from
    # +block+. Additional HTML attributes for the button can be passed in
    # through +options+.
    def dismiss(content = nil, **options, &block)
      content ||= capture(&block)
      options[:class] ||= 'close'
      options.update data: { dismiss: 'modal' }, type: 'button'
      button_tag content, options
    end
  end
end
