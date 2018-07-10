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
    public partial class FrmModUser : Form
    {
        int esAlta = 0;
        int idUser=0;
        int userAct = 1;

        public void setIdUser(int id) 
        {
            this.idUser = id;
        }
        public int getIdUser() { return this.idUser; }

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

        private void btnAgregaRol_Click(object sender, EventArgs e)
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

        private void btnAgregaHotel_Click(object sender, EventArgs e)
        {
            if (cbxAgregaHotel.SelectedItem != null)
            {
                if (lbxAgregaHotel.Items.Contains(cbxAgregaHotel.SelectedItem))
                {
                    MessageBox.Show("Ese hotel ya ha sido seleccionado");
                }
                else
                {
                    lbxAgregaHotel.Items.Add(cbxAgregaHotel.SelectedItem);
                }
            }
        }

        private void cbxAgregaHotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbxAgregaRol_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lbxAgregaHotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbxTdoc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnSel_Click(object sender, EventArgs e)
        {
            mCal.Visible = true;
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

            if (Utils.IsValidEmail(txbMail.Text) == false) { result = 0; MessageBox.Show("E-Mail Invalido."); }
            if (txbUname.Text == "" || txbName.Text==""||txbApell.Text==""||txbPhone.Text==""||txbNac.Text==""||txbMail.Text==""||txbDoc.Text=="") 
            { result = 0; MessageBox.Show("Alguno de los campos obligatorios esta vacio."); }
            if (this.esAlta == 1)
            {
                if (txbPass.Text == "" || txbPass2.Text == "") { MessageBox.Show("Contraseña no puede estar vacia"); result = 0; }
                if (lbxAgregaHotel.Items.Count == 0) { MessageBox.Show("Debe Seleccionar al menos un hotel"); result = 0; }
                if (lbxAgregaRol.Items.Count == 0) { MessageBox.Show("Debe Seleccionar al menos un rol"); result = 0; }
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
                    //alta de usuario
                }
                else
                {
                    //hace la modificacion de usuario
                    //[NO_TRIGGERS].sp_set_usuario_datos (@idUser int, @usern nvarchar(100), @nombre nvarchar(100), @apell nvarchar(100), @email nvarchar(100), @fechanac nvarchar(100), @tipoD int, @ndoc int)
                    Utils.execSPnoReturn(string.Concat("sp_set_usuario_datos ", Convert.ToString(this.idUser),",'",txbUname.Text,"','",txbName.Text,"','",txbApell.Text,"','",txbMail.Text,"','",txbNac.Text,"',",cbxTdoc.SelectedValue.ToString(),",",txbDoc.Text,",",txbPhone.Text ));
                    if (txbPass.Modified) { Utils.execSPnoReturn(string.Concat("sp_user_set_Pass ",this.idUser,",'",txbPass.Text,"'")); }

                  //elimina hoteles y roles si es necesario
                    if (lbxQuitaHotel.Items.Count > 0)
                    {                                //insercion de funcionalidades
                        for (int i = 0; i < lbxQuitaHotel.Items.Count; i++)
                        {
                            DataRowView drFun = ((DataRowView)(lbxQuitaHotel.Items[i]));
                            //int idFun = Convert.ToInt32(drFun["id_funcionalidad"]);
                            //MessageBox.Show(string.Concat(idFun.ToString()," ", this.idRol.ToString()));
                            //Utils.execSPnoReturn(string.Concat("sp_agrega_funcionalidad ", Convert.ToString(this.idRol), ",", Convert.ToString(idFun)));
                        }
                    }
                }

                //inserta hoteles y roles si es necesario

                this.Close();
            }
        }

        private void chkActive_CheckedChanged(object sender, EventArgs e)
        {
            if (chkActive.Checked == true) { this.userAct = 1; } else { this.userAct = 0; }
        }

        private void lblTel_Click(object sender, EventArgs e)
        {

        }

        private void lblNDoc_Click(object sender, EventArgs e)
        {

        }

        private void lblTipo_Click(object sender, EventArgs e)
        {

        }

        private void lblNac_Click(object sender, EventArgs e)
        {

        }

        private void lblMail_Click(object sender, EventArgs e)
        {

        }

        private void FrmModUser_Load(object sender, EventArgs e)
        {
            //cosas genericas
            mCal.MaxDate = DateTime.Today.AddDays(-1825);

            DataTable roleDisp = Utils.sptoTable(string.Concat("sp_lis_u_roles_libres ", idUser, ""));
            cbxAgregaRol.ValueMember = "id_rol";
            cbxAgregaRol.DisplayMember = "rol_nombre";
            cbxAgregaRol.DataSource = roleDisp;
            lbxAgregaRol.ValueMember = "id_rol";
            lbxAgregaRol.DisplayMember = "rol_nombre";

            DataTable hotelDisp = Utils.sptoTable(string.Concat("sp_lis_u_hotel_libres ", idUser, ""));
            cbxAgregaHotel.ValueMember = "id_hotel";
            cbxAgregaHotel.DisplayMember = "hotel_nombre";
            cbxAgregaHotel.DataSource = hotelDisp;
            lbxAgregaHotel.ValueMember = "id_hotel";
            lbxAgregaHotel.DisplayMember = "hotel_nombre";

            if (this.esAlta == 1)
            {
                this.Text = "Alta de Usuario";
                
                btnQuitaHotel.Visible = false;
                btnQuitaRol.Visible = false;
                lbxQuitaHotel.Visible = false;
                lbxQuitaRol.Visible = false;
                cbxQuitaHotel.Visible = false;
                cbxQuitaRol.Visible = false;

                chkActive.Checked = true;
                chkActive.Enabled = false;

                btnAgregaHotel.ForeColor = System.Drawing.Color.Red;
                btnAgregaRol.ForeColor = System.Drawing.Color.Red;
                lblPass.ForeColor = System.Drawing.Color.Red;
                lblPass2.ForeColor = System.Drawing.Color.Red;

            }
            else
            { //modificacion de usuarios
                this.Text="Modificación de Usuario";
                lblID.Text = string.Concat("ID Usuario: ", Convert.ToString(this.idUser));
                
                //carga textboxes

                txbUname.Text = Utils.exeFunString(string.Concat("fn_get_username (",idUser,")"));
                txbName.Text = Utils.exeFunString(string.Concat("fn_get_usuario_nombre (",idUser,")"));
                txbApell.Text = Utils.exeFunString(string.Concat("fn_get_usuario_apellido (", idUser, ")"));
                txbMail.Text = Utils.exeFunString(string.Concat("fn_get_user_mail (", idUser, ")"));
                txbNac.Text = Utils.exeFunString(string.Concat("fn_get_user_fechanac (", idUser, ")"));
                txbDoc.Text = Utils.exeFunString(string.Concat("fn_get_user_dni (",idUser,")"));
                txbPhone.Text = Utils.exeFunString(string.Concat("fn_get_user_phone (", idUser, ")"));
                
                //carga estado checkbox
                
                if (Utils.exeFunInt(string.Concat("fn_get_user_active (", idUser, ")")) == 1)
                {
                    chkActive.Checked = true;
                    this.userAct = 1;
                }
                else { chkActive.Checked = false; this.userAct = 0; }
                
                //carga listbox de tipos de DNI y define el actual como seleccionado

                int tipoDoc = Utils.exeFunInt(string.Concat("fn_get_user_tipoDocID (", idUser, ")"));
                DataTable lisTdoc = Utils.sptoTable("sp_lis_tipo_dni");
                cbxTdoc.ValueMember="id_tipo_documento";
                cbxTdoc.DisplayMember="tipo_de_documento_nombre";
                cbxTdoc.DataSource=lisTdoc;
                cbxTdoc.SelectedValue = tipoDoc;
                
                //carga comboboxes de hoteles y de roles, tanto disponibles como actuales
                
                DataTable roleAct = Utils.sptoTable(string.Concat("sp_lis_usu_roles ", idUser, ""));
                cbxQuitaRol.ValueMember = "id_rol";
                cbxQuitaRol.DisplayMember = "rol_nombre";
                cbxQuitaRol.DataSource = roleAct;


                DataTable hotelAct = Utils.sptoTable(string.Concat("sp_lis_usu_id_hotel ", idUser, ""));
                cbxQuitaHotel.ValueMember = "id_hotel";
                cbxQuitaHotel.DisplayMember = "hotel_nombre";
                cbxQuitaHotel.DataSource = hotelAct;
                

                //prepara listboxes
                lbxQuitaHotel.ValueMember = "id_hotel";
                lbxQuitaHotel.DisplayMember = "hotel_nombre";

                lbxQuitaRol.ValueMember = "id_rol";
                lbxQuitaRol.DisplayMember = "rol_nombre";

            }
        }

        private void mCal_DateSelected(object sender, DateRangeEventArgs e)
        {
            txbNac.Text = mCal.SelectionStart.ToShortDateString().ToString();
            mCal.Visible = false;
        }

        private void btnQuitaRol_Click(object sender, EventArgs e)
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

        private void btnQuitaHotel_Click(object sender, EventArgs e)
        {
            if (cbxQuitaHotel.SelectedItem != null)
            {
                if (lbxQuitaHotel.Items.Contains(cbxQuitaHotel.SelectedItem))
                {
                    MessageBox.Show("Ese hotel ya ha sido seleccionado");
                }
                else
                {
                    lbxQuitaHotel.Items.Add(cbxQuitaHotel.SelectedItem);
                }
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            if (this.esAlta == 1) 
            { 
            txbUname.Text ="";
            txbName.Text = "";
            txbApell.Text ="";
            txbMail.Text = "";
            txbNac.Text = "";
            txbDoc.Text = "";
            txbPhone.Text = "";
            lbxAgregaHotel.Items.Clear();
            lbxAgregaRol.Items.Clear();
            }
            else
            {
                //carga textboxes

                txbUname.Text = Utils.exeFunString(string.Concat("fn_get_username (", idUser, ")"));
                txbName.Text = Utils.exeFunString(string.Concat("fn_get_usuario_nombre (", idUser, ")"));
                txbApell.Text = Utils.exeFunString(string.Concat("fn_get_usuario_apellido (", idUser, ")"));
                txbMail.Text = Utils.exeFunString(string.Concat("fn_get_user_mail (", idUser, ")"));
                txbNac.Text = Utils.exeFunString(string.Concat("fn_get_user_fechanac (", idUser, ")"));
                txbDoc.Text = Utils.exeFunString(string.Concat("fn_get_user_dni (", idUser, ")"));
                txbPhone.Text = Utils.exeFunString(string.Concat("fn_get_user_phone (", idUser, ")"));

                //carga estado checkbox

                if (Utils.exeFunInt(string.Concat("fn_get_user_active (", idUser, ")")) == 1)
                {
                    chkActive.Checked = true;
                    this.userAct = 1;
                }
                else { chkActive.Checked = false; this.userAct = 0; }
                //limpia listboxes
                lbxAgregaHotel.Items.Clear();
                lbxQuitaHotel.Items.Clear();
                lbxAgregaRol.Items.Clear();
                lbxQuitaRol.Items.Clear();

                int tipoDoc = Utils.exeFunInt(string.Concat("fn_get_user_tipoDocID (", idUser, ")"));
                cbxTdoc.SelectedValue = tipoDoc;

            }
        }

        private void txbPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                     (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

  
        }

        private void txbDoc_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbDoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
                (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

        }
    }
}
