using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace StringCalculatorLib
{
    public class StringCalculator
    {

        public int Add(string cadena) {
            if (string.IsNullOrEmpty(cadena)) return 0;
            string[] DelimitadorArray = new string[] { ",", "\n" };
            string Delimitador = ",";
            
            if (cadena.Contains("//"))
            {
                Delimitador = cadena.Split('\n')[0].Replace("//", "");
                DelimitadorArray = new string[] {Delimitador, "\n" };
                cadena = cadena.Replace(String.Format("//{0}\n", Delimitador), "");
            }

            string[] numbers = cadena.Split(DelimitadorArray,StringSplitOptions.None);
            int total=0;

            foreach (string n in numbers)
            {
                if (int.Parse(n) < 0)
                {
                    throw new FormatException("No se permiten negativos "+n);
                }
                total += int.Parse(n);
            }
            

            return total;
        }

        

    }
}
