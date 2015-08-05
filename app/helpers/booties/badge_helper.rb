module Booties
  module BadgeHelper
    include Utils

    ##
    # Renders a span tag with the "badge" class. The content of the tag is
    # passed in as +content+. The following:
    #
    #   <%= badge 'foo' %>
    #
    # will produce:
    #
    #   <span class="badge">foo</span>
    #
    # Alternatively, you can pass the content in as a block. The following:
    #
    #   <%= badge do %> foo <% end %>
    #
    # will produce:
    #
    #   <span class="badge">foo</span>
    #
    # Any options passed in through +options+ will be passed to #content_tag to
    # be added as attributes to the span tag. The following:
    #
    #   <%= badge 'foo', id: 'bar' %>
    #
    # will produce:
    #
    #   <span class="badge" id="bar">foo</span>
    #
    # If the +:class+ option is passed in, the contents will be merged with the
    # classes required by Bootstrap badges. The following:
    #
    #   <%= badge 'foo', class: 'bar' %>
    #
    # will produce:
    #
    #   <span class="badge bar">foo</span>
    def badge(content = nil, **options, &block)
      content ||= capture &block
      classes = merge_classes ['badge'], options.delete(:class)
      content_tag :span, content, class: classes, **options
    end
  end
end
