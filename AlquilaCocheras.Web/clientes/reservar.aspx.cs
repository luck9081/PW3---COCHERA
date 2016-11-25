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

                if((UCBusquedaDefault.FechaInicio == "" || UCBusquedaDefault.FechaInicio == null) && (UCBusquedaDefault.FechaFin != "" && UCBusquedaDefault.FechaFin != null))
                {
                    Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion,null,DateTime.Parse(UCBusquedaDefault.FechaFin));
                }

                else if ((UCBusquedaDefault.FechaFin == "" || UCBusquedaDefault.FechaFin == null) && (UCBusquedaDefault.FechaInicio != "" && UCBusquedaDefault.FechaInicio != null))
                {
                    Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion, DateTime.Parse(UCBusquedaDefault.FechaInicio), null);
                }

                else if ((UCBusquedaDefault.FechaFin == "" || UCBusquedaDefault.FechaFin == null) && (UCBusquedaDefault.FechaInicio == "" || UCBusquedaDefault.FechaInicio == null))
                {
                    Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion,null,null);
                }

                else
                {
                    Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion, DateTime.Parse(UCBusquedaDefault.FechaInicio), DateTime.Parse(UCBusquedaDefault.FechaFin));
                }

                Repeater1.DataBind();
            }
        }
    }
}