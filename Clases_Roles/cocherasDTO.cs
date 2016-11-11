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
        private int Numero;
        private decimal PrecioHora;
        private decimal PrecioTotal;
        private string NombrePropietario;
        private string Imagen;
        private decimal Latitud;
        private decimal Longitud;
        private int Puntuacion;

        public cocherasDTO(int numero,decimal precioHora,decimal precioTotal,string nombrePropietario,string img,decimal lat,decimal lon,int puntuacion)
        {
            Numero = numero;
            PrecioHora = precioHora;
            PrecioTotal = precioTotal;
            NombrePropietario = nombrePropietario;
            Imagen = img;
            Latitud = lat;
            Longitud = lon;
            Puntuacion = puntuacion;
        }
    }
}
