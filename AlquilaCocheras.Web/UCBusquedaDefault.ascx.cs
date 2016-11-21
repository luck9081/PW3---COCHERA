using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clase_Usuario;

namespace AlquilaCocheras.Web
{
    public partial class UCBusquedaDefault : System.Web.UI.UserControl
    {
        // PROPERTY DEL USERCONTROL PARA LA LISTA DE cocheraDTO
        public List<cocherasDTO> reservasUC = new List<cocherasDTO>();

        public List<cocherasDTO> ReservasUC
        {
            get { return reservasUC; }
            set { reservasUC = value; }
        }

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
            if (IsPostBack)
            {
                // Instancia del WebService
                AlquilaCocheras.Web.servicios.Cocheras servicioCocheras = new AlquilaCocheras.Web.servicios.Cocheras();

                // Si alguna de las dos fechas no ha sido completada, mando al webService un "null" como parámetro en su lugar
                // y obtengo la lista de cocheraDTO, la cual se la asigno a la property "ReservasUC" del UCBusqueda
                if (txtFechaInicio.Text == "" && txtFechaFin.Text != "")
                {
                    ReservasUC = servicioCocheras.obtenerCocheras(txtUbicacion.Text, null, DateTime.Parse(txtFechaFin.Text));
                }
                else if (txtFechaFin.Text == "" && txtFechaInicio.Text != "")
                {
                    ReservasUC = servicioCocheras.obtenerCocheras(txtUbicacion.Text, DateTime.Parse(txtFechaInicio.Text), null);
                }
                else if(txtFechaFin.Text == "" && txtFechaInicio.Text == "")
                {
                    ReservasUC = servicioCocheras.obtenerCocheras(txtUbicacion.Text, null, null);
                }
                else
                {
                    ReservasUC = servicioCocheras.obtenerCocheras(txtUbicacion.Text, DateTime.Parse(txtFechaInicio.Text), DateTime.Parse(txtFechaFin.Text));
                }
            }

            

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