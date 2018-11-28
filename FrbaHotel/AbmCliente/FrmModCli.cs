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

namespace PalcoNet.AbmCliente
{
    public partial class FrmModCli : Form
    {
        bool esAlta = false;

        int idABM = 0;
        string usrname = "";
        string passwd = "";

        public void setIdABM(int id)
        {
            this.idABM = id;
        }

        public void setUserName(string uname)
        {
            this.usrname = uname;
        }
        public void setUPass(string upass)
        {
            this.passwd = upass;
        }



        public int getIdABM() { return this.idABM; }

        public void toggleAltaOn()
        {
            this.esAlta = true;
        }




        public void toggleAltaOff()
        {
            this.esAlta = false;
        }

        public FrmModCli()
        {
            InitializeComponent();
        }

        private void FrmModCli_Load(object sender, EventArgs e)
        {
            //dtFNac.MaxDate = DateTime.Today.AddDays(-1825); ;
            DataTable lisTdoc = Utils.sptoTable("spSelectTabla 'elgalego.TipoDocumento'");
            cbxtDoc.ValueMember = "id_tipoDoc";
            cbxtDoc.DisplayMember = "tipoDocumento";
            cbxtDoc.DataSource = lisTdoc;
            DataTable lisTTar = Utils.sptoTable("spSelectTabla 'elgalego.TipoTarjeta'");
            cbxTipoTar.ValueMember = "ID_TipoTarj";
            cbxTipoTar.DisplayMember = "TipoTarjeta";
            cbxTipoTar.DataSource=lisTTar;

            if (esAlta)
            {

                this.Text = "Alta de cliente";
               
                chkActive.Checked = true;
                chkActive.Enabled = false;
                //     lblID.Visible=false;

            }
            else
            {
                this.Text = "Modificacion de Cliente";
                lblID.Text = String.Concat("ID Cliente: ", idABM.ToString());
                DataTable empDatos = Utils.sptoTable(string.Concat("spSelTablaFiltrada 'elgalego.vwCliente', 'id_Cliente', '", idABM.ToString(), "'"));
                txbNombre.Text = empDatos.Rows[0]["Nombre"].ToString();
                txbApellido.Text= empDatos.Rows[0]["Apellido"].ToString();
                txbNDoc.Text = empDatos.Rows[0]["NroDoc"].ToString();
                txbMail.Text = empDatos.Rows[0]["Mail"].ToString();
                txbTel.Text = empDatos.Rows[0]["Telefono"].ToString();
                txbCUIL.Text = empDatos.Rows[0]["CUIL"].ToString();
                txbCalle.Text = empDatos.Rows[0]["Calle"].ToString();
                txbAltura.Text = empDatos.Rows[0]["NroDomi"].ToString();
                txbPiso.Text = empDatos.Rows[0]["NroPiso"].ToString();
                txbDpto.Text = empDatos.Rows[0]["NroDpto"].ToString();
                txbCP.Text = empDatos.Rows[0]["CP"].ToString();
                txbCiudad.Text = empDatos.Rows[0]["Ciudad"].ToString();
                txbNomTar.Text = empDatos.Rows[0]["NombreTarjeta"].ToString();
                txbApeTar.Text = empDatos.Rows[0]["ApellidoTarjeta"].ToString();
                txbNroTar.Text = empDatos.Rows[0]["NroTarjeta"].ToString();
               // txbcial.Enabled = false;

                if (String.Equals(empDatos.Rows[0]["MarcaBorrado"].ToString(), "0"))
                {
                    chkActive.Checked = true;
                }
                else { chkActive.Checked = false; }
                cbxtDoc.SelectedValue = empDatos.Rows[0]["ID_TipoDoc"].ToString();
                cbxTipoTar.SelectedValue = empDatos.Rows[0]["ID_TipoTarj"].ToString();
            }
        }
                
        private int validar()
        {
            int result = 1;

            if (Utils.IsValidEmail(txbMail.Text) == false) { result = 0; MessageBox.Show("E-Mail Invalido."); }

            if (txbNombre.Text == "" || txbApellido.Text =="" || txbNDoc.Text==""
                || txbCUIL.Text == "" || txbMail.Text == ""|| txbCalle.Text==""
                ||txbAltura.Text==""||txbCiudad.Text==""||txbCP.Text==""
                ||txbNomTar.Text==""||txbApeTar.Text==""||txbNroTar.Text==""
                )
            { result = 0; MessageBox.Show("Campos marcados en rojo no pueden quedar vacios"); }

            if (dtFVTar.Value.ToString() == "") { result = 0; MessageBox.Show("Fecha Vencimiento tarjeta no puede quedar vacia"); }
            //if (dtFNac.Value.ToString() == "") { result = 0; MessageBox.Show("Fecha Nacimiento no puede quedar vacia"); }
            
            
            
               // if (Utils.existeOtroValor("elgalego.cliente", "NroDoc", txbNDoc.Text,"id_cliente", idABM.ToString()) == 1)
               // { result = 0; MessageBox.Show("La Razon Social ya existe"); }
                if (Utils.existeOtroValor("elgalego.cliente", "CUIL", txbCUIL.Text,"id_cliente", idABM.ToString()) == 1)
                { result = 0; MessageBox.Show("el CUIT ya existe"); }
                if (Utils.ValidaCuit(txbCUIL.Text) == false) { MessageBox.Show("El CUIL ingresado no es valido"); result = 0; }
            
         //   else
          //  {
          //      if (Utils.existeOtroValor("elgalego.empresa", "RazonSocial", txbRazonSocial.Text,"id_empresa", idABM.ToString()) == 1)
          //      { result = 0; MessageBox.Show("La Razon Social ya existe"); }
          //      if (Utils.existeOtroValor("elgalego.empresa", "CUIT", txbCUIT.Text, "id_empresa", idABM.ToString()) == 1)
          //      { result = 0; MessageBox.Show("el CUIT ya existe"); }
            //}
                        
            return result;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
             if (validar() == 1)
            {

                if (esAlta)
                {
                    Utils.execSPnoReturn(String.Concat("spCreaCliente '"
                       , usrname, "','"
                       , passwd, "','"
                       , txbNombre.Text, "','"
                       , txbMail.Text, "','"
                       , txbTel.Text, "','"
                       , txbCUIL.Text, "','"
                       , CommonVars.fecha, "','"
                       , txbCalle.Text, "','"
                       , lbAltura.Text, "','"
                       , txbPiso.Text, "','"
                       , txbDpto.Text, "','"
                       , txbCiudad.Text, "','"
                       , txbCP.Text, "'"));
                    MessageBox.Show("Cliente Creado Con éxito");
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
                else
                {
                    string chkact = "0";
                    if (chkActive.Checked == false) { chkact = "1"; };

                    Utils.execSPnoReturn(String.Concat("spModCliente '"
                    , idABM.ToString(), "','"
                    , txbMail.Text, "','"
                    , txbTel.Text, "','"
                    , txbCUIL.Text, "','"
                    , txbCalle.Text, "','"
                    , lbAltura.Text, "','"
                    , txbPiso.Text, "','"
                    , txbDpto.Text, "','"
                    , txbCiudad.Text, "','"
                    , txbCP.Text, "','"
                    , chkact, "'"
                    ));
                    MessageBox.Show("Cliente Modificado Con éxito");
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
             }
        }
    }

     
}
