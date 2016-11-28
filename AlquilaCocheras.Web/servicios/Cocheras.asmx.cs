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

            List<int> existenReservas =
                (
                    from ra in ctx.Reservas
                    where ra.Cocheras.Ubicacion.Contains(ubicacion)
                    select ra.Cocheras.IdCochera

                ).ToList();





            if (existenReservas == null || !existenReservas.Any())
            {
                var cocherasDisponibles =
                    ctx.Cocheras
                    .Where(c => c.Ubicacion.Contains(ubicacion) || c.FechaInicio > fechaFin || c.FechaFin < fechaInicio)
                    .Select(
                        c => new cocherasDTO
                        {
                            idCochera = c.IdCochera,
                            PrecioHora = c.Precio,
                            Ubicacion = c.Ubicacion,
                            Latitud = c.Latitud,
                            Longitud = c.Longitud,
                            Imagen = c.Imagen,
                            NombrePropietario = string.Concat(c.Usuarios.Nombre, " ", c.Usuarios.Apellido),
                            Puntuacion = 0

                        }

                    ).Distinct().ToList();

                return cocherasDisponibles;
            }
            else
            {

                var cocherasDisponibles =
                    ctx.Cocheras
                    .Where(c => c.Ubicacion.Contains(ubicacion) || c.FechaInicio > fechaFin || c.FechaFin < fechaInicio)
                    .Select(
                        c => new cocherasDTO
                        {
                            idCochera = c.IdCochera,
                            PrecioHora = c.Precio,
                            Ubicacion = c.Ubicacion,
                            Latitud = c.Latitud,
                            Longitud = c.Longitud,
                            Imagen = c.Imagen,
                            NombrePropietario = string.Concat(c.Usuarios.Nombre, " ", c.Usuarios.Apellido),
                            Disponible = true,
                            Puntuacion = (
                                    from ra in ctx.Reservas
                                    where ra.IdCochera == c.IdCochera //&& ra.Puntuacion != 0
                                    select new { puntuacion = ra.Puntuacion }

                                ).Average(ra => ra.puntuacion)

                        }

                    ).Distinct().ToList();

                return cocherasDisponibles;
            }

        }

    }
}
