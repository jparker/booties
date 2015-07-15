require 'booties/engine'
require 'booties/modal'
require 'booties/panel'

module Booties
  def self.merge_classes(a, b)
    Array(a).flat_map(&:split) | Array(b).flat_map(&:split)
  end
end
