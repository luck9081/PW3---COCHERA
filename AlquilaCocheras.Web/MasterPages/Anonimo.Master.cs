using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;

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
                    Usuario us = (Usuario)Session["usuario"];
                   
                    if (us.Tipo.Equals("1"))
                        Response.Redirect("/clientes/reservar.aspx");
                    else
                        Response.Redirect("/propietarios/perfil.aspx");
                }
            }
        }
    }
}