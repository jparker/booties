# frozen_string_literal: true

require_relative 'badge_helper'
require_relative 'breadcrumb_helper'
require_relative 'button_helper'
require_relative 'dropdown_helper'
require_relative 'flag_helper'
require_relative 'modal_helper'
require_relative 'panel_helper'
require_relative 'popover_helper'
require_relative 'tooltip_helper'

module Booties
  module ApplicationHelper # :nodoc:
    include BadgeHelper
    include BreadcrumbHelper
    include ButtonHelper
    include DropdownHelper
    include FlagHelper
    include ModalHelper
    include PanelHelper
    include PopoverHelper
    include TooltipHelper
  end
end
