using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlquilaCocheras.Web.propietarios
{
    public partial class reservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // METODO LLAMADO POR CUSTOM VALIDATOR (PARA PROCESAR EN SERVIDOR EN EL POSTBACK)
        protected void ValidarRangoFecha(object source, ServerValidateEventArgs arg)
        {
            // Casteamos los dos campos a tipo datetime
            DateTime dt1 = Convert.ToDateTime(txtFechaInicio.Text);
            DateTime dt2 = Convert.ToDateTime(txtFechaFin.Text);

            // Guardamos su diferencia en días en double
            double result = (dt2 - dt1).TotalDays;

            // El parametro "arg" representa el valor booleano de nuestro CustomValidator
            // Si es "True", es válido. Sino, no valida
            arg.IsValid = result <= 90;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
           
        }
    }
}