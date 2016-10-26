using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using Acceso_BaseDatos;
namespace AlquilaCocheras.Web.MasterPages
{
    public partial class Propietarios : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                string email = Session["usuario"].ToString();
                TP_20162CEntities ctx = new TP_20162CEntities();
                Usuario user = new Usuario(ctx);
                Usuarios us = new Usuarios();
                us = user.obtenerUsuario(email);

                if (us.Perfil == '2')
                    Response.Redirect("/propietarios/reservas.aspx");
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