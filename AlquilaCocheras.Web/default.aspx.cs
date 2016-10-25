using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AlquilaCocheras.Web
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["tabla"] != null)
            {
                TablaBusqueda.Visible = true;
                bannerRow.Visible = false;
            }
        }
    }
}