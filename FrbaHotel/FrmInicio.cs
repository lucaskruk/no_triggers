using PalcoNet.AbmUsuario;
using PalcoNet.Login;
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

namespace PalcoNet
{


    public partial class FrmInicio : Form
    {
      
  

        public FrmInicio()
        {
            InitializeComponent();
            
        }

        void PantallaPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
      
            {
                //Application.Exit();
            }
        }

        private void IngresarClick(object sender, EventArgs e)
        {
            this.Hide();
            using (var logFrm = new frmLogin())
            {
                var result= logFrm.ShowDialog();
                if (result != DialogResult.OK)
                {
                    if (result == DialogResult.Cancel)
                    {
                        this.Show();
                    }
                    else
                    {
                        Application.Exit();
                    }
                }
                else { this.DialogResult = DialogResult.OK; this.Close(); }
            }
      
      
        }

        private void Registro_Click(object sender, EventArgs e)
        {
            this.Hide();
            FrmModUser frmMUser = new FrmModUser();
            frmMUser.toggleAltaOn();
            frmMUser.ShowDialog();
            this.Show();
        }
  
        private void PantallaPrincipal_Load(object sender, EventArgs e)
        {

           

        }
    }
}
