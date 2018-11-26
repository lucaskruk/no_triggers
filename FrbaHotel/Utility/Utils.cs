using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Configuration;

namespace PalcoNet.Utility
{
    public class Utils
    {
        static string con_str = ConfigurationSettings.AppSettings["ConnectionString"];
        
        internal static bool IsValidEmail(string email)
        


        
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }


        /// <summary>
        /// Metodos genericos para acceder a la base de datos
        /// </summary>
        /// <param name="query"></param>

        //Si es un SP los parametros van sin parentesis y separados por comas
        internal static void execSPnoReturn(string query)
        {
            SqlConnection conex = new SqlConnection(con_str);
            string runSP = string.Concat("exec elgalego.", query,";");
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
            string runFN = string.Concat("exec elgalego.", query, ";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            SqlDataAdapter adap = new SqlDataAdapter(cmdRunFN);
            adap.Fill(result);

            return result;
        
        }

        internal static DataTable querytop100Table(string query, string fields)
        {
            if (fields == null || fields == "") { fields = "*"; }
            DataTable result = new DataTable();
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select top 100", fields, " from elgalego.", query, ";");
            SqlCommand cmdRunFN = new SqlCommand(runFN, conex);
            SqlDataAdapter adap = new SqlDataAdapter(cmdRunFN);
            try
            {
                adap.Fill(result);
            }
            catch (Exception e)
            {
                MessageBox.Show(string.Concat("Error en querytotable. Query: ", runFN, "Error: ", e.ToString()));
            }

            return result;

        }
        internal static DataTable querytoTable(string query,string fields)
        {
            if (fields == null || fields == "") { fields = "*"; }
            DataTable result = new DataTable();
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select ", fields, " from elgalego.", query, ";");
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
        internal static DataTable querytoTable(string query)
        {
            
            DataTable result = new DataTable();
            SqlConnection conex = new SqlConnection(con_str);
            
            SqlCommand cmdRunFN = new SqlCommand(query, conex);
            SqlDataAdapter adap = new SqlDataAdapter(cmdRunFN);
            try
            {
                adap.Fill(result);
            }
            catch (Exception e)
            {
                MessageBox.Show(string.Concat("Error en querytotable. Query: ", query, "Error: ", e.ToString()));
            }

            return result;

        }
    
        // en una funcion los parametros se pasan entre parentesis y separados por comas
        internal static string exeFunString(string query)
        {
            string result = "";
            SqlConnection conex = new SqlConnection(con_str);
            string runFN = string.Concat("select elgalego.", query, ";");
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
            string runFN = string.Concat("select elgalego.", query, ";");
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
       public struct Parametros
       {
           public string nombrePar;
           public string valorPar;
       }
        // no se me ocurrio otra forma de mandar la lista de parametros sin crear una clase para este metodo
       internal static int exeSPInt(string spName, List<Parametros> parameters)
       {
           
           SqlConnection conex = new SqlConnection(con_str);
           string runSP = string.Concat("elgalego.", spName);
           
           using (SqlCommand cmd = conex.CreateCommand())
           {
               int result;
               cmd.CommandText = runSP;
               cmd.CommandType = CommandType.StoredProcedure;

               foreach (Parametros par in parameters)
               {
                   cmd.Parameters.AddWithValue(par.nombrePar, par.valorPar);
               }

               var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
               returnParameter.Direction = ParameterDirection.ReturnValue;
               string res;
               conex.Open();
               cmd.ExecuteNonQuery();
               res=returnParameter.Value.ToString();
               Int32.TryParse(res, out result);
               return result;
           }
       }

       /// <summary>
       /// A partir de aca tenemos los metodos que aplican los genericos creados mas arriba
       /// </summary>
       /// <param name="nombreABM"></param>
       /// <returns></returns>
        
        internal static int checkAccesoABM(string nombreABM)
       {
           int result = 0;
           string qHabil = string.Concat("fnABMHabilitado ('", CommonVars.userLogged, "','", nombreABM, "');");
           result = exeFunInt(qHabil);
           return result;
       }

       
    }
}
