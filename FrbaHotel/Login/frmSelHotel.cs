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
        public Frm_Sel_Hotel()
        {
            InitializeComponent();
        }

        private void listBx_hotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBx_hotel.SelectedItem != null)
            {
                string idHotel = listBx_hotel.SelectedItem.ToString();
                int idSel;
                if (Int32.TryParse(idHotel, out idSel))
                {
                    CommonVars.idHotelSeleccionado = idSel;
                }
                
            }
            
        }

        private void Frm_Sel_Hotel_Load(object sender, EventArgs e)
        {
            lblUsuario.Text = string.Concat("Usuario: ", CommonVars.userLogged);
            string queryHotel = string.Concat("sp_lista_hotel_usuario '", CommonVars.userLogged,"'");
            DataTable lisHotel=Utils.sptoTable(queryHotel);
            listBx_hotel.DisplayMember = "hotel_nombre";
            listBx_hotel.ValueMember = "id_hotel";
            listBx_hotel.DataSource=lisHotel;
        }

        private void ingresar_hotel_deseado_Click(object sender, EventArgs e)
        {
            if (listBx_hotel.SelectedItem != null)
            {
                CommonVars.idHotelSeleccionado = listBx_hotel.SelectedIndex+1;
                Utils.logueaUsuario(CommonVars.userLogged, CommonVars.idHotelSeleccionado);
                this.Visible = false;
                FrmMenu frmMenu = new FrmMenu();
                frmMenu.Show();
            }
        }

        private void Frm_Sel_Hotel_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
