using PalcoNet.AbmCliente;
using PalcoNet.AbmEmpresa;
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

namespace PalcoNet.AbmUsuario
{
    public partial class FrmModUser : Form
    {
        int esAlta = 0;
        int idUser=0;
        int tipoUser = 0; // 1 empresa - 2 cliente

        public void setIdUser(int id) 
        {
            this.idUser = id;
        }
        public int getIdUser() { return this.idUser; }

        public void setTipoUser(int id)
        {
            this.tipoUser = id;
        }
        public int getTipoUser() { return this.tipoUser; }

        public void toggleAltaOn()
        {
            this.esAlta = 1;
        }
        public void toggleAltaOff()
        {
            this.esAlta = 0;
        }
        public FrmModUser()
        {
            InitializeComponent();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


      


        private void cbxAgregaRol_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    

        private void btnSel_Click(object sender, EventArgs e)
        {
           
        }


        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //realiza las validaciones necesarias para agregar o modificar un usuario.
        /// <summary>
        /// En este metodo tenemos que validar lo siguiente:
        /// Username -> Unique no vacio. | Campos obligatorios no vacios (todos en alta/ contraseña opcional en modific)
        /// listas de roles para agregar no vacias en alta.
        /// Que no permita seleccionar HOY como fecha de nacimiento.
        /// que el email no tenga espacios ni caracteres especiales y que haya un dominio @bla.bla
        /// </summary>
        /// <returns></returns>
        private int validar() {
            int result = 1;

        //    if (Utils.IsValidEmail(txbMail.Text) == false) { result = 0; MessageBox.Show("E-Mail Invalido."); }
            
            if (txbUname.Text == "" ) 
            { result = 0; MessageBox.Show("El nombre de usuario no puede quedar vacio"); }
            
            if (Utils.exeFunInt(string.Concat("fn_username_unico ('", txbUname.Text, "',", this.idUser.ToString(), ")"))==0) 
            {        result = 0; MessageBox.Show("El nombre de usuario ya existe");            }
            
            if (txbPass.Text != txbPass2.Text) { result = 0; MessageBox.Show("Las contraseñas no son iguales"); }

            if (this.esAlta == 1)
            {
                if (txbPass.Text == "" || txbPass2.Text == "") { MessageBox.Show("Contraseña no puede estar vacia"); result = 0; }
                if (rbCliente.Checked == false && rbEmpresa.Checked == false)
                {
                    MessageBox.Show("Debe seleccionar un tipo de usuario"); result = 0;
                }
                //   if (lbxAgregaRol.Items.Count == 0) { MessageBox.Show("Debe Seleccionar al menos un rol"); result = 0; }
            }
            else
            {
                
            }
            return result;

        }
        private void btnAceptar_Click(object sender, EventArgs e)
        {
            //validaciones 
            if (validar() == 1)
            {
                if (this.esAlta == 1)
                {
                   

                    //se llama al abm de cliente o empresa segun corresponda
                    if (rbEmpresa.Checked)
                    {
                        FrmModEmp frmEmp = new FrmModEmp();
                        frmEmp.toggleAltaOn();
                        frmEmp.setUserName(txbUname.Text);
                        frmEmp.setUPass(txbPass.Text);
                        var result = frmEmp.ShowDialog();
                        if (result == DialogResult.OK)
                        {
                            MessageBox.Show("Creacion de Usuario Existosa");
                            this.DialogResult = DialogResult.OK;
                            this.Close();

                        }
                        else
                        {
                            MessageBox.Show("Fallo en la creacion de Usuario. Operacion Cancelada");
                        }
                    }
                    else
                    {
                        if (rbCliente.Checked)
                        {
                            FrmModCli frmMCli = new FrmModCli();
                            frmMCli.toggleAltaOn();
                            frmMCli.setUserName(txbUname.Text);
                            frmMCli.setUPass(txbPass.Text);
                            var result = frmMCli.ShowDialog();
                            if (result == DialogResult.OK)
                            {
                                MessageBox.Show("Creacion de Usuario Existosa");
                                this.DialogResult = DialogResult.OK;
                                this.Close();

                            }
                            else
                            {
                                MessageBox.Show("Fallo en la creacion de Usuario. Operacion Cancelada");
                            }
                        }
                    
                    }

                }
                else
                {
                    //hace la modificacion de usuario
                  
                  
                    if (txbPass.Modified) { Utils.execSPnoReturn(string.Concat("sp_user_set_Pass ",this.idUser,",'",txbPass.Text,"'")); }
                    
                    //actualiza estado usuario
                    int estado=1;
                    if (chkActive.Checked) { estado = 1; } else { estado = 0; }
                    Utils.execSPnoReturn(string.Concat("sp_set_user_estado ", this.idUser.ToString(), ",", estado.ToString()));

 

                    
                    if (lbxQuitaRol.Items.Count > 0)
                    {
                        for (int i = 0; i < lbxQuitaRol.Items.Count; i++)
                        {
                            DataRowView drRol = ((DataRowView)(lbxQuitaRol.Items[i]));
                            int idRol = Convert.ToInt32(drRol["id_rol"]);
                            //MessageBox.Show(string.Concat(idFun.ToString()," ", this.idRol.ToString()));
                            Utils.execSPnoReturn(string.Concat("sp_quita_rol ", Convert.ToString(this.idUser), ",", Convert.ToString(idRol)));
                        }

                    }
                }


                if (lbxAgregaRol.Items.Count > 0)
                {
                    for (int i = 0; i < lbxAgregaRol.Items.Count; i++)
                    {
                        DataRowView drRol = ((DataRowView)(lbxAgregaRol.Items[i]));
                       int idRol = Convert.ToInt32(drRol["id_rol"]);
                        
                        Utils.execSPnoReturn(string.Concat("sp_agrega_urole ", Convert.ToString(this.idUser), ",", Convert.ToString(idRol)));
                    }
                }

                this.Close();
            }
        }


      

        private void FrmModUser_Load(object sender, EventArgs e)
        {


            if (this.esAlta == 1)
            {
                this.Text = "Alta de Usuario";
                btnClear.Visible = true;
             
                chkActive.Checked = true;
                chkActive.Enabled = false;

                if (tipoUser == 1)
                {
                    rbEmpresa.Checked = true;
                    rbEmpresa.Enabled = false;
                    rbCliente.Enabled = false;
                }

                if (tipoUser == 2)
                {
                    rbCliente.Checked = true;
                    rbEmpresa.Enabled = false;
                    rbCliente.Enabled = false;
                }

            }
            else
            { //modificacion de usuarios
                this.Text="Modificación de Usuario";
                lblID.Text = string.Concat("ID Usuario: ", Convert.ToString(this.idUser));
                lblPass.ForeColor = System.Drawing.Color.Black;
                //carga textboxes
                txbUname.Enabled = false;
                txbUname.Text = Utils.getValorTabla("elgalego.usuario", "id_usuario", Convert.ToString(idUser), "username");

                if (Utils.exeFunInt(string.Concat("fnTipoUser (", idUser.ToString(), ");")) == 1) {
                    rbCliente.Checked = true;

                }
                else if (Utils.exeFunInt(string.Concat("fnTipoUser (", idUser.ToString(), ");")) == 2)
                {
                    rbEmpresa.Checked = true;    
                }


                rbCliente.Enabled = false;
                rbEmpresa.Enabled = false;



                if (Utils.exeFunInt(String.Concat("fnIsAdmin ('", CommonVars.userLogged, "')")) == 1)
                { gBxAdmin.Visible = true;
                 btnClear.Visible = true;
                 DataTable roleAct = Utils.sptoTable(string.Concat("sp_lis_usu_roles ", idUser, ""));
                 cbxQuitaRol.ValueMember = "id_rol";
                 cbxQuitaRol.DisplayMember = "rolnombre";
                 cbxQuitaRol.DataSource = roleAct;
                 lbxQuitaRol.ValueMember = "id_rol";
                 lbxQuitaRol.DisplayMember = "rolnombre";

                 DataTable roleDisp = Utils.sptoTable(string.Concat("sp_lis_u_roles_libres ", idUser, ""));
                 cbxAgregaRol.ValueMember = "id_rol";
                 cbxAgregaRol.DisplayMember = "rolnombre";
                 cbxAgregaRol.DataSource = roleDisp;
                 lbxAgregaRol.ValueMember = "id_rol";
                 lbxAgregaRol.DisplayMember = "rolnombre";
                }

                //carga estado checkbox

                if (Utils.exeFunInt(string.Concat("fnUserEnabled ('", txbUname.Text, "')")) == 1)
                {
                    chkActive.Checked = true;
                 //   this.userAct = 1;
                }
                else { chkActive.Checked = false; }

                
                
                




            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            if (this.esAlta == 1) 
            { 
             txbUname.Text ="";
             txbPass.Text = "";
             txbPass2.Text = "";
             if (rbCliente.Enabled && rbEmpresa.Enabled)
             {
                 rbCliente.Checked = false;
                 rbEmpresa.Checked = false;
             }
             lbxAgregaRol.Items.Clear();
            }
            else
            {
                //carga textboxes

                //txbUname.Text = Utils.getValorTabla("elgalego.usuario", "id_usuario", Convert.ToString(idUser), "username");

                //carga estado checkbox

                if (Utils.exeFunInt(string.Concat("fnUserEnabled ('", txbUname.Text, "')")) == 1)
                {
                    chkActive.Checked = true;
        
                }
                else { chkActive.Checked = false; }
                //limpia listboxes
        
        
                lbxAgregaRol.Items.Clear();
                lbxQuitaRol.Items.Clear();
                              
           }
        }

//        private void txbPhone_KeyPress(object sender, KeyPressEventArgs e)
 //       {
 //           if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
 //                    (e.KeyChar != '.'))
 //           {
 //               e.Handled = true;
 //           }

  
//        }

   //     private void txbDoc_KeyPress(object sender, KeyPressEventArgs e)
   //     {
   //         if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
   //             (e.KeyChar != '.'))
   //         {
   //             e.Handled = true;
    //        }

//        }

        private void txbPass_TextChanged(object sender, EventArgs e)
        {
            if (txbPass.Text != "") { lblPass.ForeColor = System.Drawing.Color.Red; lblPass2.ForeColor = System.Drawing.Color.Red; }
            else { lblPass.ForeColor = System.Drawing.Color.Black; lblPass2.ForeColor = System.Drawing.Color.Black; }
        }

        private void btnQuitaRol_Click_1(object sender, EventArgs e)
        {
            if (cbxQuitaRol.SelectedItem != null)
            {
                if (lbxQuitaRol.Items.Contains(cbxQuitaRol.SelectedItem))
                {
                    MessageBox.Show("Ese rol ya ha sido seleccionado");
                }
                else
                {
                    lbxQuitaRol.Items.Add(cbxQuitaRol.SelectedItem);
                }
            }
        }

        private void btnAgregaRol_Click_1(object sender, EventArgs e)
        {
            if (lbxAgregaRol.Items.Contains(cbxAgregaRol.SelectedItem))
            {
                MessageBox.Show("Ese rol ya ha sido seleccionado");
            }
            else
            {
                lbxAgregaRol.Items.Add(cbxAgregaRol.SelectedItem);
            }
        }
    }
}
