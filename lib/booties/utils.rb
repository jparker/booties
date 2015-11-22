module Booties
  module Utils
    def merge_classes(a, b)
      Array(a).compact.flat_map(&:split) | Array(b).compact.flat_map(&:split)
    end

    module_function :merge_classes
  end
end
