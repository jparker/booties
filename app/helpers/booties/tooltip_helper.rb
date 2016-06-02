module Booties
  module TooltipHelper
    include Utils

    ##
    # Wraps the content provided by +block+ with a Bootstrap tooltip. The text
    # of the tooltip is passed in through the required +title+ parameter.
    #
    # The optional +placement+ parameter can be used to control alignment of
    # the tooltip. Valid placements are :top, :bottom, :left, and :right.
    #
    # The optional +wrapper_tag+ parameter can be used to specify an
    # alternative container tag for the tooltip. (The default is to use a span
    # tag.)
    #
    # Additional paramters given in +options+ are passed through to
    # #content_tag to be placed on the resulting tag.
    #
    # A caveat: Bootstrap tooltips are opt-in. You must initialize them
    # yourself. One way to do this is to include the following Javascript
    # snippet on the page:
    #
    #   $(function() {
    #     $('[data-toggle="tooltip"]').tooltip();
    #   }
    #
    # Examples:
    #
    #   <%= tooltip title: 'This is a tooltip' do %>
    #     This has a tooltip.
    #   <% end %>
    #   <span data-toggle="tooltip" title="This is a tooltip">This has a tooltip.</span>
    #
    #   <%= tooltip title: 'This is a tooltip', placement: :bottom %>
    #     This has a tooltip.
    #   <% end %>
    #   <span data-toggle="tooltip" data-placement="bottom" title="This is a tooltip">This has a tooltip.</span>
    #
    #   <%= tooltip title: 'This is a tooltip', class: 'tooltip' %>
    #     This has a tooltip.
    #   <% end %>
    #   <span data-toggle="tooltip" title="This is a tooltip" class="tooltip">This has a tooltip.</span>
    def tooltip(title:, placement: nil, wrapper_tag: :span, **options, &block)
      data = { toggle: 'tooltip', }

      if placement
        validate_placement! placement
        data[:placement] = placement
      end

      content_tag wrapper_tag, data: data, title: title, **options, &block
    end
  end
end
