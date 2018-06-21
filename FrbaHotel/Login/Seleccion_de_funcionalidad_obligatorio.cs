using FrbaHotel.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class FrmMenu : Form
    {
        public FrmMenu()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            Utils.deslogueaUsuario(CommonVars.userLogged);
            Application.Exit();
            // Autosave and clear up ressources
        }
  
    }
}
