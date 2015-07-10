class Potter  

  #Constants
  BPRICE = 8
  #Main invocation for returning the price
  def price(books)
    #Checks for an empty collection
      return 0 if books.empty?
      if books.uniq.size == 1
        BPRICE * books.count
      else
        count_collection(books)
      end

  end


  def count_collection(books)
    collection = books.clone.uniq.size
    sum = 0    
    case collection            
         when 2
           sum += BPRICE * collection * 0.95
         when 3
           sum += BPRICE * collection * 0.90
         when 4
           sum += BPRICE * collection * 0.80
         when 5
           sum += BPRICE * collection * 0.75
         end     
  end

end