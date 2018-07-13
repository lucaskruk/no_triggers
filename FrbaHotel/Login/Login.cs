
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

                int asd = logHelper.validaUsuario(uservar, passvar);
                if (asd == 1)
                {
                    //MessageBox.Show("Login OK");
                    logHelper.reseteaContadorfallidos(uservar);
                    
                    CommonVars.userLogged = uservar;
                    int idHotelUser = logHelper.getIDHotelUser(uservar);
                    int multiRole = logHelper.checkMultirole(uservar);
                    if (idHotelUser == 0 || multiRole==1)
                    {
                        //MessageBox.Show("Usuario multi hotel o multirol");
                        this.Visible = false;

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
                        if (logHelper.userTieneHotel(uservar) == 1)
                        {
                            //MessageBox.Show("Usuario tiene hotel");
                            int rolOK = Utils.exeFunInt(string.Concat("fn_get_usuario_rol_habilitado ('", CommonVars.userLogged, "')"));
                            if (rolOK == 1)
                            {
                                this.Visible = false;
                                CommonVars.idHotelSeleccionado = idHotelUser;
                                logHelper.logueaUsuario(CommonVars.userLogged, CommonVars.idHotelSeleccionado);
                                //FrmMenu frmMenu = new FrmMenu();
                                //frmMenu.Show();
                                this.DialogResult = DialogResult.OK;
                                this.Close();
                            }
                            else { MessageBox.Show("No existen roles habilitados para ese usuario. Favor contactar administrador"); }
                        }
                        else { MessageBox.Show("No existe hotel habilitado para este usuario. Favor contactar administrador."); }
                    }
                }
                else
                {
                    MessageBox.Show("Login Erroneo");
                    logHelper.aumentaContadorfallidos(uservar);
                    txtPasswd.Text = "";
                }
            }
            else {
                MessageBox.Show("Verifique Usuario y/o Contraseña");
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

