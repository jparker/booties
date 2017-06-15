module Booties
  module DropdownHelper
    include Utils

    ##
    # Renders a link to toggle a dropdown menu.
    #
    # Examples:
    #
    #   <%= link_to_dropdown do %>
    #     Foo
    #   <% end %>
    #
    #   <%= link_to_dropdown class: 'foo' do %>
    #     Foo
    #   <% end %>
    def link_to_dropdown(class: nil, &block)
      classes = merge_classes binding.local_variable_get(:class),
        'dropdown-toggle'
      text = capture(&block) + caret
      link_to text, '#', class: classes, data: { toggle: 'dropdown' },
        role: 'button'
    end

    ##
    # Renders a button to toggle a dropdown menu.
    #
    # Examples:
    #
    #   <%= button_to_dropdown do %>
    #     Foo
    #   <% end %>
    #
    #   <%= button_to_dropdown context: :primary, class: 'btn-xs' do %>
    #     Foo
    #   <% end %>
    def button_to_dropdown(context: :default, class: nil, &block)
      classes = merge_classes binding.local_variable_get(:class),
        %W[btn btn-#{context} dropdown-toggle]
      text = capture(&block) + caret
      button_tag text, name: nil, class: classes,
        data: { toggle: 'dropdown' }, type: 'button'
    end

    ##
    # Wraps a block in a dropdown menu list.
    #
    # Examples:
    #
    #   <%= dropdown_menu do %>
    #     <li><%= link_to 'Foo', foos_path %></li>
    #     <li><%= link_to 'Bar', bars_path %></li>
    #   <% end %>
    def dropdown_menu(&block)
      content_tag :ul, class: 'dropdown-menu', &block
    end

    ##
    # Renders caret for dropdown menu.
    def caret
      content_tag :span, '', class: 'caret'
    end
  end
end
