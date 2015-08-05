module Booties
  module BadgeHelper
    include Utils

    ##
    # Renders a Bootstrap badge. The text inside the badge may passed in
    # through +content+ or with a block. Additional HTML attributes may be
    # passed in through the +options+ hash.
    #
    # Examples:
    #
    #   <%= badge 'foo' %>
    #   <span class="badge">foo</span>
    #
    #   <%= badge do %>
    #     foo
    #   <% end %>
    #   <span class="badge">foo</span>
    #
    #   <%= badge 'foo', id: 'bar' %>
    #   <span class="badge" id="bar">foo</span>
    #
    #   <%= badge 'foo', class: 'bar' %>
    #   <span class="badge bar">foo</span>
    def badge(content = nil, **options, &block)
      content ||= capture &block
      classes = merge_classes ['badge'], options.delete(:class)
      content_tag :span, content, class: classes, **options
    end
  end
end
