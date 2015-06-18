var assert = require('assert');
var Potter = require('./potter');

describe('Potter', function() {
  var potter = new Potter();

  describe('#price()', function() {
    it('returns correct price', function(){
      assert.equal(0, potter.price([]));
      assert.equal(8, potter.price([0]));
      assert.equal(8, potter.price([1]));
      assert.equal(8, potter.price([2]));
      assert.equal(8, potter.price([3]));
      assert.equal(8, potter.price([4]));
      assert.equal(8 * 2, potter.price([0, 0]));
      assert.equal(8 * 3, potter.price([1, 1, 1]));
      assert.equal(8 * 2 * 0.95, potter.price([0, 1]));
    })
  })
})
