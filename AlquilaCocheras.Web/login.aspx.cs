using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;
using Acceso_BaseDatos;
namespace AlquilaCocheras.Web
{
    public partial class login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            TP_20162CEntities ctx = new TP_20162CEntities();
            Usuario us = new Usuario(ctx);
            string email = txtEmail.Text;
            string pass = txtContrasenia.Text;

            if (us.encontrarMail(email))
            {
                Usuarios user = new Usuarios();
                user = us.obtenerUsuario(email);
                bool flag = us.compararContraseña(email, pass);

                if (flag)   // Si el email y la contraseña están registrados
                {
                    HttpContext.Current.Session["usuario"] = user.Email;    // Loguea y guarda en sesion el email

                    if (Request.QueryString["url"] == null && user.Perfil == 1) // Si el usuario ingresa al login sin ser redirigido y TIPO 1 ES CLIENTE
                        Response.Redirect("/clientes/reservar.aspx?pestaña=cliReservar", false);

                    else if (Request.QueryString["url"] == null && user.Perfil == 2) // Si el usuario ingresa al login sin ser redirigido y TIPO 2 ES PROPIETARIO
                        Response.Redirect("/propietarios/reservas.aspx?pestaña=propReservas", false);

                    else if (Request.QueryString["url"] != null) // Si el usuario fue redirigido al login, y luego necesita ser redirigido al destino original
                    {
                        string url = String.Concat(Request.QueryString["url"], "?id=");

                        url = String.Concat(url, Request.QueryString["id"]);

                        Response.Redirect(url, false);
                    }
                }
                else
                {
                    lblResultado.Text = "La contraseña no coincide";
                }
            }
            else 
                lblResultado.Text="La cuenta no ha sido registrada";
         }
            
    }          
  
}
 

