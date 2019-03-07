module Booties
  module Utils
    PLACEMENTS = [:left, :right, :top, :bottom, ]

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
