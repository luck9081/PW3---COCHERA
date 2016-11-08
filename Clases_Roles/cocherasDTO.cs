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
       TP_20162CEntities ctx = new TP_20162CEntities();

       public cocherasDTO(TP_20162CEntities context)
       {
           ctx = context;
       }

       public List<Cocheras> obtenerCocheras(string ubicacion, DateTime? fechaI, DateTime? fechaF)
       {
           var lista = ctx.Cocheras.Where(i => i.Ubicacion == ubicacion && (i.FechaFin == fechaI || i.FechaFin == fechaF)).ToList();
           return lista;
       
       }
    }
}
