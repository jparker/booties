module Booties
  module ApplicationHelper
    include Utils

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
  end
end
