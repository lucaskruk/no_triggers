﻿
using FrbaHotel.Utility;
using System;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Windows.Forms;
using FrbaHotel.Login;
namespace FrbaHotel
{
    static class Program
    {
        
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FrmMenu());
        }
    }

    static class CommonVars
    {
        public static int idHotelSeleccionado;
        public static string userLogged;
        

        
    }
}
