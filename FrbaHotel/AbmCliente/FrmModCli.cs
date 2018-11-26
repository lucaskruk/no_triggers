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
    public partial class FrmModCli : Form
    {
        bool esAlta=false;

        public void SetAlta(bool valor){
        this.esAlta=valor;
        }

        public FrmModCli()
        {
            InitializeComponent();
        }

        private void FrmModCli_Load(object sender, EventArgs e)
        {
            //dtFNac.MaxDate = DateTime.Today.AddDays(-1825); ;
            DataTable lisTdoc = Utils.sptoTable("sp_lis_tipo_dni");
          //  cbxtDoc.ValueMember = "id_tipo_documento";
           // cbxtDoc.DisplayMember = "tipo_de_documento_nombre";
           // cbxtDoc.DataSource = lisTdoc;
            
            if (esAlta) {

                this.Text = "Alta de cliente";
           //     lblID.Visible=false;

            }
        }
    }
}
