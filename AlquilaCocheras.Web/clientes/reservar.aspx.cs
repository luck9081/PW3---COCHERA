using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clase_Usuario;
using Acceso_BaseDatos;
namespace AlquilaCocheras.Web.clientes
{
    public partial class reservar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TP_20162CEntities ctx = new TP_20162CEntities();
            if (!IsPostBack)
            {
                int id = 1;//(Int32)Session["link"];
                var cochera = (
                    from r in ctx.Reservas
                    join c in ctx.Cocheras on r.IdCochera equals c.IdCochera
                    join u in ctx.Usuarios on c.IdPropietario equals u.IdUsuario
                    where c.IdCochera == id
                    select new
                    {
                        numero = c.IdCochera,
                        precio_hora = c.Precio,
                        precio_total = r.Precio,
                        Ubicación = c.Ubicacion,
                        lat = c.Latitud,
                        lon = c.Longitud,
                        imagen = c.Imagen,
                        Fecha_Inicio = r.FechaInicio,
                        Fecha_Fin = r.FechaFin,
                        Usuario_Que_Creó = string.Concat(u.Nombre, " ", u.Apellido),
                        Cantidad_Horas = r.CantidadHoras,
                        Total_Cobrado = r.CantidadHoras * r.Precio,
                        Puntuación = r.Puntuacion

                    }).ToList();
                Repeater1.DataSource = cochera;
                Repeater1.DataBind();
            }


            if (Session["tabla"] != null)
            {
                asd.Visible = true;
                bannerRow2.Visible = false;
            }

            if (IsPostBack)
            {
                asd.Visible = true;
                bannerRow2.Visible = false;

                AlquilaCocheras.Web.servicios.Cocheras servicioCocheras = new AlquilaCocheras.Web.servicios.Cocheras();

                Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion, null, null);
                Repeater1.DataBind();
            }
        }
    }
}