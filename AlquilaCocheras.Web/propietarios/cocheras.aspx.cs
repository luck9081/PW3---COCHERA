using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clase_Usuario;

namespace AlquilaCocheras.Web.propietarios
{
    public partial class cocheras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                
            }
        }

        protected void btnCrearCochera_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsPostBack)
            {
                Cochera cochera = new Cochera(
                    1,
                    txtUbicacion.Text,
                    txtFechaInicio.Text,
                    txtFechaFin.Text,
                    txtHorarioInicio.Text,
                    txtHorarioFin.Text,
                    txtDescripcion.Text,
                    fuFoto.PostedFile.FileName,
                    txtLatitud.Text,
                    txtLongitud.Text,
                    txtPrecioHora.Text,
                    txtMetrosCuadrados.Text,
                    lbTipoVehiculo.SelectedValue
                );

                if (cochera.cargarCochera())
                {
                    divResultado.Visible = true;
                }
                else
                {
                    lblResultado.Text = "Ya existe una cochera en las mismas coordenadas y del mismo tipo de vehículo.";
                    divResultado.Visible = true;
                    txtUbicacion.Text = ""; // Si no limpiamos este input, latitud y longitud quedarán en blanco y el usuario podrá hacer postback sin ellos.
                }
            }
        }
    }
}