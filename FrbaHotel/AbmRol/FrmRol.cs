using PalcoNet.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PalcoNet.AbmRol
{
    public partial class FrmRol : Form
    {
        public FrmRol()
        {
            InitializeComponent();
        }

        internal static DataTable getListadoRoles()
        {
            DataTable result = new DataTable();
            string sql = "spRolListado";
            result = Utils.sptoTable(sql);
            return result;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            DataTable tblRoles =getListadoRoles();
            dtGridRoles.DataSource = tblRoles;
            dtGridRoles.AutoResizeColumns();
            int i = 0;
            foreach (DataGridViewColumn c in dtGridRoles.Columns)
            {
                i += c.Width;
            }
            dtGridRoles.Width = i + dtGridRoles.RowHeadersWidth + 2;
            dtGridRoles.Height = dtGridRoles.GetRowDisplayRectangle(dtGridRoles.NewRowIndex, true).Bottom + dtGridRoles.GetRowDisplayRectangle(dtGridRoles.NewRowIndex, false).Height;
        }

        private void btnMod_Click(object sender, EventArgs e)
        {   string idFromGrid= dtGridRoles.CurrentRow.Cells[0].Value.ToString();
            int idRol = Convert.ToInt32(idFromGrid);
            //MessageBox.Show(String.Concat("fila elegida ", Convert.ToString(idRol)));
            FrmModifRol frmMrol = new FrmModifRol();
            //frmMrol.ReloadForm1 += Reload;
            frmMrol.setidRol(idRol);
            frmMrol.ShowDialog();
            DataTable tblRoles = getListadoRoles();
            dtGridRoles.DataSource = tblRoles;
            dtGridRoles.AutoResizeColumns();
            //this.Close();
        }

        private void btnCrear_Click(object sender, EventArgs e)
        {
            FrmModifRol frmMrol = new FrmModifRol();
            //frmMrol.ReloadForm1 += Reload;
            frmMrol.setidRol(-1);
            frmMrol.ShowDialog();
            DataTable tblRoles = getListadoRoles();
            dtGridRoles.DataSource = tblRoles;
            dtGridRoles.AutoResizeColumns();
            //this.Close();
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            string idFromGrid = dtGridRoles.CurrentRow.Cells[0].Value.ToString();
            int idRol = Convert.ToInt32(idFromGrid);
            Utils.execSPnoReturn(string.Concat("sp_set_rol_estado ",Convert.ToString(idRol),",0"));
            DataTable tblRoles = getListadoRoles();
            dtGridRoles.DataSource = tblRoles;
            dtGridRoles.AutoResizeColumns();
        }
    }
}
