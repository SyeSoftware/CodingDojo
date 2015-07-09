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
    end
         
  end
end