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

namespace PalcoNet.Login
{
    public partial class Frm_Sel_Rol : Form
    {
        int roleSelected=0;
        

        public Frm_Sel_Rol()
        {
            InitializeComponent();
        }

        public int getID()
            {
                return this.roleSelected;
            }
 
        

        private void Frm_Sel_Rol_Load(object sender, EventArgs e)
        {
            //goodbuttonPressed = 0;
            lblUsuario.Text = string.Concat("Usuario: ", CommonVars.userLogged);
            string queryRol = string.Concat("spSelTablaFiltrada 'elgalego.vwUserRolesActivos','username','''", CommonVars.userLogged, "'''");
            DataTable lisRol = Utils.sptoTable(queryRol);
            
            
                cbxRol.DisplayMember = "rolNombre";
                cbxRol.ValueMember = "id_rol";
                cbxRol.DataSource = lisRol;
            
        }


        private void Frm_Sel_Rol_FormClosing(object sender, FormClosingEventArgs e)
        {
           // if (goodbuttonPressed == 0)
            {
              //  Application.Exit();
            }
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void cbxRol_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.roleSelected = Convert.ToInt32(cbxRol.SelectedValue);
            //MessageBox.Show(Convert.ToString(this.roleSelected));
        }

        private void seleccionaRol_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }
    }
}
