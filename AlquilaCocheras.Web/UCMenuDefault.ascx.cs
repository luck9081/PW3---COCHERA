using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases_Roles;

namespace AlquilaCocheras.Web
{
    public partial class defaultUcMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ESTABLECER EL MENU DE NAVEGACION PARA CADA TIPO DE USUARIO (nota: este método impide que el codigo ocultado llegue al browser del cliente)

            if (Session["usuario"] != null)
            {
                Usuario us = (Usuario)Session["usuario"];
               
                switch (us.Tipo)
                {
                    case "1":
                        menuCliente.Visible = true;     // Si el tipo es "1", entonces mostramos Cliente
                        menuAnonimo.Visible = false;    // y ocultamos Anonimo

                        
                        if (Request.QueryString["pestaña"] == "cliReservar")
                        {
                            cliReservar.Attributes.Add("class", "active");
                            cliReservas.Attributes.CssStyle.Clear();
                        }
                        else
                        {
                            cliReservas.Attributes.Add("class", "active");
                            cliReservar.Attributes.CssStyle.Clear();
                        }
                        break;

                    case "2":
                        menuPropietario.Visible = true;     // Si el tipo es "2", entonces mostramos Propietario
                        menuAnonimo.Visible = false;        // y ocultamos Anonimo

                        if (Request.QueryString["pestaña"] == "propNuevaCochera")
                        {
                            propNuevaCochera.Attributes.Add("class", "active");
                            propReservas.Attributes.CssStyle.Clear();
                            propPerfil.Attributes.CssStyle.Clear();
                        }
                        else if (Request.QueryString["pestaña"] == "propReservas")
                        {
                            propNuevaCochera.Attributes.CssStyle.Clear();
                            propReservas.Attributes.Add("class", "active");
                            propPerfil.Attributes.CssStyle.Clear();
                        }
                        else
                        {
                            propNuevaCochera.Attributes.CssStyle.Clear();
                            propReservas.Attributes.CssStyle.Clear();
                            propPerfil.Attributes.Add("class", "active");
                        }
                        break;
                }
            }
        }
    }
}