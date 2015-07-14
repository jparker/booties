module Booties
  module ApplicationHelper
    ##
    # Renders an ol tag with the "breadcrumb" class and fills it with the
    # content of the block. The following:
    #
    #   <% breadcrumbs do %>
    #     <li>Foo</li>
    #     <li class="active">Bar</li>
    #   <% end %>
    #   <%= yield :breadcrumb %>
    #
    # will produce:
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
      classes   = %W[label label-#{context}]
      classes  |= Array(options.delete(:class)).flat_map(&:split)
      content_tag :span, content, class: classes, **options
    end

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
      classes   = ['badge']
      classes  |= Array(options.delete(:class)).flat_map(&:split)
      content_tag :span, content, class: classes, **options
    end

    ##
    # Renders a modal dialog. The CSS id is provided by +id+. The fade effect
    # will be enabled by default, but it will be disabled if +fade+ is falsey.
    #
    # The contents of the dialog are passed in as a block. An instance of
    # Booties::Modal will be yielded as a parameter to the block (similar to
    # the way a FormBuilder works in Rails).
    #
    #   <%= modal 'foo' do |m| %>
    #     <%= m.header do %>
    #       Nesciunt qui iste vel a.
    #     <% end %>
    #     <%= m.body do %>
    #       <p>
    #         Autem atque perferendis veritatis. Molestiae aliquid nam
    #         reiciendis recusandae facere. Aut non nemo dicta.
    #       </p>
    #     <% end %>
    #     <%= m.footer do %>
    #       <%= m.dismiss class: 'btn btn-default' do %>
    #         Dismiss
    #       <% end %>
    #       <%= link_to @widget, class: 'btn btn-danger', method: :delete do %>
    #         Really Delete
    #       <% end %>
    #     <% end %>
    #   <% end %>
    def modal(id, fade: true, with: Modal, &block)
      with.new(self, id: id, fade: fade).render &block
    end

    ##
    # Renders a panel. The defult panel context is +:default+ but can be
    # specified through +options+. The contents of the panel should be passed
    # in as a block. An instance of the Booties::Panel will be yielded as a
    # parameter to the block (similar to the way a FormBuilder works in Rails).
    #
    #   <%= panel do |p| %>
    #     <%= p.heading do %>
    #       <%= p.title 'Consequatur quibusdam quia vel et sed in.' %>
    #     <% end %>
    #     <%= p.body do %>
    #       <p>
    #         Est fuga iste reiciendis laudantium dicta. Perspiciatis vero ut
    #         autem quod vel modi. Ea error omnis aliquam aut est.
    #       </p>
    #     <% end %>
    #     <%= p.footer do %>
    #       Voluptatibus rerum et est quo dicta perspiciatis.
    #     <% end %>
    #   <% end %>
    def panel(with: Panel, **options, &block)
      with.new(self, **options).render &block
    end
  end
end
