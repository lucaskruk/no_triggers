using FrbaHotel.Login;
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
      //  private int goodbuttonPressed = 0;
  

        public FrmInicio()
        {
            InitializeComponent();
            
        }

        void FRBAhotel_pantallaPrincipal_FormClosing(object sender, FormClosingEventArgs e)
        {
          //  if (this.goodbuttonPressed == 0)
            {
                //Application.Exit();
            }
        }

        private void Ingresar_hotel_Click(object sender, EventArgs e)
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
           // this.goodbuttonPressed = 1;
          //  this.Close();
        }

        private void Ingresar_para_huespedes_Click(object sender, EventArgs e)
        {
            
            string uservar = "Guest";
            string passvar = "user_guest";

            int asd = logHelper.validaUsuario(uservar, passvar);
            if (asd == 1)
            {
                //MessageBox.Show("Login OK");
                logHelper.reseteaContadorfallidos(uservar);
                
                CommonVars.userLogged = uservar;

                int idHotelUser = logHelper.getIDHotelUser(uservar);
                if (idHotelUser == 0)
                {
                    this.Hide();
                    using (var hotelFrm = new Frm_Sel_Hotel())
                    {
                        
                        var result = hotelFrm.ShowDialog();
                        if (result != DialogResult.OK)
                        {
                            Application.Exit();
                        }
                        else { this.DialogResult = DialogResult.OK; this.Close(); }
                    }
                }
                else
                {

                    CommonVars.idHotelSeleccionado = idHotelUser;
                    logHelper.logueaUsuario(CommonVars.userLogged, CommonVars.idHotelSeleccionado);
                    //FrbaHotel.Login.FrmMenu frmMenu = new FrbaHotel.Login.FrmMenu();
                    //frmMenu.Show();
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
           //     this.goodbuttonPressed = 1;
           //     this.Close();
            }
        }
  
        private void FRBAhotel_pantallaPrincipal_Load(object sender, EventArgs e)
        {

           

        }
    }
}
