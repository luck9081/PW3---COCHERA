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
        public bool agregarReservas(Reservas reserva)
        {
            if (!solapamientoReserva(reserva))  // Si no está solapada, entonces se puede guardar
            {
                ctx.Reservas.Add(reserva);
                ctx.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool solapamientoReserva(Reservas reserva)
        {
            bool resultado = false;

            List<Reservas> reservasSolapadas = (

                from r in ctx.Reservas
                where r.Cocheras.IdCochera == reserva.Cocheras.IdCochera
                select r

            ).ToList();

            foreach(Reservas item in reservasSolapadas)
            {
                if (
                    reserva.FechaInicio >= item.FechaInicio
                    && reserva.FechaFin <= item.FechaFin
                    && (
                        (
                            TimeSpan.Parse(reserva.HoraInicio) >= TimeSpan.Parse(item.HoraInicio)
                            && TimeSpan.Parse(reserva.HoraInicio) <= TimeSpan.Parse(item.HoraFin)
                        )
                        ||
                        (
                            TimeSpan.Parse(reserva.HoraInicio) <= TimeSpan.Parse(item.HoraInicio)
                            && TimeSpan.Parse(reserva.HoraInicio) >= TimeSpan.Parse(item.HoraFin)
                        )
                        ||
                        (
                            TimeSpan.Parse(reserva.HoraInicio) >= TimeSpan.Parse(item.HoraInicio)
                            && TimeSpan.Parse(reserva.HoraInicio) >= TimeSpan.Parse(item.HoraFin)
                        )
                        ||
                        (
                            TimeSpan.Parse(reserva.HoraInicio) <= TimeSpan.Parse(item.HoraInicio)
                            && TimeSpan.Parse(reserva.HoraInicio) <= TimeSpan.Parse(item.HoraFin)
                        )
                       )
                   )
                {
                    resultado = true;
                    break;
                }
            }

            return resultado;

        }

        public bool usuarioHabilitadoParaReservar(Usuarios usuario)
        {
            int cuantasNoPuntuo = (
                from r in ctx.Reservas
                where r.Usuarios.IdUsuario == usuario.IdUsuario
                    && r.Puntuacion == 0
                select r
            ).Count();

            if(cuantasNoPuntuo >= 2)
            {
                return false;
            }
            else
            {
                return true;
            }
                        
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
