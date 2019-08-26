
using PalcoNet.Utility;
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

namespace PalcoNet.Login
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
            this.DialogResult = DialogResult.Cancel;
            //new FrmInicio().Show();
            //this.Dispose();
        }

        private void Iniciar_Sesion_Click(object sender, EventArgs e)
        {
            if (txtPasswd.Text != "" && txtUsuario.Text != "")
            {
                string uservar = txtUsuario.Text;
                string passvar = txtPasswd.Text;

                int loginOk = logHelper.login(uservar, passvar);
                if (loginOk == 1)
                {
                    //MessageBox.Show("Login OK");
                    
                    
                    CommonVars.userLogged = uservar;
                     int multiRole = Utils.exeFunInt(string.Concat("fnMultirole ('",CommonVars.userLogged,"');"));
                     if (multiRole==1)
                     {            this.Visible = false;
                                  Frm_Sel_Rol fSRol = new Frm_Sel_Rol();
                                  var result = fSRol.ShowDialog();
                                  if (result == DialogResult.OK)
                                    { // marco el rol seleccionado.
                                        Utils.execSPnoReturn(String.Concat("setRolSelected '", CommonVars.userLogged, "',",fSRol.getID().ToString()));
                                    }
                     }
                     
                         //MessageBox.Show("Usuario tiene hotel");
                            int rolOK = Utils.exeFunInt(string.Concat("fnUserRoleEnabled ('", CommonVars.userLogged, "')"));
                            if (rolOK == 1)
                            {
                                this.Visible = false;
                                
                                
                                //FrmMenu frmMenu = new FrmMenu();
                                //frmMenu.Show();
                                this.DialogResult = DialogResult.OK;
                                this.Close();
                            }
                            else { MessageBox.Show("No existen roles habilitados para ese usuario. Favor contactar administrador"); }
                     
                }
                else
                {
                    MessageBox.Show("Login Erroneo");
                    
                    txtPasswd.Text = "";
                }
            }
            else {
                MessageBox.Show("Verifique Usuario y/o Contraseña, no pueden estar vacios");
            }
           
           }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            
        }
        private void frmLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            //Application.Exit();
            // Autosave and clear up ressources
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
  
        }
    }

