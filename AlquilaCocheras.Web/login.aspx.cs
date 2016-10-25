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
                if (user.Perfil == 1 & flag) //TIPO 1 ES CLIENTE
                 Response.Redirect("/clientes/reservar.aspx", false);
                else if (user.Perfil == 2 & flag) // TIPO 2 ES PROPIETARIO
                  Response.Redirect("/propietarios/reservas.aspx", false);
                else
                    lblResultado.Text="La contraseña no coincide";

                HttpContext.Current.Session["usuario"] = user.Email;
            }
            else 
                lblResultado.Text="La cuenta no ha sido registrada";
         }
            
    }          
  
}
 

