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

namespace FrbaHotel.AbmCliente
{
    public partial class FrmCliente : Form
    {
        int idCliente=0;
        public FrmCliente()
        {
            InitializeComponent();
        }

        private void llamarBuscador()
        
        {
            using (var frmCsearch = new FrmBuscador())
            {
                frmCsearch.setBuscar("cliente");
                frmCsearch.setCampos("id_cliente,cliente_estado,cliente_nombre,cliente_apellido,cliente_email,cliente_fecha_nacimiento,id_tipo_documento,cliente_numero_documento,cliente_telefono,id_direccion,id_pais");
                frmCsearch.setCampo1("cliente_nombre", "Nombre:");
                frmCsearch.setCampo2("cliente_apellido", "Apellido: ");
                frmCsearch.setSPcomboB("select * from [no_triggers].tipo_documento", "Tipo Doc.: ", "id_tipo_documento", "tipo_de_documento_nombre");
                frmCsearch.setCampo6("cliente_numero_documento", "Nro. Doc.: ");
                frmCsearch.setCampo5("cliente_email", "E-Mail: ");
                var result = frmCsearch.ShowDialog();
                if (result == DialogResult.OK)
                {
                    this.idCliente = frmCsearch.getID();
                }
            }
        }


        private void btnModif_Click(object sender, EventArgs e)
        {
            llamarBuscador();    
        }
    }
}
