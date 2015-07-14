require 'forwardable'

module Booties
  class Panel
    extend Forwardable

    ##
    # Instantiates a new Panel. Several helper methods like #content_tag will
    # be delegated to +view_context+. The optional +context+ argument can be
    # passed in to specify the panel context. +context+ defaults to +:default+.
    # Any additional options will be included as attributes on the top-level
    # panel div.
    def initialize(view_context, context: :default, **options)
      @view_context = view_context
      @context      = context
      @options      = options
    end

    def_delegators :@view_context, :capture, :content_tag

    ##
    # Renders the top-level div for the panel. +@context+ is used to specify
    # the panel's context. The content is captured from +block+. The Panel
    # object will be passed as a parameter to +block+.
    def render(&block)
      options = @options.dup
      classes = %W[panel panel-#@context] | Array(options.delete(:class)).flat_map(&:split)
      content_tag :div, class: classes, **options do
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
