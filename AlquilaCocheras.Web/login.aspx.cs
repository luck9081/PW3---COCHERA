using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;

namespace AlquilaCocheras.Web
{
    public partial class login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario us = new Usuario();
            string email = txtEmail.Text;
            string pass= txtContrasenia.Text;
            bool flag = us.encontrarUsuario(email);

            if (flag)
            {
                us = us.obtenerUsuario(email);
                if (us.Tipo == "1" & us.CompararContraseñas(email, pass))
                {
                    Response.Redirect("/clientes/reservar.aspx?pestaña=cliReservar", false);
                }
                else
                {
                    if (us.Tipo == "2" & us.CompararContraseñas(email, pass))
                    {
                        Response.Redirect("/propietarios/reservas.aspx?pestaña=propReservas", false);
                    }
                    else
                        lblResultado.Text = "La contraseña es erronea";
                }
                HttpContext.Current.Session["usuario"] = us;
            }
            else
            {
                lblResultado.Text = "El mail no ha sido registrado";
            }
        }
             
   }
}
 

