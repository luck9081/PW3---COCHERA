using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clase_Usuario;


namespace AlquilaCocheras.Web
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Session["tabla"] != null)
            {
                asd.Visible = true;
                
                bannerRow.Visible = false;
            }

            if (IsPostBack)
            {
                asd.Visible = true;
                bannerRow.Visible = false;

                AlquilaCocheras.Web.servicios.Cocheras servicioCocheras = new AlquilaCocheras.Web.servicios.Cocheras();

                Repeater1.DataSource = servicioCocheras.obtenerCocheras(UCBusquedaDefault.Ubicacion, null, null);
                Repeater1.DataBind();
                
            }
        }
        
        protected void link_Click(object sender, EventArgs e)
        {
            foreach (Control c in Repeater1.Controls)
            {
                HiddenField oculto = (HiddenField)c.FindControl("Ocultos");
                if (oculto != null)
                {

                    Session["link"] = oculto.Value;
                
                }
            }
        }
    }
}