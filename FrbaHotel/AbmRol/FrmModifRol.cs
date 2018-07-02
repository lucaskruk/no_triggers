using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmRol
{
    public partial class FrmModifRol : Form
    {
        int idRol;

        public FrmModifRol()
        {
            InitializeComponent();
        }

        public void setidRol(int id)
        {
            this.idRol = id;
        }
        public int getidRol()
        {
            return this.idRol;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void FrmModifRol_Load(object sender, EventArgs e)
        {
            lblRolId.Text = string.Concat("ID Rol: ", Convert.ToString(this.idRol));

        }

    
    }
}
