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
    public partial class Anonimo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    string email = Session["usuario"].ToString();
                    TP_20162CEntities ctx = new TP_20162CEntities();
                    Usuario user = new Usuario(ctx);
                    Usuarios us = new Usuarios();
                    us = user.obtenerUsuario(email);

                    if (us.Perfil == 1)
                        Response.Redirect("/clientes/reservar.aspx");
                    else
                        Response.Redirect("/propietarios/reservas.aspx");
                }
            }
        }
    }
}