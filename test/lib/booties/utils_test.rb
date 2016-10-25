require 'test_helper'

module Booties
  class TestUtils < Minitest::Test
    def test_merge_classes_with_arrays
      actual = Utils.merge_classes ['a', 'b'], ['b', 'c']
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_strings
      actual = Utils.merge_classes 'a b', 'b c'
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_arrays_and_strings
      actual = Utils.merge_classes ['a', 'b'], 'b c'
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_one_nil_argument
      actual = Utils.merge_classes 'a b', nil
      assert_equal ['a', 'b'], actual

      actual = Utils.merge_classes nil, 'a b'
      assert_equal ['a', 'b'], actual
    end

    def test_merge_classes_with_two_nil_arguments
      actual = Utils.merge_classes nil, nil
      assert_nil actual
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
