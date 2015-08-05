module Booties
  module PanelHelper
    ##
    # Renders a panel. The defult panel context is +:default+ but can be
    # specified through +options+. The contents of the panel should be passed
    # in as a block. An instance of the Booties::Panel will be yielded as a
    # parameter to the block (similar to the way a FormBuilder works in Rails).
    #
    # Example:
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
