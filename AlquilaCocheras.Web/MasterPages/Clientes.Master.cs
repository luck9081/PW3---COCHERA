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
    public partial class Clientes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                string url = String.Concat("/login.aspx?url=", HttpContext.Current.Request.Url.AbsolutePath);


                url = String.Concat(url, "&id=");
                url = String.Concat(url, Request.QueryString["id"]);


                Response.Redirect(url);
            }
        }
    }
}