# frozen_string_literal: true

module Booties
  module Utils # :nodoc:
    def merge_classes(*sets)
      return nil if sets.all?(&:nil?)

      sets.reduce([]) do |superset, subset|
        superset | Array(subset).compact.flat_map(&:split)
      end
    end

    module_function :merge_classes
  end
end
