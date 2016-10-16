using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;

namespace AlquilaCocheras.Web
{
    public partial class defaultUcMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ESTABLECER EL MENU DE NAVEGACION PARA CADA TIPO DE USUARIO

            if (Session["usuario"] != null)
            {
                Usuario us = (Usuario)Session["usuario"];

                switch (us.Tipo)
                {
                    case "1":
                        menuCliente.Attributes.CssStyle.Clear();                // Limpiamos todas las clases de CLIENTE
                        menuCliente.Attributes.Add("class", "navbar-wrapper");  // Y agregamos las que estaban, menos "hidden".
                        menuAnonimo.Attributes.Add("class", "hidden");          // Ahora ocultamos ANONIMO
                        break;

                    case "2":
                        menuPropietario.Attributes.CssStyle.Clear();                // Limpiamos todas las clases de PROPIETARIO
                        menuPropietario.Attributes.Add("class", "navbar-wrapper");  // Y agregamos las que estaban, menos "hidden".
                        menuAnonimo.Attributes.Add("class", "hidden");              // Ahora ocultamos ANONIMO
                        break;
                }
            }
        }
    }
}