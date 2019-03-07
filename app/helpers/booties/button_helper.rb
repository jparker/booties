# frozen_string_literal: true

module Booties
  module ButtonHelper # :nodoc:
    include Utils

    ##
    # Renders a link as a Bootstrap button. The default behavior is to add the
    # .btn and btn-default classes to the rendered tag. The button context can
    # be overridden to something other than .btn-default such as .btn-primary
    # using the +context+ parameter. The +name+, +options+, +html_options+, and
    # +block+ paramters are passed through to #link_to.
    #
    # If +html_options+ includes a +:class+ option, the classes will be merged
    # with the required .btn classes.
    #
    # Examples:
    #
    #   <%= btn_link_to 'View', thingies_path %>
    #
    #   <a href="/thingies" class="btn btn-default">View</a>
    #
    #   <%= btn_link_to 'Sign out', destroy_user_session_path, context: :danger, class: 'btn-xs', method: :delete %>
    #
    #   <a href="/users/sign_out" class="btn btn-danger btn-xs" data-method="delete">Sign out</a>
    def btn_link_to(name_or_path, path = nil, context: :default, **opts, &block)
      opts[:class] = merge_classes %W[btn btn-#{context}], opts[:class]
      if block_given?
        link_to name_or_path, opts, &block
      else
        link_to name_or_path, path, opts
      end
    end
  end
end
