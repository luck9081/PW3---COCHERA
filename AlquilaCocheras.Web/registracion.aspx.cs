using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using System.Text;
using Acceso_BaseDatos;

namespace AlquilaCocheras.Web
{
    public partial class registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            // Existencia del e-mail ingresado
            TP_20162CEntities ctx = new TP_20162CEntities();
            Usuario us = new Usuario(ctx);
            if (us.encontrarMail(txtEmail.Text))
            {
                lblResultado.Text = "Este mail ya ha sido registrado";
            }
            else
            {
                Usuarios user = new Usuarios();  // Creo un objeto Usuarios (tabla)
                //Seteo los datos
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Email = txtEmail.Text;
                user.Contrasenia = txtContrasenia.Text;
                user.Perfil = Byte.Parse(rblPerfil.SelectedValue);
                us.agregarUsuario(user);
                string mensaje = "<h2>Registración Exitosa! dirijase al <a href='login.aspx'><span class='label label-info'>login</span></a>.</h2>";
                lblResultado.Text = mensaje;
                lblResultado.Visible = true;
                titulo.Visible = false;
            }

        }
      

    }
}
