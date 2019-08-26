using PalcoNet.AbmPublicacion;
using PalcoNet.AbmFactura;
//using PalcoNet.AbmHabitacion;

using PalcoNet.AbmRol;

using PalcoNet.ListadoEstadistico;
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
using PalcoNet.AbmUsuario;
using PalcoNet.AbmEmpresa;
using PalcoNet.AbmCliente;
using PalcoNet.ABMGrado;
using ABMComprar;
using Historial;
using PalcoNet.ABMPremio;
using PalcoNet.ABMRendicion;


namespace PalcoNet.Login
{
    public partial class FrmMenu : Form
    {
     //   int goodbuttonPressed = 0;
        FrmInicio ini;
        public FrmMenu()
        {
            InitializeComponent();
        }

        private void cargar()
        {
            btnRol1.Visible = false;
            btnCliente2.Visible = false;
            btnEmpresa3.Visible = false;
            btnRubro4.Visible = false;
            btnGrado5.Visible = false;
            btnPublicacion6.Visible = false;
            btnCompra7.Visible = false;
            btnHistorial8.Visible = false;
            btnCanje9.Visible = false;
            btnRendicion10.Visible = false;
            btnListado11.Visible = false;
            btnUsuario.Visible = false;
            // MessageBox.Show(Convert.ToString(CommonVars.idHotelSeleccionado));
            

            // Habilita botones segun funcionalidades
            if (Utils.checkAccesoABM("Usuario") == 1)
            {
                btnUsuario.Visible = true;
            }

            if (Utils.checkAccesoABM("Rol") == 1)
            {
                btnRol1.Visible = true;
            }
            if (Utils.checkAccesoABM("Clientes") == 1)
            {
                btnCliente2.Visible = true;
            }
            if (Utils.checkAccesoABM("Empresa") == 1)
            {
                btnEmpresa3.Visible = true;
            }
            if (Utils.checkAccesoABM("Rubro") == 1)
            {
                btnRubro4.Visible = true;
            }
            if (Utils.checkAccesoABM("Grado") == 1)
            {
                btnGrado5.Visible = true;
            }
            if (Utils.checkAccesoABM("Publicacion") == 1)
            {
                btnPublicacion6.Visible = true;
            }
            if (Utils.checkAccesoABM("Compra") == 1)
            {
                btnCompra7.Visible = true;
            }
            if (Utils.checkAccesoABM("Historial") == 1)
            {
                btnHistorial8.Visible = true;
            }
            if (Utils.checkAccesoABM("Canje") == 1)
            {
                btnCanje9.Visible = true;
            }
            if (Utils.checkAccesoABM("Rendicion") == 1)
            {
                btnRendicion10.Visible = true;
            }
            if (Utils.checkAccesoABM("Listado") == 1)
            {
                btnListado11.Visible = true;
            }
            this.Activate();
        }

        private void MenuMain_Load(object sender, EventArgs e)
        {
            using ( ini = new FrmInicio())
            {
                var result=ini.ShowDialog();
                if (result != DialogResult.OK)
                {
                    Application.Exit();
                }
            }
            
            //goodbuttonPressed = 0;

            this.cargar();

        }

        void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
           // if (goodbuttonPressed == 0)
            {
               
                Application.Exit();
            }
            
            
            // Autosave and clear up ressources
        }

        private void btnUsuario_Click(object sender, EventArgs e)
        {
            FrmUsuario frmUser = new FrmUsuario();
            frmUser.ShowDialog();
        }

        private void btnRol1_Click(object sender, EventArgs e)
        {
            FrmRol fRol = new FrmRol();
            fRol.ShowDialog();
        }

        private void btnCliente2_Click(object sender, EventArgs e)
        {
            FrmCliente frmCli= new FrmCliente();
            frmCli.ShowDialog();
        }

        private void btnEmpresa3_Click(object sender, EventArgs e)
        {
            FrmEmpresa frmEmp = new FrmEmpresa();
            frmEmp.ShowDialog();
        }

        private void btnRubro4_Click(object sender, EventArgs e)
        {

        }

        private void btnGrado5_Click(object sender, EventArgs e)
        {
            FrmModGrado frmGrad = new FrmModGrado();
            frmGrad.ShowDialog();
        }

        private void btnPublicacion6_Click(object sender, EventArgs e)
        {
            FrmPubli frmPub = new FrmPubli();
            frmPub.ShowDialog();
        }
        private void btnCompra7_Click(object sender, EventArgs e)
        {
            FrmComprar frmBuy = new FrmComprar();
            frmBuy.ShowDialog();
        }

        private void btnHistorial8_Click(object sender, EventArgs e)
        {
            FrmHistorial frmHis = new FrmHistorial();
            frmHis.ShowDialog();
        }

        private void btnCanje9_Click(object sender, EventArgs e)
        {
            FrmCanje frmCan = new FrmCanje();
            frmCan.ShowDialog();
        }

        private void btnRendicion10_Click(object sender, EventArgs e)
        {
            FrmRendicion frmRend = new FrmRendicion();
            frmRend.ShowDialog();
        }

        private void btnListado11_Click(object sender, EventArgs e)
        {
            FrmListado frmLis = new FrmListado();
            frmLis.ShowDialog();
        }

        private void btnLogoff_Click(object sender, EventArgs e)
        {
            CommonVars.userLogged = "";
            this.Hide();
            using ( ini =new FrmInicio())
            {
                var result = ini.ShowDialog();
                if (result != DialogResult.OK)
                {
                    Application.Exit();
                }
            }
            this.Show();
            this.cargar();
            
        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }




        
  
    }
}
