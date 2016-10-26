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
    public partial class defaultUcMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ESTABLECER EL MENU DE NAVEGACION PARA CADA TIPO DE USUARIO (nota: este método impide que el codigo ocultado llegue al browser del cliente)

            if (Session["usuario"] != null)
            {
                string email = Session["usuario"].ToString();
                TP_20162CEntities ctx = new TP_20162CEntities();
                Usuario us = new Usuario(ctx);
                Usuarios user = new Usuarios();
                user = us.obtenerUsuario(email);
                if (user.Perfil == 1)
                {
                    menuCliente.Visible = true;     // Si el tipo es "1", entonces mostramos Cliente
                    menuAnonimo.Visible = false;    // y ocultamos Anonimo
                }
                else if (user.Perfil == 2)
                {
                    menuPropietario.Visible = true;     // Si el tipo es "2", entonces mostramos Propietario
                    menuAnonimo.Visible = false;        // y ocultamos Anonimo
                }

                switch (Request.QueryString["pestaña"])     // Con el switch, añadimos o eliminamos clase de estilo "active" según correspona
                {
                    case "cliReservar":
                        cliReservar.Attributes.Add("class", "active");
                        cliReservas.Attributes.CssStyle.Clear();
                        break;

                    case "cliReservas":
                        cliReservar.Attributes.CssStyle.Clear();
                        cliReservas.Attributes.Add("class", "active");
                        break;

                    case "propNuevaCochera":
                        propNuevaCochera.Attributes.Add("class", "active");
                        propReservas.Attributes.CssStyle.Clear();
                        propPerfil.Attributes.CssStyle.Clear();
                        break;

                    case "propReservas":
                        propNuevaCochera.Attributes.CssStyle.Clear();
                        propReservas.Attributes.Add("class", "active");
                        propPerfil.Attributes.CssStyle.Clear();
                        break;

                    case "propPerfil":
                        propNuevaCochera.Attributes.CssStyle.Clear();
                        propReservas.Attributes.CssStyle.Clear();
                        propPerfil.Attributes.Add("class", "active");
                        break;
                }
            }
        }
    }
}