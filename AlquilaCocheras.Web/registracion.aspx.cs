using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using System.Text;

namespace AlquilaCocheras.Web
{
    public partial class registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string tipoUsuario = rblPerfil.SelectedValue;
            string email = txtEmail.Text;
            string pass = txtContrasenia.Text;


            switch (tipoUsuario)
            {
                case "1":
                    Usuario usCliente = new Cliente();
                    setUsuario(nombre, apellido, email, tipoUsuario, pass, usCliente);
                    break;
                case "2":
                    Usuario usPropietario = new Propietario();
                    setUsuario(nombre, apellido, email, tipoUsuario, pass, usPropietario);
                    break;
            }
            string mensaje = "<h2>Registración Existosa! Diríjase al <a href='login.aspx'><span class='label label-info'>login</span></a>.</h2>";
            lblResultado.Text = mensaje;
            lblResultado.Visible = true;
            titulo.Visible = false;
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";

        }
        private static void setUsuario(string nombre, string apellido, string email, string tipo, string contrasenia, Usuario us)
        {
            us.Nombre = nombre;
            us.Apellido = apellido;
            us.Email= email;
            us.Tipo = tipo;
            us.Contrasenia = contrasenia;

            us.agregarUsuario(us);

        }

    }
}
