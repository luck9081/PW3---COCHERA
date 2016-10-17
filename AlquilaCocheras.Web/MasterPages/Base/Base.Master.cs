using Clases_Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlquilaCocheras.Web.MasterPages
{
    public partial class Base : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario us = (Usuario)Session["usuario"];
                if (us.Tipo.Equals("2"))
                {
                    body.Attributes.Add("class", "contenedor-perfil");
                }
            }            
        }
    }
}