module Booties
  module PopoverHelper
    include Utils

    ##
    # Generates a popover toggle. The text of the toggle is provided by +text+
    # or else it is captured from +block+.
    #
    # The required parameter +content+ provides the main body of text for the
    # popup. An optional title can be provided with the +title+ parameter. The
    # +placement+ parameter can be used to control the placement of the window;
    # valid placements are :left, :right, :top, and :bottom.
    #
    # The default behavior of the popover is to close when the user clicks the
    # toggle a second time. If the +trigger+ option is passed in with a truthy
    # value, the popover will instead close when the user clicks anywhere
    # outside the toggle.
    #
    # The default output tag is an anchor (<A>), but you can use the +tag+
    # parameter to use a different tag, e.g., :button to output a <BUTTON> tag.
    #
    # Any remaining options are passed through to #content_tag to be included
    # as is.
    #
    # A caveat: Bootstrap popovers are opt-in. You must initialize them
    # yourself. One way to do this is to include the following Javascript
    # snippet on the page:
    #
    #   $(function() {
    #     $('[data-toggle="popover"]').popover();
    #   }
    #
    # Examples:
    #
    #   <%= popover 'Link text', content: 'Lorem ipsum dolor sit amet.' %>
    #   <a role="button" data-toggle="popover" data-content="Lorem ipsum dolor sit amet.">Link text</a>
    #
    #   <%= popover tag: :button, content: 'Lorem ipsum dolor sit amet.', title: 'Lorem ipsum', placement: :top, trigger: 'focus', class: 'btn btn-default' do %>
    #     Link text
    #   <% end %>
    #   <button class="btn btn-default" type="button" data-toggle="popover" data-content="Lorem ipsum dolor sit amet." data-placement="top" data-container="body" data-trigger="focus" title="Lorem ipsum">Link text</button>
    def popover(text = nil, tag: :a, container: nil, content:, title: nil, placement: nil, trigger: nil, **options, &block)
      data = { toggle: 'popover', content: content, }

      data[:container] = container if container
      data[:placement] = validate_placement!(placement) if placement

      if trigger
        options[:tabindex] ||= 10
        data[:trigger] = 'focus'
      end

      options[tag == :button ? :type : :role] ||= 'button'
      options[:title] = title
      options[:data] ||= {}
      options[:data].update data

      content_tag tag, text, options, &block
    end
  end
end
