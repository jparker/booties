require 'forwardable'

module Booties
  class Panel
    include Utils
    extend Forwardable

    ##
    # Instantiates a new Panel. Several helper methods like #content_tag will
    # be delegated to +view_context+.
    #
    # The optional +context+ argument can be passed in to specify the panel
    # context; otherwise, the context +:default+ is used.
    #
    # The default behavior is to use a +div+ tag for to top-level panel
    # container, but you may specify a different tag using the +wrapper_tag+
    # keyword. (There are no guarantees on whether or not other tags will work
    # correctly with Bootstrap panels.
    #
    # Any additional options will be included as attributes on the top-level
    # panel container.
    def initialize(view_context, context: :default, wrapper_tag: 'div', **options)
      @view_context = view_context
      @wrapper_tag  = wrapper_tag
      @context      = context
      # TODO: pass options to #render instead of constructor
      @options      = options
    end

    def_delegators :@view_context, :capture, :content_tag

    ##
    # Renders the top-level div for the panel. +@context+ is used to specify
    # the panel's context. The content is captured from +block+. The Panel
    # object will be passed as a parameter to +block+.
    def render(&block)
      options = @options.dup
      classes = merge_classes %W[panel panel-#@context], options.delete(:class)
      content_tag @wrapper_tag, class: classes, **options do
        capture self, &block
      end
    end

    ##
    # Renders the panel heading. The content of the heading can be passed in
    # through the +content+ parameter or as a block.
    def heading(content = nil, &block)
      content ||= capture &block
      content_tag :div, content, class: 'panel-heading'
    end

    ##
    # Renders the panel title. The content of the title can be passed in
    # through the +content+ paramter or as a block.
    def title(content = nil, &block)
      content ||= capture &block
      content_tag :h3, content, class: 'panel-title'
    end

    ##
    # Renders the panel body. The content of the body can be passed in through
    # the +content+ parameter or as a block.
    def body(content = nil, &block)
      content ||= capture &block
      content_tag :div, content, class: 'panel-body'
    end

    ##
    # Renders the panel footer. The content of the footer can be passed in
    # through the +content+ parameter or as a block.
    def footer(content = nil, &block)
      content ||= capture &block
      content_tag :div, content, class: 'panel-footer'
    end
  end
end
