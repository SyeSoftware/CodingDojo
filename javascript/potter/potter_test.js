var assert = require('assert');
var Potter = require('./potter');

describe('Potter', function() {
  var potter = new Potter();

  describe('#price()', function() {
    it('returns correct price', function(){
      // Basics.
      assert.equal(0, potter.price([]));
      assert.equal(8, potter.price([0]));
      assert.equal(8, potter.price([1]));
      assert.equal(8, potter.price([2]));
      assert.equal(8, potter.price([3]));
      assert.equal(8, potter.price([4]));
      assert.equal(8 * 2, potter.price([0, 0]));
      assert.equal(8 * 3, potter.price([1, 1, 1]));

      // Simple discounts.
      assert.equal(8 * 2 * 0.95, potter.price([0, 1]));
      assert.equal(8 * 3 * 0.90, potter.price([0, 2, 4]));
      assert.equal(8 * 4 * 0.80, potter.price([0, 1, 2, 4]));
      assert.equal(8 * 5 * 0.75, potter.price([0, 1, 2, 3, 4]));

      // Several discounts.
      assert.equal(8 + (8 * 2 * 0.95), potter.price([0, 0, 1]));
      assert.equal(2 * (8 * 2 * 0.95), potter.price([0, 0, 1, 1]));
      assert.equal((8 * 4 * 0.80) + (8 * 2 * 0.95), potter.price([0, 0, 1, 2, 2, 3]));
      assert.equal(8 + (8 * 5 * 0.75), potter.price([0, 1, 1, 2, 3, 4]));

      // Edge cases.
      assert.equal(2 * (8 * 4 * 0.80), potter.price([0, 0, 1, 1, 2, 2, 3, 4]));
      assert.equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.80), potter.price(
        [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]
      ));
    })
  })
})
