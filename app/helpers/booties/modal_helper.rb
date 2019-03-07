# frozen_string_literal: true

module Booties
  module ModalHelper # :nodoc:
    ##
    # Renders a modal dialog. The CSS id is provided by +id+. The fade effect
    # will be enabled by default, but it will be disabled if +fade+ is falsey.
    #
    # The contents of the dialog are passed in as a block. An instance of
    # Booties::Modal will be yielded as a parameter to the block (similar to
    # the way a FormBuilder works in Rails).
    #
    # Example:
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

    def modal(id, fade: true, size: nil, with: Modal, **options, &block)
      with.new(self, id: id, fade: fade, size: size).render(**options, &block)
    end
  end
end
