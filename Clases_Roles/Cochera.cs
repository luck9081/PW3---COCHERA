using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_BaseDatos;
using Clases_Roles;

namespace Clase_Usuario
{
    public class Cochera
    {
        TP_20162CEntities ctx = new TP_20162CEntities();

        private Int32 IdPropietario;
        private Decimal Latitud;
        private Decimal Longitud;
        private Decimal Precio;
        private Int32 Area;
        private Int16 Vehiculo;
        private string Ubicacion;
        private DateTime FechaInicio;
        private DateTime FechaFin;
        private string HoraInicio;
        private string HoraFin;
        private string Descripcion;
        private string Imagen;

        public Cochera(TP_20162CEntities context)
        {
            ctx = context;
        }
        // Constructor de Cochera, castear aquellos valores que correspondan
        public Cochera(
            Int32 idPropietario,  // no debería hacer falta castearlo, ya que lo obtiene de Sesion
            string ubicacion,
            string fechaInicio, // castear a datetime
            string fechaFin,    // castear a datetime
            string horaInicio,
            string horaFin,
            string descripcion,
            string imagen,
            string lat,         // castear a decimal
            string lon,         // castear a decimal
            string precio,      // castear a decimal
            string area,        // castear a int32            
            string vehiculo     // castear a int16
        )
        {
            IdPropietario = idPropietario;
            Ubicacion = ubicacion;
            HoraFin = horaFin;
            HoraInicio = horaInicio;
            Descripcion = descripcion;
            Imagen = imagen;
            FechaInicio = DateTime.Parse(fechaInicio);
            FechaFin = Convert.ToDateTime(fechaFin);
            Latitud = Decimal.Parse(lat);
            Longitud = Decimal.Parse(lon);
            Precio = Decimal.Parse(precio);
            Area = Int32.Parse(area);
            Vehiculo = Int16.Parse(vehiculo);

            return;
        }

        public bool existeCochera()  // Retorna booleano para corroborar si ya existía otra cochera con misma lat, long y tipo vehículo (de ser así, no hace el insert)
        {
            TP_20162CEntities context = new TP_20162CEntities();
            var cochera = context.Cocheras.Where(c1 => c1.Latitud == Latitud && c1.Longitud == Longitud && c1.TipoVehiculo == Vehiculo).FirstOrDefault();

            if (cochera!=null)
            {
                return true;    // Esto quiere decir que ya hay un registro con estos tres campos, por ende no podemos hacer el insert
            }
            else
            {
                return false;   // En caso false, podemos hacer el insert
            }
        }

        public bool cargarCochera(string emailBusqueda) // Carga en base de datos la cochera
        {
            
                TP_20162CEntities context = new TP_20162CEntities();
                Cocheras cocheraBD = new Cocheras();
                Usuarios usuarioBD = new Usuarios();

                Usuario us = new Usuario(context);

                usuarioBD = us.obtenerUsuario(emailBusqueda);

                cocheraBD.Ubicacion = Ubicacion;
                cocheraBD.FechaInicio = FechaInicio;
                cocheraBD.FechaFin = FechaFin;
                cocheraBD.HoraInicio = HoraInicio;
                cocheraBD.HoraFin = HoraFin;
                cocheraBD.Descripcion = Descripcion;
                cocheraBD.Imagen = Imagen;
                cocheraBD.Latitud = Latitud;
                cocheraBD.Longitud = Longitud;
                cocheraBD.Precio = Precio;
                cocheraBD.MetrosCuadrados = Area;
                cocheraBD.TipoVehiculo = Vehiculo;

                cocheraBD.Usuarios = usuarioBD;

                context.Cocheras.Add(cocheraBD);

                context.SaveChanges();

                return true;    // Retornamos que se ha hecho el insert exitosamente, esto nos dará control para actuar en consecuencia en el aspx
            
          
        }
    }
}
