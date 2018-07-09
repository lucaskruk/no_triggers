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

namespace FrbaHotel.AbmRol
{
    public partial class FrmModifRol : Form
    {
        int idRol=-1;
        private int roleEnabled;
        //List<int> lstfuncToAdd = new List<int>();
        //List<int> lstfuncToRem = new List<int>();

        //public event Action ReloadFrmRol;

        public FrmModifRol()
        {
            InitializeComponent();
        }

        public void setidRol(int id)
        {
            this.idRol = id;
        }
        public int getidRol()
        {
            return this.idRol;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEstado.Checked == true) { this.roleEnabled = 1; } else { this.roleEnabled = 0; }
        }

        private void FrmModifRol_Load(object sender, EventArgs e)
        {
            this.AutoSize = true;
            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            //cargamos el formulario con los valores actuales de la base de datos.
            if (this.idRol == -1) //defino si uso el form para crear o modificar roles.
                 {
                     this.Text = "Creacion de Rol";
                     lblRolId.Visible = false;
                     DataTable lisFunDisp = new DataTable();
                     lisFunDisp = Utils.sptoTable(string.Concat("sp_lista_fun_disp ", Convert.ToString(this.idRol)));
                     chkEstado.Checked = true;
                     chkEstado.Enabled = false;
                     cbxAddFun.DataSource = lisFunDisp;
                     cbxAddFun.DisplayMember = "funcionalidad_descripcion";
                     cbxAddFun.ValueMember = "id_funcionalidad";
                     lbxAgrega.DisplayMember = "funcionalidad_descripcion";
                     lbxAgrega.ValueMember = "id_funcionalidad";
                     dtgFunc.Visible = false;
                     lbxQuita.Visible = false;
                     btnQuita.Visible = false;
                     lblQuita.Visible = false;
                     lblelim.Visible = false;
                     cbxRemFun.Visible = false;
                     btnCancel.Location = new Point( btnCancel.Location.X, btnCancel.Location.Y - 40);
                     btnAcept.Location = new Point(btnAcept.Location.X, btnAcept.Location.Y - 40);
                     
            } 
            else {
                  this.Text = "Modificacion de Rol";

                  lblRolId.Text = string.Concat("ID Rol: ", Convert.ToString(this.idRol));
                
                  txBRoleName.Text = Utils.exeFunString(string.Concat("fn_get_rol_nombre (", Convert.ToString(this.idRol),")"));
                  
                  DataTable lisFunAC = new DataTable();
                  lisFunAC = Utils.sptoTable(string.Concat("sp_lista_fun_act ",Convert.ToString(this.idRol)));
                  DataTable lisFunDisp = new DataTable();
                  lisFunDisp = Utils.sptoTable(string.Concat("sp_lista_fun_disp ", Convert.ToString(this.idRol))); 

                  this.roleEnabled = Utils.exeFunInt(string.Concat("fn_get_rol_estado (", Convert.ToString(this.idRol), ")"));
                  if (this.roleEnabled == 1) { chkEstado.Checked = true; };
                  dtgFunc.DataSource = lisFunAC;
                  dtgFunc.AutoResizeColumns();
                  cbxAddFun.DataSource = lisFunDisp;
                  cbxAddFun.DisplayMember = "funcionalidad_descripcion";
                  cbxAddFun.ValueMember = "id_funcionalidad";

                  cbxRemFun.DataSource = lisFunAC;
                  cbxRemFun.DisplayMember = "funcionalidad_descripcion";
                  cbxRemFun.ValueMember = "id_funcionalidad";
                  lbxAgrega.DisplayMember = "funcionalidad_descripcion";
                  lbxAgrega.ValueMember = "id_funcionalidad";
                  lbxQuita.DisplayMember = "funcionalidad_descripcion";
                  lbxQuita.ValueMember = "id_funcionalidad";
            }
        }

        private void btnAddFun_Click(object sender, EventArgs e)
        {
            if (lbxAgrega.Items.Contains(cbxAddFun.SelectedItem)){
            MessageBox.Show("Ese valor ya ha sido seleccionado");
            } else {
                lbxAgrega.Items.Add(cbxAddFun.SelectedItem);
                //lstfuncToAdd.Add(Convert.ToInt32(cbxAddFun.SelectedValue.ToString()));
            }
        }

