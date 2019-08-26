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

namespace PalcoNet.AbmCliente
{
    public partial class FrmCliente : Form
    {
        
        public FrmCliente()
        {
            InitializeComponent();
        }

        private int llamarBuscador()
        
        {
            using (var frmCsearch = new FrmBuscador())
            {
                frmCsearch.setBuscar("vwCliente");
                frmCsearch.setCampos("id_cliente,Nombre,Apellido,Mail,FechaNac,TipoDocumento,NroDoc,Telefono,CUIL");
                frmCsearch.setCampo1("Nombre", "Nombre:");
                frmCsearch.setCampo2("Apellido", "Apellido: ");
                //frmCsearch.setSPcomboB("select * from [no_triggers].tipo_documento", "Tipo Doc.: ", "id_tipo_documento", "tipo_de_documento_nombre");
                frmCsearch.setCampo6("NroDoc", "Nro. Doc.: ");
                frmCsearch.setCampo5("Mail", "E-Mail: ");
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
            FrmModCli frmMCli = new FrmModCli();
            frmMCli.toggleAltaOff();
            frmMCli.setIdABM(llamarBuscador());
            if (frmMCli.getIdABM() != 0)
            {
                frmMCli.ShowDialog();
            }   
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {
            Utils.execSPnoReturn(String.Concat("spSetClienteBorrado ", Convert.ToString(llamarBuscador())));
            MessageBox.Show("Empresa eliminada con éxito");
        }

        private void btnAlta_Click(object sender, EventArgs e)
        {
            FrmModUser frmMUser = new FrmModUser();
            frmMUser.setTipoUser(2);
            frmMUser.toggleAltaOn();
            frmMUser.ShowDialog();
        }

        private void btnAtras_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
