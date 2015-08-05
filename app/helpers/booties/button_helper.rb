module Booties
  module ButtonHelper
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
    def btn_link_to(name = nil, options = nil, html_options = nil, &block)
      name, options, html_options = capture(&block), name, options if block_given?
      html_options ||= {}
      context = html_options.delete(:context) { :default }
      html_options[:class] = \
        merge_classes %W[btn btn-#{context}], html_options[:class]
      link_to name, options, html_options
    end
  end
end