        private void btnClean_Click(object sender, EventArgs e)
        {
            lbxAgrega.Items.Clear();
            //lstfuncToAdd.Clear();
            lbxQuita.Items.Clear();
            if (this.idRol == -1) { txBRoleName.Text = ""; } 
            else 
            {
                txBRoleName.Text = Utils.exeFunString(string.Concat("fn_get_rol_nombre (", Convert.ToString(this.idRol), ")"));
                if (this.roleEnabled == 1) { chkEstado.Checked = true; };
            }
            //lstfuncToRem.Clear();
        }

        private void btnQuita_Click(object sender, EventArgs e)
        {
            if (lbxQuita.Items.Contains(cbxRemFun.SelectedItem))
            {
                MessageBox.Show("Ese valor ya ha sido seleccionado");
            }
            else
            {
                lbxQuita.Items.Add(cbxRemFun.SelectedItem);
                //lstfuncToAdd.Add(Convert.ToInt32(cbxAddFun.SelectedValue.ToString()));
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            //vuelve al menu anterior
  
            this.Close();
        }

        private int validarDatos()
        {
            int resultado = 1;
            
            if (txBRoleName.Text == "") { resultado = 0; MessageBox.Show("No se puede dejar el nombre vacio."); }

            //validaciones de alta
            if (this.idRol == -1)
            {
                int nombreUnico = Utils.exeFunInt(string.Concat("fn_nombre_rol_unico ('", txBRoleName.Text, "')"));
                int cantFuncionalidades = lbxAgrega.Items.Count;
                if (cantFuncionalidades == 0) { MessageBox.Show("No se puede crear un rol sin funcionalidades"); resultado = 0; }
                if (nombreUnico != 1) { MessageBox.Show("El nombre a utilizar ya existe"); resultado = 0; }
            }
            else //validaciones de modificacion
            {
                int nombreUniP = Utils.exeFunInt(string.Concat("fn_nombre_rol_unico_upd ('", txBRoleName.Text, "',", Convert.ToString(this.idRol), ")"));
                if (nombreUniP != 1) { MessageBox.Show("El nombre a utilizar ya existe"); resultado = 0; }
            }

            return resultado;
        }

        private void btnAcept_Click(object sender, EventArgs e)
        {

                //validacion de datos
                if (validarDatos() == 1)
                {
                    if (this.idRol == -1)//define modificacion o creacion
                    {
                         //creacion de nuevo rol
                                Utils.execSPnoReturn(string.Concat("sp_rol_crear '", txBRoleName.Text, "'"));
                                this.idRol = Utils.exeFunInt("fn_next_id_rol()");
                    }
                    else
                    {
                            // Modifica datos especificos del rol
                            Utils.execSPnoReturn(string.Concat("sp_set_rol_nombre ", Convert.ToString(this.idRol), ",'", txBRoleName.Text, "'"));
                            Utils.execSPnoReturn(string.Concat("sp_set_rol_estado ", Convert.ToString(this.idRol), ",", Convert.ToString(this.roleEnabled)));
                    } //fin update rol existente

                    //cosas genericas a ambos casos 
                    if (lbxAgrega.Items.Count > 0)
                    {                                //insercion de funcionalidades
                        for (int i = 0; i < lbxAgrega.Items.Count; i++)
                        {
                            DataRowView drFun = ((DataRowView)(lbxAgrega.Items[i]));
                            int idFun = Convert.ToInt32(drFun["id_funcionalidad"]);
                            //MessageBox.Show(string.Concat(idFun.ToString()," ", this.idRol.ToString()));
                            Utils.execSPnoReturn(string.Concat("sp_agrega_funcionalidad ", Convert.ToString(this.idRol), ",", Convert.ToString(idFun)));
                        }
                    } //fin insercion funcionalidades

                    if (lbxQuita.Items.Count > 0)
                    {
                        for (int i = 0; i < lbxQuita.Items.Count; i++)
                        {
                            DataRowView drFun = ((DataRowView)(lbxQuita.Items[i]));
                            int idFun = Convert.ToInt32(drFun["id_funcionalidad"]);
                            //MessageBox.Show(idFun.ToString());
                            Utils.execSPnoReturn(string.Concat("sp_quita_funcionalidad ", Convert.ToString(this.idRol), ",", Convert.ToString(idFun)));
                        }
                    }//fin eliminacion items

                    //vuelve al menu anterior

                    this.Close();
                }//fin validacion datos

                
            }// fin de metodo boton aceptar
            
        }//fin de clase

    
    }//fin de namespace

