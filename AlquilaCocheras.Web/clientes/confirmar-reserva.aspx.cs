using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using Acceso_BaseDatos;
using Clase_Usuario;
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

                Cocheras cochera = ctx.Cocheras.Where(c => c.IdCochera == id).FirstOrDefault();

                lblUbicacion.Text = cochera.Ubicacion;
                precioHora.Value = cochera.Precio.ToString();
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int id = Int32.Parse(Request.QueryString["id"]);
                TP_20162CEntities ctx = new TP_20162CEntities();
                Cocheras coche = ctx.Cocheras.Where(i => i.IdCochera == id).FirstOrDefault();
                Usuario usuario = new Usuario(ctx);
                Usuarios usu = usuario.obtenerUsuario((string)Session["Usuario"]);
                Reserva res = new Reserva(ctx);
                Reservas reserva = new Reservas();
                reserva.IdCochera = coche.IdCochera;
                reserva.IdCliente = usu.IdUsuario;
                reserva.CantidadHoras = coche.Precio;
                reserva.FechaInicio = DateTime.Parse(txtFechaInicio.Text);
                reserva.FechaFin = DateTime.Parse(txtFechaFin.Text);
                reserva.FechaCarga = DateTime.Now;
                reserva.HoraFin = txtHorarioFin.Text;
                reserva.HoraInicio = txtHorarioInicio.Text;
                reserva.Precio = Int32.Parse(lblPrecioTotal.Text);
                res.agregarReservas(reserva);
               
                Response.Redirect("reservar.aspx");

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