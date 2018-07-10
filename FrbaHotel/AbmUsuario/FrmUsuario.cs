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

namespace FrbaHotel.AbmUsuario
{
    public partial class FrmUsuario : Form
    {
        int idUsuario = 0;

        public FrmUsuario()
        {
            InitializeComponent();
        }

        private void FrmUsuario_Load(object sender, EventArgs e)
        {
            btnBaja.Enabled = false;
            btnModif.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FrmModUser frmAlta = new FrmModUser();
            frmAlta.toggleAltaOn();
            frmAlta.ShowDialog();
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {

        }

        private void btnModif_Click(object sender, EventArgs e)
        {
            if (this.idUsuario != 0)
            {
                FrmModUser frmModif = new FrmModUser();
                frmModif.toggleAltaOff();
                frmModif.setIdUser(this.idUsuario);
                frmModif.ShowDialog();
                refrescarGrids();
            }
            else { MessageBox.Show("Debe buscar un usuario para poder modificar."); }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            using (var frmUsearch = new FrmBuscador())
            {
                frmUsearch.setBuscar("usuario");
                frmUsearch.setCampos("id_usuario,usuario_username,usuario_nombre,usuario_apellido,usuario_email,usuario_fecha_nacimiento,id_tipo_documento,usuario_numero_documento,usuario_telefono,usuario_habilitado,usuario_last_activity");
                frmUsearch.setCampo1("usuario_username", "Nombre de Usuario");
                frmUsearch.setCampo2("usuario_apellido", "Apellido");
                var result = frmUsearch.ShowDialog();
                if (result == DialogResult.OK) 
                {
                    this.idUsuario = frmUsearch.getID();
                    lblUserId.Text = string.Concat("ID Usuario: ", Convert.ToString(this.idUsuario));

                    refrescarGrids();
                    btnModif.Enabled = true;
                    btnBaja.Enabled = true;
                }
            }
            
        }
        private void refrescarGrids()
        {
            DataTable usersel = Utils.sptoTable(string.Concat("sp_lis_usuario ", Convert.ToString(this.idUsuario)));
            dGridUser.DataSource = usersel;
            dGridUser.AutoResizeColumns();

            DataTable userRoles = Utils.sptoTable(string.Concat("sp_lis_usu_roles ", Convert.ToString(this.idUsuario)));
            dGridRoles.DataSource = userRoles;
            dGridRoles.AutoResizeColumns();

            DataTable userHotel = Utils.sptoTable(string.Concat("sp_lis_usu_id_hotel ", Convert.ToString(this.idUsuario)));
            dGridHoteles.DataSource = userHotel;
            dGridHoteles.AutoResizeColumns();
        }
    }
}
