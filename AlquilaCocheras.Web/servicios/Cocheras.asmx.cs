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
        public Cocheras ()
        {

        }

        [WebMethod]
        public Object obtenerCocheras(string ubicacion,DateTime? fechaInicio,DateTime? fechaFin)
        {
            TP_20162CEntities ctx = new TP_20162CEntities();

            /* var promedioPuntuacion = (
                     from r in ctx.Reservas
                     join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                     where c.Ubicacion.Contains(ubicacion)

                     select new
                     {
                         promedio = r.
                         Rating = g.Average()
                     }
                 ).Distinct();*/


           /* var listado = (
                    from r in ctx.Reservas
                    join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                    join u in ctx.Usuarios on c.IdPropietario equals u.IdUsuario
                    where c.Ubicacion.Contains(ubicacion) && r.Puntuacion > 0 //&& (r.FechaFin <= fechaFin || r.FechaInicio >= fechaInicio)
                    group r by c.IdCochera into grupo

                    select new
                    {
                        idCochera = grupo.,
                        precio_hora = c.Precio,
                        Ubicación = c.Ubicacion,
                        lat = c.Latitud,
                        lon = c.Longitud,
                        imagen = c.Imagen,
                        Usuario_Que_Creó = string.Concat(u.Nombre, " ", u.Apellido),
                        Puntuacion = (float)0,

                    }).ToList();*/

            var listado = (
                    from r in ctx.Reservas
                    join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                    join u in ctx.Usuarios on c.IdPropietario equals u.IdUsuario
                    where c.Ubicacion.Contains(ubicacion) && r.Puntuacion > 0 //&& (r.FechaFin <= fechaFin || r.FechaInicio >= fechaInicio)
                    group new
                    {
                        idCochera = c.IdCochera,
                        precio_hora = c.Precio,
                        Ubicación = c.Ubicacion,
                        lat = c.Latitud,
                        lon = c.Longitud,
                        imagen = c.Imagen,
                        Usuario_Que_Creó = string.Concat(u.Nombre, " ", u.Apellido),
                        
                    }

                    by c.IdCochera into grupo

                    select grupo

            ).Distinct();

            /*foreach (var cochera in listado)
            {
                var listaPuntajes = (
                    from r in ctx.Reservas
                    where r.IdCochera == cochera.idCochera && r.Puntuacion > 0

                    select new
                    {
                        puntuacion = r.Puntuacion
                    }

                ).ToList();

                int contador = 0;
                int acumulador = 0;

                foreach (var puntaje in listaPuntajes)
                {
                    contador++;
                    acumulador += puntaje.puntuacion;
                }

                cochera.Puntuacion = acumulador / contador;

            }

            /*var rates = ctx.Rates
               .Where(r => r.Id == Id)
               .GroupBy(g => g.UserId, r => r.Rating)
               .Select(g => new
               {
                   UserId = g.Key,
                   Rating = g.Average()
               });

            var UserInRole = db.UserProfiles.
               Join(db.UsersInRoles, u => u.UserId, uir => uir.UserId,
               (u, uir) => new { u, uir }).
               Join(db.Roles, r => r.uir.RoleId, ro => ro.RoleId, (r, ro) => new { r, ro })
               .Where(m => m.r.u.UserId == 1)
               .Select(m => new AddUserToRole
               {
                   UserName = m.r.u.UserName,
                   RoleName = m.ro.RoleName
               });

            var listado1 =
                ctx.Reservas
                .Join(ctx.Cocheras, r => r.IdReserva, c => c.IdCochera,(r,c) => new {r,c})
                .Join(ctx.Usuarios,)*/


            return listado;
        }
    }
}
