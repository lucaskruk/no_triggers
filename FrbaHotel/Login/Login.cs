﻿
using FrbaHotel.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void Ir_a_pantalla_principal_Click(object sender, EventArgs e)
        {
            this.Hide();
            new FRBAhotel_pantallaPrincipal().Show();
        }

        private void Iniciar_Sesion_Click(object sender, EventArgs e)
        {
            string uservar=txtUsuario.Text;
            string passvar=txtPasswd.Text;

            int asd = Utils.validaUsuario(uservar, passvar);            
                if (asd==1){
                //MessageBox.Show("Login OK");
                Utils.reseteaContadorfallidos(uservar);
                this.Visible = false;
                CommonVars.userLogged = uservar;

                int idHotelUser = Utils.getIDHotelUser(uservar);
                if (idHotelUser == 0)
                    {
                        Frm_Sel_Hotel frm_SHotel = new Frm_Sel_Hotel();
                        frm_SHotel.Show();
                    }
                    else
                    {
                        
                        CommonVars.idHotelSeleccionado = idHotelUser;
                        Utils.logueaUsuario(CommonVars.userLogged,CommonVars.idHotelSeleccionado);
                        FrmMenu frmMenu = new FrmMenu();
                        frmMenu.Show();
                    }
                }
                else { MessageBox.Show("Login Erroneo");
                Utils.aumentaContadorfallidos(uservar);
                txtPasswd.Text = "";
                }
            }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            
        }
        private void frmLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
            // Autosave and clear up ressources
        }
  
        }
    }

