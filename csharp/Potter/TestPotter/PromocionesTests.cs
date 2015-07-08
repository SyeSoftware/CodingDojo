using System;
using Microsoft.VisualStudio.TestTools.UnitTesting; 
using System.Collections;
using PotterPromociones;

namespace TestPotter
{
    [TestClass]
    public class PromocionesTests
    {
        Promociones potter = new Promociones();

        [TestMethod]
        public void TestBasics()
        {
            Assert.AreEqual(0, potter.Price(new ArrayList { }));
            Assert.AreEqual(8, potter.Price(new ArrayList { 5 }));
            Assert.AreEqual(8, potter.Price(new ArrayList { 1 }));
            Assert.AreEqual(8, potter.Price(new ArrayList { 2 }));
            Assert.AreEqual(8, potter.Price(new ArrayList { 3 }));
            Assert.AreEqual(8, potter.Price(new ArrayList { 4 }));
            Assert.AreEqual(8 * 2, potter.Price(new ArrayList { 0, 0 }));
            Assert.AreEqual(8 * 3, potter.Price(new ArrayList { 1, 1, 1 }));
        }

        [TestMethod]
        public void testSimpleDiscounts()
        {
            Assert.AreEqual(8 * 2 * 0.95, potter.Price(new ArrayList { 0, 1 }));
            Assert.AreEqual(8 * 3 * 0.9, potter.Price(new ArrayList { 0, 2, 4 }));
            Assert.AreEqual(8 * 4 * 0.8, potter.Price(new ArrayList { 0, 1, 2, 4 }));
            Assert.AreEqual(8 * 5 * 0.75, potter.Price(new ArrayList { 0, 1, 2, 3, 4 }));
        }


        [TestMethod]
        public void testSeveralDiscounts(){
          Assert.AreEqual(8 + (8 * 2 * 0.95), potter.Price(new ArrayList { 0, 0, 1 }));  
          Assert.AreEqual(2 * (8 * 2 * 0.95), potter.Price(new ArrayList { 0, 0, 1, 1 }));  
          Assert.AreEqual((8 * 4 * 0.8) + (8 * 2 * 0.95), potter.Price(new ArrayList { 0, 0, 1, 2, 2, 3 })); 
          Assert.AreEqual(8 + (8 * 5 * 0.75), potter.Price(new ArrayList { 0, 1, 1, 2, 3, 4 }));  
        }

        [TestMethod]
        public void testEdgeCases(){
            Assert.AreEqual(2 * (8 * 4 * 0.8), potter.Price(new ArrayList { 0, 0, 1, 1, 2, 2, 3, 4 }));
            Assert.AreEqual(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8), potter.Price(new ArrayList { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4 }));  
        }
    }
}
