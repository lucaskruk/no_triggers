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
    public partial class FrmModUser : Form
    {
        int esAlta = 0;
        public void toggleAltaOn()
        {
            this.esAlta = 1;
        }
        public void toggleAltaOff()
        {
            this.esAlta = 0;
        }
        public FrmModUser()
        {
            InitializeComponent();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnAgregaRol_Click(object sender, EventArgs e)
        {

        }

        private void btnAgregaHotel_Click(object sender, EventArgs e)
        {

        }

        private void cbxAgregaHotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbxAgregaRol_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lbxAgregaHotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbxTdoc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnSel_Click(object sender, EventArgs e)
        {

        }


        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (this.esAlta == 1)
            {
            //alta de usuario
            }
            else 
            { 
                //hace la modificacion de usuario
            }
        }

        private void chkActive_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void lblTel_Click(object sender, EventArgs e)
        {

        }

        private void lblNDoc_Click(object sender, EventArgs e)
        {

        }

        private void lblTipo_Click(object sender, EventArgs e)
        {

        }

        private void lblNac_Click(object sender, EventArgs e)
        {

        }

        private void lblMail_Click(object sender, EventArgs e)
        {

        }

        private void FrmModUser_Load(object sender, EventArgs e)
        {
            if (this.esAlta == 1)
            {
                this.Text = "Alta de Usuario";
                btnQuitaHotel.Visible = false;
                btnQuitaRol.Visible = false;
                lbxQuitaHotel.Visible = false;
                lbxQuitaRol.Visible = false;
                cbxQuitaHotel.Visible = false;
                cbxQuitaRol.Visible = false;

            }
            else
            { 
                this.Text="Modificación de Usuario";
            }
        }
    }
}
