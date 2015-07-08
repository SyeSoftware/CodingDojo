using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PotterPromociones
{
    public class Promociones
    {
        static void Main(string[] args)
        {
            Promociones potter = new Promociones();
            double valor = potter.Price(new ArrayList { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4 });
        }

        public double Price( ArrayList Libros)
        {
            double CostoLibro = 8,Total=0;
            int CincoDif=0,CuatroDif=0,TresDif=0,DosDif=0,Resto=0;
            //ArrayList Promocion = new ArrayList();
            while (Libros.ToArray().Distinct().Count() > 1)
            {

                switch (Libros.ToArray().Distinct().Count())
                {
                    case 5: CincoDif++; break;
                    case 4: CuatroDif++; break;
                    case 3: TresDif++; break;
                    case 2: DosDif++; break;
                }

                foreach (object Valor in Libros.ToArray().Distinct())
                {
                    Libros.Remove(Valor);
                }

            }

            Resto = Libros.Count;

            //Truco
            if (CincoDif >= 1 && TresDif >= 1)
            {
                CincoDif--;
                TresDif--;
                CuatroDif += 2;
            }

            Total = (CostoLibro * 5 * CincoDif * .75) +
                    (CostoLibro * 4 * CuatroDif * .80) +
                    (CostoLibro * 3 * TresDif * .90) +
                    (CostoLibro * 2 * DosDif * .95) +
                    (CostoLibro * Resto);

            return Total;
        }
    }
}
