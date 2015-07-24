require 'test_helper'

module Booties
  class TestUtils < Minitest::Test
    def test_merge_classes_removes_duplicates
      assert_equal %w[a b c], Utils.merge_classes(%w[a b], %w[b c])
    end

    def test_merge_classes_converts_string_arguments_to_arrays
      assert_equal %w[a b c], Utils.merge_classes('a b', 'b c')
    end

    def test_merge_classes_available_as_instance_method_when_utils_is_included
      cls = Class.new do
        include Utils
        public :merge_classes
      end

      assert_respond_to cls.new, :merge_classes
    end
  end
end
