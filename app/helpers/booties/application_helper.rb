module Booties
  module ApplicationHelper
    ##
    # Renders an ol tag with the "breadcrumb" class and fills it with the
    # content of the block.
    #
    #   <% breadcrumbs do %>
    #     <li>Foo</li>
    #     <li class="active">Bar</li>
    #   <% end %>
    #   <%= yield :breadcrumb %>
    #
    # Produces:
    #
    #   <ol class="breadcrumb">
    #     <li>Foo</li>
    #     <li class="active">Bar</li>
    #   </ol>
    def breadcrumbs(&block)
      content_for :breadcrumbs, render_breadcrumbs(&block)
    end

    def render_breadcrumbs(&block) # :nodoc:
      content_tag :ol, class: 'breadcrumb', &block
    end

    ##
    # Renders a span tag with the "label" class and a contextual label class
    # derived from +context+. Defaults to "label-default". The content of the
    # tag is passed in as +content+.
    #
    #   <%= flag 'foo' %>
    #
    # Produces:
    #
    #   <span class="label label-default">foo</span>
    #
    # Alternatively, you can pass the content in as a block.
    #
    #   <%= flag do %>
    #     foo
    #   <% end %>
    #
    # Produces:
    #
    #   <span class="label label-default">foo</span>
    #
    # You can provide a different context for the label as +context+.
    #
    #   <%= flag 'foo', context: :primary %>
    #
    # Produces:
    #
    #   <span class="label label-primary">foo</span>
    #
    # Additional options passed in through +options+ will be passed to
    # #content_tag to added as attributes to the span tag.
    #
    #   <%= flag 'foo', id: 'bar' %>
    #
    # Produces:
    #
    #   <span class="label label-default" id="bar">foo</span>
    #
    # If +options+ includes a :class key, the contents will be merged with the
    # classes required by Bootstrap labels.
    #
    #   <%= flag 'foo', class: 'bar' %>
    #
    # Produces:
    #
    #   <span class="label label-default bar">foo</span>
    def flag(content = nil, context: :default, **options, &block)
      content ||= capture(&block)
      classes   = %W[label label-#{context}]
      classes  |= Array(options.delete(:class)).flat_map(&:split)
      content_tag :span, content, class: classes, **options
    end
  end
end
