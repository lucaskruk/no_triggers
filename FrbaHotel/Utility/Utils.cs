using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace FrbaHotel.Utility
{
    public class Utils
    {
        static string con_str = "Data Source=localhost\\sqlserver2012;Initial Catalog=GD1C2018;Persist Security Info=True;User ID=gdhotel2018;Password=gd2018";


        internal static int validaUsuario(string userN, string passwd)
        {
            SqlConnection conex = new SqlConnection(con_str);

            string query = string.Concat("select [no_triggers].fn_validar_password('", userN,"','", passwd, "');");

            //esta para debuggear
           // MessageBox.Show(query);

            SqlCommand cmdValidaUser = new SqlCommand(query, conex);

            int result = 0;
            try
            {
                conex.Open();

               result = Convert.ToInt32(cmdValidaUser.ExecuteScalar());
            }
            
                catch {
                    MessageBox.Show("Error");
            }
            return result;

        }


        internal static int validaUsuario()
        {
            throw new NotImplementedException();
        }
    }
}
