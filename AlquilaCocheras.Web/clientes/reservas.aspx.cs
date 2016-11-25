using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acceso_BaseDatos;
using Clases_Roles;
using Clase_Usuario;
namespace AlquilaCocheras.Web.clientes
{
    public partial class reservas : System.Web.UI.Page
    {
        TP_20162CEntities ctx = new TP_20162CEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario(ctx);
                Usuarios usu = usuario.obtenerUsuario(Session["Usuario"].ToString());
                List<Reservas> rese = (from i in ctx.Reservas
                                       where i.IdCliente == usu.IdUsuario && i.FechaFin < DateTime.Now
                                       select i).ToList();
                repeater.DataSource = rese;
                repeater.DataBind();
            }
        }

        protected void enviarPuntacion_Click(object sender, EventArgs e)
        {
         
            string puntuacion = ddlPuntuacion.SelectedValue;

            int id = Int32.Parse(hdIdPuntuacion.Value);

            Reservas reserva = (from i in ctx.Reservas
                                where i.IdReserva == id
                                select i).FirstOrDefault();
            reserva.Puntuacion = Int16.Parse(puntuacion);

            ctx.SaveChanges();

            Response.Redirect("/clientes/reservas.aspx");

        }
       
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/clientes/reservar.aspx");
        }
    }
}