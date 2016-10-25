using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_BaseDatos;

namespace Clases_Roles
{
    public class Usuario
    {
        TP_20162CEntities ctx;
        public Usuario(TP_20162CEntities contexto)
        {
            ctx = contexto;
        }
        public void agregarUsuario(Usuarios us)
        {
            ctx.Usuarios.Add(us);
            ctx.SaveChanges();
        }

        public bool encontrarMail(string mail)
        {
            Usuarios resultado = (from u in ctx.Usuarios
                                  where u.Email == mail
                                  select u).FirstOrDefault();
            if (resultado != null)
                return true;
            else
                return false;
           
        
        }

        /* ------------------------------ BÚSQUEDA DE USUARIO ------------------------------ */
        // Por ID
        public Usuarios obtenerUsuario(int id)
        {
            Usuarios usuario = ctx.Usuarios.First(u => u.IdUsuario == id);
            return usuario;
        }
        //Por Email
        public Usuarios obtenerUsuario(string mail)
        {
            Usuarios usuario = ctx.Usuarios.First(u => u.Email == mail);
            return usuario;
        }
        public bool compararContraseña(string mail, string pass)
        {
            Usuarios usuario = obtenerUsuario(mail);
            if (usuario.Contrasenia == pass)
                return true;
            else
                return false;

        }
    }
}
