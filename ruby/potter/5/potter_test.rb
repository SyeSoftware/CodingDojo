require "minitest/autorun"
require './potter'

class Test_Potter < Minitest::Test

  def test_price_basic
    assert_equal(0, Potter.new([]).price)
    assert_equal(8, Potter.new([0]).price)
    assert_equal(8, Potter.new([1]).price)
    assert_equal(8, Potter.new([2]).price)
    assert_equal(8, Potter.new([3]).price)
    assert_equal(8, Potter.new([4]).price)
    assert_equal(8 * 2 , Potter.new([0, 0]).price)
    assert_equal(8 * 3, Potter.new([1, 1, 1]).price)
  end

  def test_simple_discounts
    assert_equal(8 * 2 * 0.95, Potter.new([0, 1]).price)
    assert_equal(8 * 3 * 0.9, Potter.new([0, 2, 4]).price)
    assert_equal(8 * 4 * 0.8, Potter.new([0, 1, 2, 4]).price)
    assert_equal(8 * 5 * 0.75, Potter.new([0, 1, 2, 3, 4]).price)
  end

  def test_several_discounts
    #assert_equal(8 + (8 * 2 * 0.95), Potter.new([0, 0, 1]).price)
    #assert_equal(2 * (8 * 2 * 0.95), Potter.new([0, 0, 1, 1]).price)
    #assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), Potter.new([0, 0, 1, 2, 2, 3]).price)
    #assert_equal(8 + (8 * 5 * 0.75), Potter.new([0, 1, 1, 2, 3, 4]).price)
  end

  def test_edgeCases
    #assert_equal(2 * (8 * 4 * 0.8), Potter.new([0, 0, 1, 1, 2, 2, 3, 4]).price)
    #assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
    #Potter.new([0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]).price)
  end

end