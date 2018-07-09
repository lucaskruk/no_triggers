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

        internal static DataTable querytoTable(string query,string fields)
        {
            if (fields == null || fields == "") { fields = "*"; }
            DataTable result = new DataTable();
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select ",fields, " from [no_triggers].", query, ";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            SqlDataAdapter adap = new SqlDataAdapter(cmdRunFN);
            try
            {
                adap.Fill(result);
            }
            catch (Exception e) {
                MessageBox.Show(string.Concat("Error en querytotable. Query: ",runFN, "Error: ", e.ToString()));
            }

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
       
    }
}
