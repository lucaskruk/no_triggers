using FrbaHotel.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    class logHelper
    {

        internal static void aumentaContadorfallidos(string userN)
        {
            string queryAumentaCont = string.Concat("sp_incrementar_intentos_fallidos '", userN, "'");

            Utils.execSPnoReturn(queryAumentaCont);

        }

        internal static void reseteaContadorfallidos(string userN)
        {

            Utils.execSPnoReturn(string.Concat("sp_a_cero_intentos_fallidos '", userN, "'"));
        }


        internal static void deslogueaUsuario(string userN)
        {

            Utils.execSPnoReturn(string.Concat("sp_desloguea_user '", userN, "'"));
        }
        internal static void logueaUsuario(string userN, int idHotelSel)
        {
            Utils.execSPnoReturn(string.Concat("sp_set_hotel_logueado '", userN, "',", idHotelSel));
        }


        internal static int validaUsuario(string userN, string passwd)
        {

            string queryUserEnabled = string.Concat("fn_chequear_usuario_si_habilitado('", userN, "')");

            string queryPassOk = string.Concat("fn_validar_password('", userN, "','", passwd, "')");

            int result = 0;
            result = Utils.exeFunInt(queryUserEnabled);
            if (result == 1)
            {
                result = Utils.exeFunInt(queryPassOk);
            }
            else
            {
                MessageBox.Show("Usuario Deshabilitado, por favor contacte al administrador");
                Application.Exit();
            }
            return result;
        }


        internal static int getIDHotelUser(string userN)
        {
            int result = Utils.exeFunInt(string.Concat("fn_get_id_hotel_usuario ('", userN, "')"));
            return result;
        }
        internal static int checkMultirole(string userN)
        {
            int result = Utils.exeFunInt(string.Concat("fn_check_multirole ('", userN, "')"));
            return result;
        }
        internal static int userTieneHotel(string userN)
        {
            int result = Utils.exeFunInt(string.Concat("fn_usuario_tiene_hotel ('", userN, "')"));
            return result;
        }

    }
}
