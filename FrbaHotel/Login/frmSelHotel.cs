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

namespace FrbaHotel.Login
{
    public partial class Frm_Sel_Hotel : Form
    {
        int roleSelected=0;
        //int goodbuttonPressed = 0;

        public Frm_Sel_Hotel()
        {
            InitializeComponent();
        }

        private void listBx_hotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBx_hotel.SelectedItem != null)
            {
                string idHotel = listBx_hotel.SelectedValue.ToString();
                CommonVars.idHotelSeleccionado = Convert.ToInt32(idHotel);
                
                
            }
            
        }

        private void Frm_Sel_Hotel_Load(object sender, EventArgs e)
        {
            //goodbuttonPressed = 0;
            lblUsuario.Text = string.Concat("Usuario: ", CommonVars.userLogged);
            string queryHotel = string.Concat("sp_lista_hotel_usuario '", CommonVars.userLogged,"'");
            string queryRol = string.Concat("sp_lista_rol_usuario '", CommonVars.userLogged, "'");
            DataTable lisHotel=Utils.sptoTable(queryHotel);
            DataTable lisRol = Utils.sptoTable(queryRol);
            
            if (lisHotel.Rows.Count == 1) {
                listBx_hotel.Visible = false;
                lblHotel.Visible = false;
            }
            else
            {
                listBx_hotel.DisplayMember = "hotel_nombre";
                listBx_hotel.ValueMember = "id_hotel";
                listBx_hotel.DataSource = lisHotel;
            }
            if (lisRol.Rows.Count == 1) {
                cbxRol.Visible = false;
                lblRol.Visible = false;
            }
            else
            {
                cbxRol.DisplayMember = "rol_nombre";
                cbxRol.ValueMember = "id_rol";
                cbxRol.DataSource = lisRol;
            }
        }

        private void ingresar_hotel_deseado_Click(object sender, EventArgs e)
        {
            if (listBx_hotel.Items.Count > 1)
            {
                CommonVars.idHotelSeleccionado = Convert.ToInt32(listBx_hotel.SelectedValue.ToString());
            }
                logHelper.logueaUsuario(CommonVars.userLogged, CommonVars.idHotelSeleccionado);
                if (cbxRol.Items.Count > 1)
                {
                    Utils.execSPnoReturn(string.Concat("sp_set_usuario_rol_asignado ", Convert.ToString(this.roleSelected), ",'", CommonVars.userLogged, "'"));
                } 
                //this.Visible = false;
                //FrmMenu frmMenu = new FrmMenu();
                //frmMenu.Show();
               // goodbuttonPressed = 1;
                this.DialogResult = DialogResult.OK;
                this.Close();
            
        }

        private void Frm_Sel_Hotel_FormClosing(object sender, FormClosingEventArgs e)
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
    }
}
