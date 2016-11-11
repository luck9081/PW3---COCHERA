using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Acceso_BaseDatos;
using Clases_Roles;
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
        TP_20162CEntities ctx = new TP_20162CEntities();

        [WebMethod]
        public List<cocherasDTO> obtenerCocheras(string ubicacion,DateTime? fechaInicio,DateTime? fechaFin)
        {
            TP_20162CEntities ctx = new TP_20162CEntities();
            List<cocherasDTO> lista = new List<cocherasDTO>();
            var listado = (
                    from r in ctx.Reservas
                    join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                    join u in ctx.Usuarios on c.IdPropietario equals u.IdUsuario
                    where c.Ubicacion == ubicacion && (r.FechaFin <= fechaFin || r.FechaInicio >= fechaInicio)

                    select new
                    {
                        numero = c.IdCochera,
                        precio_hora = c.Precio,
                        precio_total =r.Precio,
                        Ubicación = c.Ubicacion,
                        lat = c.Latitud,
                        lon = c.Longitud,
                        imagen = c.Imagen,
                        Fecha_Inicio = r.FechaInicio,
                        Fecha_Fin = r.FechaFin,
                        Usuario_Que_Reservó = string.Concat(u.Nombre, " ", u.Apellido),
                        Cantidad_Horas = r.CantidadHoras,
                        Total_Cobrado = r.CantidadHoras * r.Precio,
                        Puntuación = r.Puntuacion

                    }).ToList();


            foreach (var item in listado)
            {
               
                cocherasDTO cochera = new cocherasDTO(item.numero,item.precio_hora, item.precio_total, item.Usuario_Que_Reservó, item.imagen, item.lat, item.lon, item.Puntuación);
                lista.Add(cochera);
            }
            return lista;
        }
    }
}
