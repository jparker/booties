require 'test_helper'

class TestBooties < Minitest::Test
  def test_merge_classes_removes_duplicates
    assert_equal %w[a b c], Booties.merge_classes(%w[a b], %w[b c])
  end

  def test_merge_classes_converts_string_arguments_to_arrays
    assert_equal %w[a b c], Booties.merge_classes('a b', 'b c')
  end
end
