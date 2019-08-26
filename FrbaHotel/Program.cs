
using PalcoNet.Utility;
using System;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Windows.Forms;
using PalcoNet.Login;
using System.Configuration;
using System.Globalization;

namespace PalcoNet
{
    static class Program
    {
        
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            if (DateTime.TryParseExact(CommonVars.fecha, "dd/MM/yyyy", null, DateTimeStyles.None, out CommonVars.todayDate))
            {}
            else {
                MessageBox.Show("Fecha en el App.Config mal ingresada");
                Application.Exit();
            }
            
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmMenu());
        }
    }

    public static class CommonVars
    {
        public static int idHotelSeleccionado;
        public static string userLogged;
        public static string fecha = ConfigurationSettings.AppSettings["Date"];
        public static DateTime todayDate;
    }
}
