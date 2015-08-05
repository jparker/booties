module Booties
  module FlagHelper
    include Utils

    ##
    # Renders a span tag with the "label" class and a contextual label class
    # derived from +context+. Defaults to "label-default". The content of the
    # tag is passed in as +content+. The following:
    #
    #   <%= flag 'foo' %>
    #
    # will produce:
    #
    #   <span class="label label-default">foo</span>
    #
    # Alternatively, you can pass the content in as a block. The following:
    #
    #   <%= flag do %>
    #     foo
    #   <% end %>
    #
    # will produce:
    #
    #   <span class="label label-default">foo</span>
    #
    # You can provide a different context for the label as +context+. The
    # following:
    #
    #   <%= flag 'foo', context: :primary %>
    #
    # will produce:
    #
    #   <span class="label label-primary">foo</span>
    #
    # Additional options passed in through +options+ will be passed to
    # #content_tag to be added as attributes to the span tag. The following:
    #
    #   <%= flag 'foo', id: 'bar' %>
    #
    # will produce:
    #
    #   <span class="label label-default" id="bar">foo</span>
    #
    # If the +:class+ option is passed in the contents will be merged with the
    # classes required by Bootstrap labels. The following:
    #
    #   <%= flag 'foo', class: 'bar' %>
    #
    # will produce:
    #
    #   <span class="label label-default bar">foo</span>
    def flag(content = nil, context: :default, **options, &block)
      content ||= capture &block
      classes = merge_classes %W[label label-#{context}],
        options.delete(:class)
      content_tag :span, content, class: classes, **options
    end
  end
end
