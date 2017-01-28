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

    def merge_classes(a, b)
      return nil if a.nil? && b.nil?
      Array(a).compact.flat_map(&:split) | Array(b).compact.flat_map(&:split)
    end

    module_function :merge_classes
  end
end
