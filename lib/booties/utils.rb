# frozen_string_literal: true

module Booties
  module Utils # :nodoc:
    PLACEMENTS = %i[left right top bottom].freeze

    def validate_placement!(position)
      unless PLACEMENTS.include?(position.to_sym)
        raise ArgumentError, "invalid placement: #{position.inspect}, " \
          'valid placements are :left, :right, :top, :bottom'
      end
      position
    end

    def merge_classes(*sets)
      return nil if sets.empty? || sets.all?(&:nil?)

      sets.reduce([]) do |superset, subset|
        superset | Array(subset).compact.flat_map(&:split)
      end
    end

    module_function :merge_classes
  end
end
