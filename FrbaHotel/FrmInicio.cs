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

namespace FrbaHotel
{


    public partial class FrmInicio : Form
    {
  
  

        public FrmInicio()
        {
            InitializeComponent();
            
        }

        void FRBAhotel_pantallaPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void Ingresar_hotel_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Login.frmLogin().Show();
        }

        private void Ingresar_para_huespedes_Click(object sender, EventArgs e)
        {
            this.Hide();
            string uservar = "Guest";
            string passvar = "user_guest";

            int asd = Utils.validaUsuario(uservar, passvar);
            if (asd == 1)
            {
                //MessageBox.Show("Login OK");
                Utils.reseteaContadorfallidos(uservar);
                this.Visible = false;
                CommonVars.userLogged = uservar;

                int idHotelUser = Utils.getIDHotelUser(uservar);
                if (idHotelUser == 0)
                {
                    FrbaHotel.Login.Frm_Sel_Hotel frm_SHotel = new FrbaHotel.Login.Frm_Sel_Hotel();
                    frm_SHotel.Show();
                }
                else
                {

                    CommonVars.idHotelSeleccionado = idHotelUser;
                    Utils.logueaUsuario(CommonVars.userLogged, CommonVars.idHotelSeleccionado);
                    FrbaHotel.Login.FrmMenu frmMenu = new FrbaHotel.Login.FrmMenu();
                    frmMenu.Show();
                }
            }
        }
  
        private void FRBAhotel_pantallaPrincipal_Load(object sender, EventArgs e)
        {

           

        }
    }
}
