using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clase_Usuario;

namespace AlquilaCocheras.Web.propietarios
{
    public partial class cocheras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                
            }
        }

        protected void btnCrearCochera_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsPostBack)
            {
                String nombreFoto;

                String path = Server.MapPath("~/imagenes/");

                bool extensionOk = false;
                bool cargaImg = false;

                // VERIFICACION DE QUE SE HA CARGADO UN ARCHIVO
                if (fuFoto.HasFile)
                {
                    // EXTENSIONES PERMITIDAS
                    String fileExtension = System.IO.Path.GetExtension(fuFoto.FileName).ToLower();
                    String[] allowedExtensions = { ".gif", ".png", ".jpg" };

                    // VERIFICACION DE EXTENSIONES
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (allowedExtensions[i] == fileExtension)
                        {
                            extensionOk = true;
                        }
                    }

                    if (extensionOk)
                    {
                        try
                        {
                            string FileName = Guid.NewGuid().ToString() + fileExtension;
                            //imgEvento.PostedFile.SaveAs(path + imgEvento.FileName);
                            fuFoto.PostedFile.SaveAs(path + FileName);
                            nombreFoto = FileName;

                            Cochera cochera = new Cochera(
                                1,
                                txtUbicacion.Text,
                                txtFechaInicio.Text,
                                txtFechaFin.Text,
                                txtHorarioInicio.Text,
                                txtHorarioFin.Text,
                                txtDescripcion.Text,
                                nombreFoto,
                                txtLatitud.Text,
                                txtLongitud.Text,
                                txtPrecioHora.Text,
                                txtMetrosCuadrados.Text,
                                lbTipoVehiculo.SelectedValue
                            );

                                        if (cochera.cargarCochera((string)Session["usuario"]))
                                        {
                                            divResultado.Visible = true;
                                        }
                                        else
                                        {
                                            lblResultado.Text = "Ya existe una cochera en las mismas coordenadas y del mismo tipo de vehículo.";
                                            divResultado.Visible = true;
                                            txtUbicacion.Text = ""; // Si no limpiamos este input, latitud y longitud quedarán en blanco y el usuario podrá hacer postback sin ellos.
                                        }


                            cargaImg = true;
                        }
                        catch (Exception ex)
                        {
                            label26.Text = "No se ha podido cargar la imagen";
                        }
                    }
                    else
                    {
                        label26.Text = "Solo se admiten imágenes con extencion: JPG - PNG - GIF";
                    }
                }
            }
        }
    }
}