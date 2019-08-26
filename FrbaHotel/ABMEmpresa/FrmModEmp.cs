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

namespace PalcoNet.AbmEmpresa
{
    public partial class FrmModEmp : Form
    {
        bool esAlta=false;
        
        int idABM=0;
        string usrname="";
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
        

        public FrmModEmp()
        {
            InitializeComponent();
        }

        private void FrmModEmp_Load(object sender, EventArgs e)
        {


            if (esAlta)
            {

                this.Text = "Alta de Empresa";
                chkActive.Checked = true;
                chkActive.Enabled = false;
                //    lblID.Visible=false;

            }
            else
            {
                this.Text = "Modificacion de Empresa";
                lblID.Text= String.Concat("ID Empresa: ", idABM.ToString());
                DataTable empDatos = Utils.sptoTable(string.Concat("spSelTablaFiltrada 'elgalego.vwEmpresa', 'id_empresa', '", idABM.ToString(), "'"));
                
                txbRazonSocial.Text=empDatos.Rows[0]["RazonSocial"].ToString();
                txbMail.Text=empDatos.Rows[0]["Mail"].ToString();
                txbTel.Text=empDatos.Rows[0]["Telefono"].ToString();
                txbCUIT.Text=empDatos.Rows[0]["CUIT"].ToString();
                txbCalle.Text=empDatos.Rows[0]["Calle"].ToString();
                txbAltura.Text=empDatos.Rows[0]["NroDomi"].ToString();
                txbPiso.Text=empDatos.Rows[0]["NroPiso"].ToString();
                txbDpto.Text = empDatos.Rows[0]["NroDpto"].ToString();
                txbCP.Text = empDatos.Rows[0]["CP"].ToString();
                txbCiudad.Text = empDatos.Rows[0]["Ciudad"].ToString();

                txbRazonSocial.Enabled = false;

                if (String.Equals(empDatos.Rows[0]["MarcaBorrado"].ToString(), "0"))
                {
                    chkActive.Checked = true;
                }
                else { chkActive.Checked = false; }
                
            }

        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }


        private int validar()
        {
            int result = 1;

            if (Utils.IsValidEmail(txbMail.Text) == false) { result = 0; MessageBox.Show("E-Mail Invalido."); }

            if (txbRazonSocial.Text == "" || txbCUIT.Text == "" || txbMail.Text == ""|| txbCalle.Text==""||txbAltura.Text==""||txbCiudad.Text==""||txbCP.Text=="")
            { result = 0; MessageBox.Show("Campos marcados en rojo no pueden quedar vacios"); }
            if (esAlta)
            {
                if (Utils.existeValor("elgalego.empresa", "RazonSocial", txbRazonSocial.Text) == 1)
                { result = 0; MessageBox.Show("La Razon Social ya existe"); }
                if (Utils.existeValor("elgalego.empresa", "CUIT", txbCUIT.Text) == 1)
                { result = 0; MessageBox.Show("el CUIT ya existe"); }
            }
            else
            {
                if (Utils.existeOtroValor("elgalego.empresa", "RazonSocial", txbRazonSocial.Text,"id_empresa", idABM.ToString()) == 1)
                { result = 0; MessageBox.Show("La Razon Social ya existe"); }
                if (Utils.existeOtroValor("elgalego.empresa", "CUIT", txbCUIT.Text, "id_empresa", idABM.ToString()) == 1)
                { result = 0; MessageBox.Show("el CUIT ya existe"); }
            }
                        
            return result;
        }


        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (validar() == 1)
            {

                if (esAlta)
                {
                    // MessageBox.Show("Pase Validar");
                    Utils.execSPnoReturn(String.Concat("spCreaEmpresa '"
                        , usrname, "','"
                        , passwd, "','"
                        , txbRazonSocial.Text, "','"
                        , txbMail.Text, "','"
                        , txbTel.Text, "','"
                        , txbCUIT.Text, "','"
                        , CommonVars.fecha, "','"
                        , txbCalle.Text, "','"
                        , txbAltura.Text, "','"
                        , txbPiso.Text, "','"
                        , txbDpto.Text, "','"
                        , txbCiudad.Text, "','"
                        , txbCP.Text, "'"));
                    MessageBox.Show("Empresa Creada Con éxito");
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
                else {
                    string chkact="0";
                    if (chkActive.Checked == false) { chkact = "1"; };

                    Utils.execSPnoReturn(String.Concat("spModEmpresa '"
                    , idABM.ToString(), "','"
                    , txbMail.Text, "','"
                    , txbTel.Text, "','"
                    , txbCUIT.Text, "','"
                    , txbCalle.Text, "','"
                    , txbAltura.Text, "','"
                    , txbPiso.Text, "','"
                    , txbDpto.Text, "','"
                    , txbCiudad.Text, "','"
                    , txbCP.Text, "','"
                    , chkact,"'"
                    ));
                    MessageBox.Show("Empresa Modificada Con éxito");
                    this.DialogResult = DialogResult.OK;
                    this.Close();
                }
            }
        }
    }
}
