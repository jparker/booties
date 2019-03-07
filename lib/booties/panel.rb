# frozen_string_literal: true

require 'forwardable'

module Booties
  class Panel # :nodoc:
    include Utils
    extend Forwardable

    CSS_CLASSES = {
      heading: 'panel-heading',
      title: 'panel-title',
      body: 'panel-body',
      footer: 'panel-footer',
    }.freeze

    ##
    # Instantiates a new Panel. Several helper methods like #content_tag will
    # be delegated to +template+.
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
    def initialize(template, context: :default, wrapper_tag: 'div', **options)
      @template    = template
      @wrapper_tag = wrapper_tag
      @context     = context
      # TODO: pass options to #render instead of constructor
      @options     = options
    end

    def_delegators :@template, :capture, :content_tag

    ##
    # Renders the top-level div for the panel. +@context+ is used to specify
    # the panel's context. The content is captured from +block+. The Panel
    # object will be passed as a parameter to +block+.
    def render(&block)
      options = @options.dup
      classes = merge_classes %W[panel panel-#{@context}],
                              options.delete(:class)
      content_tag @wrapper_tag, class: classes, **options do
        capture self, &block
      end
    end

    ##
    # Renders the panel heading. The content of the heading can be passed in
    # through the +content+ parameter or as a block. If +class+ is given, it
    # will be merged with the required panel heading class. Additional keyword
    # arguments will be passed as an options Hash to #content_tag.
    def heading(content = nil, class: nil, **options, &block)
      content ||= capture(&block)
      classes   = merge_classes CSS_CLASSES[:heading],
                                binding.local_variable_get(:class)
      content_tag :div, content, class: classes, **options
    end

    ##
    # Renders the panel title. The content of the title can be passed in
    # through the +content+ paramter or as a block. If +class+ is given, it
    # will be merged with the required panel title class. Additional keyword
    # arguments will be passed as an options Hash to #content_tag.
    def title(content = nil, class: nil, **options, &block)
      content ||= capture(&block)
      classes   = merge_classes CSS_CLASSES[:title],
                                binding.local_variable_get(:class)
      content_tag :h3, content, class: classes, **options
    end

    ##
    # Renders the panel body. The content of the body can be passed in through
    # the +content+ parameter or as a block. If +class+ is given, it will be
    # merged with the required panel body class. Additional keyword arguments
    # will be passed as an options Hash to #content_tag.
    def body(content = nil, class: nil, **options, &block)
      content ||= capture(&block)
      classes   = merge_classes CSS_CLASSES[:body],
                                binding.local_variable_get(:class)
      content_tag :div, content, class: classes, **options
    end

    ##
    # Renders the panel footer. The content of the footer can be passed in
    # through the +content+ parameter or as a block. If +class+ is given, it
    # will be merged with the required panel footer class. Additional keyword
    # arguments will be passed as an options Hash to #content_tag.
    def footer(content = nil, class: nil, **options, &block)
      content ||= capture(&block)
      classes   = merge_classes CSS_CLASSES[:footer],
                                binding.local_variable_get(:class)
      content_tag :div, content, class: classes, **options
    end
  end
end
