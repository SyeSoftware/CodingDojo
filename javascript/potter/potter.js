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
    var packages = [];
    packages = buildPackages(books);
    packages = improvePackages(packages)

    // Gettings price for packages.
    return packages.sum(function(package) {
      return rules[package.length] * (8 * package.length);
    });
  }


  // This method builds the first packages version.
  // ==============================================
  var buildPackages = function(books) {
    var packages = [];
    var books = books.clone()
    var package;

    for (var i = 0; books.length; i++) {
      package = books.unique();
      packages.push(package);
      package.each(function(book) {
        books.splice(books.indexOf(book), 1);
      });
    }

    return packages;
  }


  // This method improves packages to get the lowest price.
  // ======================================================
  var improvePackages = function(packages) {
    packages.each(function(package, index) {
      improvePairPackages([package, packages[index + 1]]);
    });
  }


  // This method adjusts a pair of packages to get the lowest
  // price combination.
  // ======================================================
  var improvePairPackages = function(packages) {
    var currentDiscount = packagesDiscount(packages);
  }


  // Returns total packages discount.
  var packagesDiscount = function(packages) {
    return packages.sum(function(package) {
      return 1 - rules[package.length];
    });
  }
}
