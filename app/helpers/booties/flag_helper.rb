# frozen_string_literal: true

module Booties
  module FlagHelper # :nodoc:
    include Utils

    ##
    # Renders a Bootstrap label. The label text may be passed in through
    # +content+ or as a block. The +context+ keyword may be used to specify the
    # label context; the default context is +:default+. Additional HTML
    # attributes may be passed in through the +options+ hash.
    #
    # Examples:
    #
    #   <%= flag 'foo' %>
    #   <span class="label label-default">foo</span>
    #
    #   <%= flag do %>
    #     foo
    #   <% end %>
    #   <span class="label label-default">foo</span>
    #
    #   <%= flag 'foo', context: :primary %>
    #   <span class="label label-primary">foo</span>
    #
    #   <%= flag 'foo', id: 'bar' %>
    #   <span class="label label-default" id="bar">foo</span>
    #
    #   <%= flag 'foo', class: 'bar' %>
    #   <span class="label label-default bar">foo</span>
    def flag(content = nil, context: :default, class: nil, **options, &block)
      classes = merge_classes %W[label label-#{context}],
                              binding.local_variable_get(:class)
      options = { class: classes, **options }

      content_tag :span, content, options, &block
    end
  end
end
