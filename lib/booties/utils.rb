module Booties
  module Utils
    def merge_classes(a, b)
      Array(a).flat_map(&:split) | Array(b).flat_map(&:split)
    end

    module_function :merge_classes
  end
end
