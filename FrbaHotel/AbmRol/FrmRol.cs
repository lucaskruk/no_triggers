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
            dtGridRoles.AutoResizeColumns();
        }

        private void btnMod_Click(object sender, EventArgs e)
        {   string idFromGrid= dtGridRoles.CurrentRow.Cells[0].Value.ToString();
            int idRol = Convert.ToInt32(idFromGrid);
            //MessageBox.Show(String.Concat("fila elegida ", Convert.ToString(idRol)));
            FrmModifRol frmMrol = new FrmModifRol();
            //frmMrol.ReloadForm1 += Reload;
            frmMrol.setidRol(idRol);
            frmMrol.Show();
            this.Close();
        }
    }
}
