class Potter

  attr_reader :book_price, :discount

  def initialize
    @book_price = 8
    @total = 0
    @discount = {
      0 => 1,
      1 => 1,
      2 => 0.95,
      3 => 0.9,
      4 => 0.8,
      5 => 0.75
    }
  end

  def price(books)
    total = 0

    groups = sort_book_groups(books)
    discount_groups(groups).each do |key, value|
      total += book_price * value.count * discount[value.count]
    end
    total
  end

  def discount_groups(groups)
    books_hash = Hash.new(0)
    for i in 1..8 do
      books_hash[group_number(i)] = groups.collect(&:shift).compact
    end
    books_hash
  end

  def sort_book_groups(books)
    groups = []
    books.group_by{ |e| e }.each do |key, value|
      groups << value
    end
    groups
  end

  def group_number(key)
    "group_number_#{key}".to_sym
  end
end