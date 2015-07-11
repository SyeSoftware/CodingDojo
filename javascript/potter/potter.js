require('sugar');

module.exports = function() {
  var rules = {
    1: 1,
    2: 0.95,
    3: 0.90,
    4: 0.80,
    5: 0.75
  };

  this.price = function(books) {
    var store = {};
    var packages = [];

    // Grouping books by serie.
    books.forEach(function(book) {
      store[book] = (store[book] || 0) + 1;
    });

    // Getting possible packages.
    Object.keys(store).forEach(function(book) {
      for (var i = 0; i < store[book]; i++) {
        packages[i] = packages[i] || [];
        packages[i].push(book);
      }
    });

    // Improving packages (hardcoded).
    packages.each(function(package1) {
      packages.each(function(package2) {
        if (package1.length == 5 && package2.length == 3) {
          var element = package1.subtract(package2)[0];
          package1.splice(package1.indexOf(element), 1);
          package2.splice(0, 0, element);
        }
      });
    });

    // Gettings packages price.
    return packages.sum(function(package) {
      return rules[package.length] * (8 * package.length);
    });
  }
}
