using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace FrbaHotel.Utility
{
    public class Utils
    {
        static string con_str = Properties.Settings.Default.ConnectionString.ToString();


        /// <summary>
        /// Metodos genericos para acceder a la base de datos
        /// </summary>
        /// <param name="query"></param>

        //Si es un SP los parametros van sin parentesis y separados por comas
        internal static void execSPnoReturn(string query)
        {
            SqlConnection conex = new SqlConnection(con_str);
            string runSP = string.Concat("exec [no_triggers].", query,";");
            SqlCommand cmdExecSP = new SqlCommand(runSP, conex);

            try {
                conex.Open();

                cmdExecSP.ExecuteNonQuery();
                conex.Close();
            }
            catch
            {
                MessageBox.Show("Error de ejecucion SP SQL");
                MessageBox.Show(runSP);
            }


        }



        internal static DataTable sptoTable(string query)
        {
            DataTable result = new DataTable();
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("exec [no_triggers].", query, ";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            SqlDataAdapter adap = new SqlDataAdapter(cmdRunFN);
            adap.Fill(result);

            return result;
        
        }

        // en una funcion los parametros se pasan entre parentesis y separados por comas
        internal static string exeFunString(string query)
        {
            string result = "";
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select [no_triggers].", query, ";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            try
            {
                conex.Open();

                result = Convert.ToString(cmdRunFN.ExecuteScalar());
                conex.Close();

            }

            catch
            {
                MessageBox.Show("Error llamado a funcion");
                MessageBox.Show(Properties.Settings.Default.ConnectionString.ToString());
                MessageBox.Show(runFN);
            }
            return result;

        }
       internal static int exeFunInt(string query)
        {
            int result=-1;
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select [no_triggers].",query,";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            try
            {
                conex.Open();

                result = Convert.ToInt32(cmdRunFN.ExecuteScalar());
                conex.Close();
                                            
            }

            catch
            {
                MessageBox.Show("Error llamado a funcion");
                MessageBox.Show(Properties.Settings.Default.ConnectionString.ToString());
                MessageBox.Show(runFN);
            }
            return result;
        }

       /// <summary>
       /// A partir de aca tenemos los metodos que aplican los genericos creados mas arriba
       /// </summary>
       /// <param name="nombreABM"></param>
       /// <returns></returns>
        
        internal static int checkAccesoABM(string nombreABM)
       {
           int result = 0;
           string qHabil = string.Concat("fn_abm_Habilitado ('",CommonVars.userLogged,"','",nombreABM,"');");
           result = exeFunInt(qHabil);
           return result;
       }
       internal static string getNombreHotel(int hotelid)
       {
           string result = "";
           string qHotel = string.Concat("fn_get_hotel_nombre (", Convert.ToString(hotelid), ");");
           result = exeFunString(qHotel);
           return result;
       }
       internal static void aumentaContadorfallidos(string userN)
       {
           string queryAumentaCont = string.Concat("sp_incrementar_intentos_fallidos '", userN, "'");

           execSPnoReturn(queryAumentaCont);

       }

       internal static void reseteaContadorfallidos(string userN)
       {

           execSPnoReturn(string.Concat("sp_a_cero_intentos_fallidos '", userN, "'"));
       }


       internal static void deslogueaUsuario(string userN)
       {

           execSPnoReturn(string.Concat("sp_desloguea_user '", userN, "'"));
       }
       internal static void logueaUsuario(string userN, int idHotelSel)
       {
           execSPnoReturn(string.Concat("sp_set_hotel_logueado '", userN,"',",idHotelSel));
       }


        internal static int validaUsuario(string userN, string passwd)
        {

            string queryUserEnabled = string.Concat("fn_chequear_usuario_si_habilitado('", userN, "')");

            string queryPassOk = string.Concat("fn_validar_password('", userN,"','", passwd, "')");

            int result = 0;
            result = exeFunInt(queryUserEnabled);
            if (result == 1)
               {
                   result = exeFunInt(queryPassOk);
               }
            else 
              { MessageBox.Show("Usuario Deshabilitado, por favor contacte al administrador");
               Application.Exit();
              }    
            return result;
        }


        internal static int getIDHotelUser(string userN)
        {
            int result = exeFunInt(string.Concat("fn_get_id_hotel_usuario ('", userN, "')"));
            return result;
        }
        
        internal static int validaUsuario()
        {
            throw new NotImplementedException();
        }

        internal static DataTable getListadoRoles()
        {
            DataTable result = new DataTable();
            string sql = "sp_rol_listado";
            result = sptoTable(sql);
            return result;
        }
    }
}
