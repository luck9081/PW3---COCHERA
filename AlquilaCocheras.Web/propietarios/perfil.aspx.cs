using Clases_Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acceso_BaseDatos;

namespace AlquilaCocheras.Web.propietarios
{
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["usuario"] != null)  // Si no es postback, se muestran los datos.
            {
                TP_20162CEntities ctx = new TP_20162CEntities();
                Usuario us = new Usuario(ctx);
                string emailBusqueda = (string)Session["usuario"];

                Usuarios user = new Usuarios();
                user = us.obtenerUsuario(emailBusqueda);

                txtNombre.Text = user.Nombre;
                txtEmail.Text = user.Email;
                txtApellido.Text = user.Apellido;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsPostBack) // Si es postback, se cargan los datos.
            {
                TP_20162CEntities ctx = new TP_20162CEntities();
                Usuario us = new Usuario(ctx);
                string emailBusqueda = (string)Session["usuario"];

                us.modificarPerfil(emailBusqueda, txtNombre.Text, txtApellido.Text, txtEmail.Text, txtContrasenia.Text, 2);

                Session["usuario"] = txtEmail.Text;
                divResultado.Visible = true;
            }
        }
    }
}