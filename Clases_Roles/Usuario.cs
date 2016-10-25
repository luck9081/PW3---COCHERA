using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases_Roles
{
    public class Usuario
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Contrasenia { get; set; }
        public string Tipo { get; set; }

        public static Dictionary<string, Usuario> usuarios = new Dictionary<string, Usuario>();

        public void agregarUsuario(Usuario us)
        {
            usuarios.Add(us.Email, us);
        }

        public bool encontrarUsuario(string email)
        {
            return usuarios.ContainsKey(email);
        }

        public Usuario obtenerUsuario(string email)
        {
            return usuarios[email];
        }

        public bool CompararContraseñas(string email, string pass)
        {
            if (usuarios[email].Contrasenia == pass)
                return true;
            else
                return false;
        }

    }
}
