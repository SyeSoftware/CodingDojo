require 'minitest/autorun'
require './potter'

class PotterTest < Minitest::Test

  def setup
    @potter = Potter.new
  end

  def test_price
    assert_equal(0, @potter.price([]))
  end
end