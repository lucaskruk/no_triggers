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

namespace FrbaHotel.AbmRol
{
    public partial class FrmRol : Form
    {
        public FrmRol()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DataTable tblRoles =Utils.getListadoRoles();
            dtGridRoles.DataSource = tblRoles;
        }

        private void btnMod_Click(object sender, EventArgs e)
        {
            int idRol = dtGridRoles.CurrentRow.Index+1;
            //MessageBox.Show(String.Concat("fila elegida ", Convert.ToString(idRol)));
            FrmModifRol frmMrol = new FrmModifRol();
            frmMrol.setidRol(idRol);
            frmMrol.Show();
        }
    }
}
