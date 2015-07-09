class Potter
  
  attr_accessor :books
  #Constants
    BOOK_PRICE = 8
    PERC_1 = 0.95
    PERC_2 = 0.90
    PERC_3 = 0.80
    PERC_4 = 0.75
  
  def initialize(books)
    @price = 0
    @books = books || []    
  end

#Determines when the book collection should be submitted to a discount
  def price
    return 0 if books.empty?
    if books.length == 1      
      return books.size * BOOK_PRICE
    else
    #Dirty little trick that calculates when the edge cases occurs
      begin
        repeated_books = []
        books.delete_if do |i|
          unless repeated_books.include? i
            repeated_books.push i
          end
        end
        if books.length == 3 && repeated_books.length == 5
          books.push(5)
          repeated_books.pop
        end
        total_disscount(repeated_books.uniq.size)
      end while books.any?
    end
    @price
  end

  #Main disscount of calculations for the givven cart.
  def total_disscount(books)
    @price += BOOK_PRICE * books * available_disscounts(books)
  end

  # Return 1 if the size of the array
  def available_disscounts(books)
    case books
      when 1
        return 1
      when 2
        PERC_1
      when 3
        PERC_2
      when 4
        PERC_3
      when 5
        PERC_4
      end         
  end
end