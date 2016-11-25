using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_BaseDatos;

namespace Clase_Usuario
{
   public class cocherasDTO
    {
        public Boolean Disponible { get; set; }
        public int idCochera { get; set; }
        public decimal PrecioHora { get; set; }
        public double Puntuacion { get; set; }
        public string Ubicacion { get; set; }
        public string NombrePropietario { get; set; }
        public string Imagen { get; set; }
        public decimal Latitud { get; set; }
        public decimal Longitud { get; set; }

    }
}
