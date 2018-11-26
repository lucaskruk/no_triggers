using PalcoNet.Utility;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PalcoNet;

namespace PalcoNet.Login
{
    class logHelper
    {

        


    
        internal static int login(string userN, string passwd)
        {
            
            string queryUserEnabled = string.Concat("fnUserEnabled('", userN, "')");
            
            string spLogin = "spLogin";

            PalcoNet.Utility.Utils.Parametros p1 = new PalcoNet.Utility.Utils.Parametros();
            p1.nombrePar = "usuario";
            p1.valorPar = userN;
            PalcoNet.Utility.Utils.Parametros p2 = new PalcoNet.Utility.Utils.Parametros();
            p2.nombrePar = "password";
            p2.valorPar = passwd;

            List<PalcoNet.Utility.Utils.Parametros> lisPar = new List<PalcoNet.Utility.Utils.Parametros>();
            lisPar.Add(p1);
            lisPar.Add(p2);
            int result = 0;
            result = Utils.exeFunInt(queryUserEnabled);
            if (result == 1)
            {
                result = Utils.exeSPInt(spLogin,lisPar);
            }
            else
            {
                MessageBox.Show("Usuario Deshabilitado, por favor contacte al administrador");
                Application.Exit();
            }
            return result;
        }



    }
}
