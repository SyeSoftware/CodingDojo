class Package < Array
  RULES = {
    0 => 0,
    1 => 1,
    2 => 0.95,
    3 => 0.90,
    4 => 0.80,
    5 => 0.75
  }

  def price
    RULES[size] * 8 * size
  end
end
