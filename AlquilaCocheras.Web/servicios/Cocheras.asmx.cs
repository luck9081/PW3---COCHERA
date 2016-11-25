using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Acceso_BaseDatos;
using Clase_Usuario;

namespace AlquilaCocheras.Web.servicios
{
    /// <summary>
    /// Summary description for Cocheras
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]

    public class Cocheras : System.Web.Services.WebService
    {
        private TP_20162CEntities ctx = new TP_20162CEntities();

        public Cocheras ()
        {
            // CONSTRUCTOR
        }

        [WebMethod]
        public List<cocherasDTO> obtenerCocheras(string ubicacion,DateTime? fechaInicio,DateTime? fechaFin)
        {
            var cocherasDisponibles =
                ctx.Reservas
                .Where(r => r.Cocheras.Ubicacion == ubicacion || r.FechaInicio > fechaFin || r.FechaFin < fechaInicio)
                .Select(
                    r => new cocherasDTO
                    {
                        idCochera = r.Cocheras.IdCochera,
                        PrecioHora = r.Cocheras.Precio,
                        Ubicacion = r.Cocheras.Ubicacion,
                        Latitud = r.Cocheras.Latitud,
                        Longitud = r.Cocheras.Longitud,
                        Imagen = r.Cocheras.Imagen,
                        NombrePropietario = string.Concat(r.Cocheras.Usuarios.Nombre, " ", r.Cocheras.Usuarios.Apellido),
                        Puntuacion =
                             (
                                from ra in ctx.Reservas
                                where ra.IdCochera == r.Cocheras.IdCochera //&& ra.Puntuacion != 0
                                select new
                                {
                                    puntuacion = ra.Puntuacion
                                }

                            ).Average(ra => ra.puntuacion)
                    }

                ).Distinct().ToList();

            return cocherasDisponibles;

        }

    }
}
