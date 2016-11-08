using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Acceso_BaseDatos;
using Clases_Roles;
using Clase_Usuario;
namespace AlquilaCocheras.Web.servicios
{
    /// <summary>
    /// Summary description for Cocheras
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Cocheras : System.Web.Services.WebService
    {
        TP_20162CEntities ctx = new TP_20162CEntities();

        [WebMethod]
        public List<cocherasDTO> obtenerCocheras(string ubicacion,DateTime? fechaInicio,DateTime? fechaFin)
        {
            List<Cocheras> lista = 
        }
    }
}
