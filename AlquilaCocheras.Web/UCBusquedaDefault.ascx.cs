using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlquilaCocheras.Web
{
    public partial class UCBusquedaDefault : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;
            if (txtUbicacion.Text == "" && txtFechaInicio.Text == "" && txtFechaFin.Text=="")
            {
                CustomValidator1.ErrorMessage = "Se necesita completar al menos 1 campo";
                args.IsValid = false;

            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string ubicacionIncorrecta = "San Justo";
            string ubicacionCorrecta = "Haedo";
            if (txtUbicacion.Text == ubicacionIncorrecta)
            {
                lblResultado.Text = "No se encontraron resultados";
            }
            if (txtUbicacion.Text == ubicacionCorrecta)
            {
                Session["tabla"] = true;
                string url = HttpContext.Current.Request.Url.AbsolutePath;
                Server.Transfer(url,false);
                if (url == "/clientes/reservar.aspx")
                {
                    ShowPopUpMsg("Se encontraron resultados");
                }
            }
        }
        private void ShowPopUpMsg(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }
    }
}