using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlquilaCocheras.Web.clientes
{
    public partial class reservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void enviarPuntacion_Click(object sender, EventArgs e)
        {
            string puntuacion = ddlPuntuacion.SelectedValue;
            puntaje.Text = puntuacion;
            tdBoton.Visible = false;
            tdPuntuacion.Visible = true;
            colorRow1.Attributes["Class"] = "bg-success";

        }
        protected void enviarPuntacion2_Click(object sender, EventArgs e)
        {
            string puntuacion2 = ddlPuntuacion1.SelectedValue;
            puntaje2.Text = puntuacion2;
            tdBoton2.Visible = false;
            tdPuntuacion2.Visible = true;
            colorRow.Attributes["Class"] = "bg-success";

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/clientes/reservar.aspx");
        }
    }
}