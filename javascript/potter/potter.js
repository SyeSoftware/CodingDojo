require('sugar');

module.exports Potter = function() {
  this.price = function(books) {
    var store = {};

    // Returns not discounted price.
    if (books.unique().length <= 1)
      return books.length * 8;

    // Grouping books by serie.
    books.forEach(function(book) {
      store[book] = (store[book] || 0) + 1;
    });
  }
}
