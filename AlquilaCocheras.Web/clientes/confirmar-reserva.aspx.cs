using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using Acceso_BaseDatos;
namespace AlquilaCocheras.Web.clientes
{
    public partial class confirmar_reserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TP_20162CEntities ctx = new TP_20162CEntities();
            imgFoto.ImageUrl = "http://azapedia.net/azpd/wp-content/uploads/2016/06/0d40a5e4a645fc6b96e767d64ac0878e-5.png";
            if (!IsPostBack)
            {

                int id = Int32.Parse(Request.QueryString["id"]);

                List<Cocheras> cocheraLista = new List<Cocheras>();
                cocheraLista.Add(ctx.Cocheras.Where(c => c.IdCochera == id).FirstOrDefault());

                Repeater1.DataSource = cocheraLista;
                Repeater1.DataBind();
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ShowPopUpMsg("Operacion Exitosa!");
            }
        }
        private void ShowPopUpMsg(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }
    }
}