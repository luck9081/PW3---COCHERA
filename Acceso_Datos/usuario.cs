//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Acceso_Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class usuario
    {
        public usuario()
        {
            this.cochera = new HashSet<cochera>();
            this.puntuacion = new HashSet<puntuacion>();
            this.reserva = new HashSet<reserva>();
        }
    
        public int id_usuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string mail { get; set; }
        public Nullable<int> tipo { get; set; }
        public string pass { get; set; }
    
        public virtual ICollection<cochera> cochera { get; set; }
        public virtual ICollection<puntuacion> puntuacion { get; set; }
        public virtual ICollection<reserva> reserva { get; set; }
    }
}
