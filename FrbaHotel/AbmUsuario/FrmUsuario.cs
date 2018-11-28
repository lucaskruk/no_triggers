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

namespace PalcoNet.AbmUsuario
{
    public partial class FrmUsuario : Form
    {
        
        public FrmUsuario()
        {
            InitializeComponent();
        }

        private int llamarBuscador()
        
        {
            using (var frmCsearch = new FrmBuscador())
            {
                frmCsearch.setBuscar("usuario");
                frmCsearch.setCampos("id_usuario,username");
                frmCsearch.setCampo1("username", "Usuario: ");
                var result = frmCsearch.ShowDialog();
                if (result == DialogResult.OK)
                {
                    return frmCsearch.getID();
                }
                else return 0;
            }
        }


        private void btnModif_Click(object sender, EventArgs e)
        {
            FrmModUser frmMUser = new FrmModUser();
            frmMUser.toggleAltaOff();
            frmMUser.setIdUser(llamarBuscador());
            if (frmMUser.getIdUser() != 0)
            {
                frmMUser.ShowDialog();
            }
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {
            Utils.execSPnoReturn(String.Concat("sp_set_user_estado ", Convert.ToString(llamarBuscador()),",0")); 
        }

        private void FrmUsuario_Load(object sender, EventArgs e)
        {

        }


        private void btnAtras_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAlta_Click_1(object sender, EventArgs e)
        {
            FrmModUser frmMUser = new FrmModUser();
            frmMUser.toggleAltaOn();
            frmMUser.ShowDialog();
        }
    }
}
