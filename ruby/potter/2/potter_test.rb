require 'minitest/autorun'

class PotterTest < Minitest::Test

  def test_price
    assert_equal(0, price([]))
  end
end