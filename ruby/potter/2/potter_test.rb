require 'minitest/autorun'
require './potter'

class PotterTest < Minitest::Test

  def setup
    @potter = Potter.new
  end

  def test_price
    assert_equal(0, @potter.price([]))
    assert_equal(8, @potter.price([0]))
    assert_equal(8, @potter.price([1]))
    assert_equal(8, @potter.price([2]))
    assert_equal(8 * 2, @potter.price([0, 0]))
  end
end