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
                // Guarda en una clase instanciada la variable de sesion (que contiene un objeto de tipo Usuario)
                Usuario us = (Usuario)Session["usuario"];

                // Como ya sabemos que la sesion está iniciada, el Tipo de usuario solo puede valer 1 o 2
                // Y si vale 1, lo cual significa CLIENTE, redireccionamos a una página correspondiente a CLIENTE
                if (us.Tipo.Equals("1"))
                    Response.Redirect("/cliente/reservas.aspx",true);
            }
            else
            {
                // GUARDO LA REDIRECCIÓN AL LOGIN EN UN STRING,
                // EL CUAL TAMBIÉN POSEE LA URL ACTUAL EN UNA VARIABLE PASADA POR "GET"
                string url = String.Concat("/login.aspx?url=", HttpContext.Current.Request.Url.AbsolutePath);

                // Y AQUÍ EFECTIVAMENTE REDIRIJO A LOGIN
                Response.Redirect(url,true);
            }
        }
    }
}