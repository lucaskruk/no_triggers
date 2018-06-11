
using FrbaHotel.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Ir_a_pantalla_principal_Click(object sender, EventArgs e)
        {
            this.Hide();
            new FRBAhotel_pantallaPrincipal().Show();
        }

        private void Iniciar_Sesion_Click(object sender, EventArgs e)
        {
            string uservar=txtUsuario.Text;
            string passvar=txtPasswd.Text;

            int asd = Utils.validaUsuario(uservar, passvar);            
                if (asd==1){
                MessageBox.Show("Login OK");
                }
                else { MessageBox.Show("Login Erroneo"); }
            }
        }
    }

