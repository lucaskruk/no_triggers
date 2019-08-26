using PalcoNet.AbmUsuario;
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

namespace PalcoNet.AbmEmpresa
{
    public partial class FrmEmpresa : Form
    {
        
        public FrmEmpresa()
        {
            InitializeComponent();
        }

        private int llamarBuscador()
        
        {
            using (var frmCsearch = new FrmBuscador())
            {
                frmCsearch.setBuscar("vwEmpresa");
                frmCsearch.setCampos("id_Empresa,RazonSocial,Mail,CUIT");
                frmCsearch.setCampo1("RazonSocial", "Razon Social:");
                //frmCsearch.setCampo2("cliente_apellido", "Apellido: ");
                //frmCsearch.setSPcomboB("select * from [no_triggers].tipo_documento", "Tipo Doc.: ", "id_tipo_documento", "tipo_de_documento_nombre");
                frmCsearch.setCampo6("CUIT", "CUIT: ");
                frmCsearch.setCampo5("mail", "E-Mail: ");
                var result = frmCsearch.ShowDialog();
                if (result == DialogResult.OK)
                {
                    return frmCsearch.getID();
                }
                else { return 0; }
            }
        }


        private void btnModif_Click(object sender, EventArgs e)
        {
            FrmModEmp frmMemp = new FrmModEmp();
            frmMemp.toggleAltaOff();
            frmMemp.setIdABM (llamarBuscador());
            if (frmMemp.getIdABM() != 0)
            {
                frmMemp.ShowDialog();
            }
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {
            Utils.execSPnoReturn(String.Concat("spSetEmpresaEstado ", Convert.ToString(llamarBuscador()), ",0"));
            MessageBox.Show("Empresa eliminada con éxito");
        }

        private void btnAtras_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAlta_Click(object sender, EventArgs e)
        {
            FrmModUser frmMUser = new FrmModUser();
            frmMUser.setTipoUser(1);
            frmMUser.toggleAltaOn();
            frmMUser.ShowDialog();
        }
    }
}
