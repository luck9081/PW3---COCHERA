using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;

namespace AlquilaCocheras.Web.MasterPages
{
    public partial class Propietarios : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario us = (Usuario)Session["usuario"];   // Guarda en una clase instanciada la variable de sesion (que contiene un objeto de tipo Usuario)

                
                if (us.Tipo.Equals("1"))                                // Como ya sabemos que la sesion está iniciada, el Tipo de usuario solo puede valer 1 o 2
                    Response.Redirect("/cliente/reservas.aspx",true);   // Y si vale 1, lo cual significa CLIENTE, redireccionamos a una página correspondiente a CLIENTE
            }
            else
            {
                // Guardo la redireccion al Login en un string,
                // el cual también posee la URL actual en una variable pasada por "GET"

                string url = String.Concat("/login.aspx?url=", HttpContext.Current.Request.Url.AbsolutePath);

                Response.Redirect(url,true);    // Y aquí efectivamente redirijo al Login
            }
        }
    }
}