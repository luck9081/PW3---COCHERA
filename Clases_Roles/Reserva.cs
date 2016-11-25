using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_BaseDatos;
using Clases_Roles;

namespace Clase_Usuario
{
    public class Reserva
    {
        private DateTime FechaInicio;
        private DateTime FechaFin;
        private string emailBusqueda;
        TP_20162CEntities ctx = new TP_20162CEntities();
        public Reserva(string fechaInicio, string fechaFin, string email)
        {
            FechaInicio = DateTime.Parse(fechaInicio);
            FechaFin = DateTime.Parse(fechaFin);
            emailBusqueda = email;
        }

        public Reserva(TP_20162CEntities context)
        {
            ctx = context;
        }
        public void agregarReservas(Reservas reserva)
        {
            ctx.Reservas.Add(reserva);
            ctx.SaveChanges();
        }

        public dynamic listaReservas()
        {
           

            var lista = (
                    from r in ctx.Reservas
                    join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                    join u in ctx.Usuarios on c.IdPropietario equals u.IdUsuario
                    where u.Email == emailBusqueda && r.FechaFin <= FechaFin && r.FechaInicio >= FechaInicio

                    select new
                    {
                        Ubicación = c.Ubicacion,
                        Fecha_Inicio = r.FechaInicio,
                        Fecha_Fin = r.FechaFin,
                        Usuario_Que_Reservó = string.Concat(u.Nombre," ",u.Apellido),
                        Cantidad_Horas = r.CantidadHoras,
                        Total_Cobrado = r.CantidadHoras * r.Precio,
                        Puntuación = r.Puntuacion

                    }).ToList();

            return lista;
        }
    }
}
