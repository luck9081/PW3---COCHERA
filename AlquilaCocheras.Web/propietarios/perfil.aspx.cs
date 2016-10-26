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
            if (Session["usuario"] != null && !IsPostBack)
            {
                
                
               /* Usuarios user = (Usuarios)Session["usuario"];
                txtNombre.Text = user.Nombre;
                txtEmail.Text = user.Email;
                txtApellido.Text = user.Apellido;
                txtContrasenia.Text = user.Contrasenia;
                string pass = user.Contrasenia;         */    
           
            }

            if (Session["usuario"] != null && IsPostBack)
            {
               // 
               // usuario.Nombre = txtNombre.Text;
               // usuario.Apellido = txtApellido.Text;
               // usuario.Email = txtEmail.Text;
               // usuario.Tipo = "2";
               // usuario.Contrasenia = txtContrasenia.Text;
               // Session["usuario"] = usuario;                
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