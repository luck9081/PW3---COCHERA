using Clases_Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlquilaCocheras.Web.propietarios
{
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["usuario"] != null && !IsPostBack)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                txtNombre.Text = usuario.Nombre;
                txtEmail.Text = usuario.Email;
                txtApellido.Text = usuario.Apellido;
                txtContrasenia.Text = usuario.Contrasenia;
                string pass = usuario.Contrasenia;               
            }

            if (Session["usuario"] != null && IsPostBack)
            {
                Usuario usuario = new Usuario();
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtEmail.Text;
                usuario.Tipo = "2";
                usuario.Contrasenia = txtContrasenia.Text;
                Session["usuario"] = usuario;                
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsPostBack)
            {
                divResultado.Visible = true;
            }
        }
    }
}