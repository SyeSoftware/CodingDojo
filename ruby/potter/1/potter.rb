class Potter
  def price(books)
    packages = extract_packages(books)
    packages.map(&:price).reduce(0, :+)
  end

  def extract_packages(books)
    Array.new.tap do |packages|
      until books.empty? do
        package1 = packages.last || []
        package2 = Package.new(books.uniq)
        package2.each { |b| books.slice!(books.index(b)) }
        improve_packages(package1, package2)
        packages.push(package2)
      end
    end
  end

  def improve_packages(pack1, pack2)
    if pack1.size == 5 && pack2.size == 3
      pack2.push(pack1.pop)
    end
  end
end
