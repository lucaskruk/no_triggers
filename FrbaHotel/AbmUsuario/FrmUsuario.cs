using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmUsuario
{
    public partial class FrmUsuario : Form
    {
        public FrmUsuario()
        {
            InitializeComponent();
        }

        private void FrmUsuario_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            FrmModUser frmAlta = new FrmModUser();
            frmAlta.toggleAltaOn();
            frmAlta.ShowDialog();
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {

        }

        private void btnModif_Click(object sender, EventArgs e)
        {

        }
    }
}
