using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
namespace AlquilaCocheras.Web.MasterPages
{
    public partial class Clientes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    Usuario us = (Usuario)Session["usuario"];
                    if (us.Tipo.Equals("Cliente"))
                        Response.Redirect("/clientes/reservar.aspx");
                }
                else
                {
                    string url = String.Concat("/login.aspx?url=", HttpContext.Current.Request.Url.AbsolutePath);
                    Response.Redirect(url);
                }
            }
        }
    }
}