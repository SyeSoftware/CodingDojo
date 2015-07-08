using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using StringCalculatorLib;

namespace StringCalculatorTest
{
    [TestClass]
    public class StringCalculatorTest
    {
        [TestMethod]
        public void CadenaVacia()
        {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            int result = calculator.Add("");

            //Assert
            Assert.AreEqual(0, result);

        }

        [TestMethod]
        public void SumaUnNumero() {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            int result = calculator.Add("1");

            //Assert
            Assert.AreEqual(1, result);            
        }

        [TestMethod]
        public void SumaVariosNumeros()
        {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            int result = calculator.Add("1\n2,3");

            //Assert
            Assert.AreEqual(6, result);
        }

        [TestMethod,ExpectedException(typeof(FormatException))]        
        public void SumaVariosNumerosInvalido()
        {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            int result = calculator.Add("1,\n");

            //Assert
            Assert.AreEqual(1, result);
        }

        [TestMethod]
        public void SumaDiferenteDelimitador()
        {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            int result = calculator.Add("//$\n1$2");

            //Assert
            Assert.AreEqual(3, result);
        }

        [TestMethod]
        public void SumaDiferenteDelimitadorSinNegativos()
        {
            //Arrange
            StringCalculator calculator = new StringCalculator();

            //Act
            string ResultadoEx = "";
            try
            {
                int result = calculator.Add("//$\n1$2$-2");
            }
            catch (FormatException ex)
            {
                ResultadoEx = ex.Message.ToString();
            }

            //Assert
            Assert.AreEqual("No se permiten negativos -2", ResultadoEx, "Los negativos no son permitidos");
        }
    }
}
