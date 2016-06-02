module Booties
  module Utils
    PLACEMENTS = [:left, :right, :top, :bottom, ]

    def validate_placement!(position)
      PLACEMENTS.include? position or raise ArgumentError,
        "invalid placement: #{position.inspect}, " \
        'valid placements are :left, :right, :top, :bottom'
    end

    def merge_classes(a, b)
      Array(a).compact.flat_map(&:split) | Array(b).compact.flat_map(&:split)
    end

    module_function :merge_classes
  end
end
