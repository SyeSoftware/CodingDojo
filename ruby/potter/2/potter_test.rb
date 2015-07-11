require 'minitest/autorun'
require './potter'

class PotterTest < Minitest::Test

  def setup
    @potter = Potter.new
  end

  def test_basics
    assert_equal(0, @potter.price([]))
    assert_equal(8, @potter.price([0]))
    assert_equal(8, @potter.price([1]))
    assert_equal(8, @potter.price([2]))
    assert_equal(8 * 2, @potter.price([0, 0]))
    assert_equal(8 * 3, @potter.price([1, 1, 1]))
  end

  def test_simple_discounts
    assert_equal(8 * 2 * 0.95, @potter.price([0, 1]))
    assert_equal(8 * 3 * 0.9, @potter.price([0, 2, 4]))
    assert_equal(8 * 4 * 0.8, @potter.price([0, 1, 2, 4]))
    assert_equal(8 * 5 * 0.75, @potter.price([0, 1, 2, 3, 4]))
  end

  def test_several_discounts
    assert_equal(8 + (8 * 2 * 0.95), @potter.price([0, 0, 1]))
    assert_equal(2 * (8 * 2 * 0.95), @potter.price([0, 0, 1, 1]))
    assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), @potter.price([0, 0, 1, 2, 2, 3]))
    assert_equal(8 + (8 * 5 * 0.75), @potter.price([0, 1, 1, 2, 3, 4]))
  end

  def test_edge_cases
    assert_equal(2 * (8 * 4 * 0.8), @potter.price([0, 0, 1, 1, 2, 2, 3, 4]))
    assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
      @potter.price([0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]))
  end
end