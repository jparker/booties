# frozen_string_literal: true

require 'test_helper'

module Booties
  class TestUtils < Minitest::Test
    def test_merge_classes_with_arrays
      assert_equal %w[a b c], Utils.merge_classes(%w[a b], %w[b c])
    end

    def test_merge_classes_with_strings
      assert_equal %w[a b c], Utils.merge_classes('a b ', ' b c')
    end

    def test_merge_classes_with_arrays_and_strings
      assert_equal %w[a b c], Utils.merge_classes(%w[a b], 'b c')
    end

    def test_merge_classes_with_one_nil_argument
      assert_equal %w[a b], Utils.merge_classes('a b', nil)
      assert_equal %w[a b], Utils.merge_classes(nil, 'a b')
    end

    def test_merge_classes_with_nil_arguments
      assert_nil Utils.merge_classes(nil, nil)
    end

    def test_merge_more_than_two_class_sets
      assert_equal %w[a b c d], Utils.merge_classes('a b', 'b c', 'c d')
    end

    def test_merge_classes_is_module_function
      cls = Class.new do
        include Utils
        public :merge_classes
      end

      assert_respond_to cls.new, :merge_classes
    end
  end
end
