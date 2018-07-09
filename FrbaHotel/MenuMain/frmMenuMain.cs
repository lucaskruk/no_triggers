using FrbaHotel.AbmCliente;
using FrbaHotel.AbmFactura;
using FrbaHotel.AbmHabitacion;
using FrbaHotel.AbmHotel;
using FrbaHotel.AbmRol;
using FrbaHotel.AbmUsuario;
using FrbaHotel.ListadoEstadistico;
using FrbaHotel.RegistrarConsumible;
using FrbaHotel.RegistrarEstadia;
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

namespace FrbaHotel.Login
{
    public partial class FrmMenu : Form
    {
        public FrmMenu()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            btnRol1.Visible = false;
            btnUser2.Visible = false;
            btnHotel3.Visible = false;
            btnHabitacion4.Visible = false;
            btnListado6.Visible = false;
            btnClientes7.Visible = false;
            btnEstadia8.Visible = false;
            btnConsumibles9.Visible = false;
            btnFacturacion10.Visible = false;
            btnReserva11.Visible = false;
           // MessageBox.Show(Convert.ToString(CommonVars.idHotelSeleccionado));
            lblUsr.Text = string.Concat("Usuario: ", CommonVars.userLogged, "Hotel: ",Utils.getNombreHotel(CommonVars.idHotelSeleccionado));

            // Habilita botones segun funcionalidades
            if (Utils.checkAccesoABM("Rol") == 1)
            {
                btnRol1.Visible = true;
            }
            if (Utils.checkAccesoABM("USUARIO") == 1)
            {
                btnUser2.Visible = true;
            }
            if (Utils.checkAccesoABM("HOTEL") == 1)
            {
                btnHotel3.Visible = true;
            }
            if (Utils.checkAccesoABM("HABITACION") == 1)
            {
                btnHabitacion4.Visible = true;
            }
            if (Utils.checkAccesoABM("LISTADO") == 1)
            {
                btnListado6.Visible = true;
            }
            if (Utils.checkAccesoABM("CLIENTE") == 1)
            {
                btnClientes7.Visible = true;
            }
            if (Utils.checkAccesoABM("ESTADIA") == 1)
            {
                btnEstadia8.Visible = true;
            }
            if (Utils.checkAccesoABM("CONSUMIBLE") == 1)
            {
                btnConsumibles9.Visible = true;
            }
            if (Utils.checkAccesoABM("FACTURAR") == 1)
            {
                btnFacturacion10.Visible = true;
            }
            if (Utils.checkAccesoABM("RESERVA") == 1)
            {
                btnReserva11.Visible = true;
            }



        }

        void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            logHelper.deslogueaUsuario(CommonVars.userLogged);
            Application.Exit();
            // Autosave and clear up ressources
        }



        private void btnRol1_Click(object sender, EventArgs e)
        {
            FrmRol fRol = new FrmRol();
            fRol.ShowDialog();
        }

        private void btnUser2_Click(object sender, EventArgs e)
        {
            FrmUsuario frmUsr = new FrmUsuario();
            frmUsr.ShowDialog();
        }

        private void btnHotel3_Click(object sender, EventArgs e)
        {
            FrmHotel frmHot = new FrmHotel();
            frmHot.ShowDialog();
        }

        private void btnHabitacion4_Click(object sender, EventArgs e)
        {
            FrmHabitacion frmHab = new FrmHabitacion();
            frmHab.ShowDialog();
        }

        private void btnListado6_Click(object sender, EventArgs e)
        {
            FrmListado frmLis = new FrmListado();
            frmLis.ShowDialog();
        }

        private void btnClientes7_Click(object sender, EventArgs e)
        {
            FrmCliente frmCli = new FrmCliente();
            frmCli.ShowDialog();
        }
        private void btnEstadia8_Click(object sender, EventArgs e)
        {
            FrmEstadia frmEstad = new FrmEstadia();
            frmEstad.ShowDialog();
        }

        private void btnConsumibles9_Click(object sender, EventArgs e)
        {
            FrmConsumible frmCons = new FrmConsumible();
            frmCons.ShowDialog();
        }

        private void btnFacturacion10_Click(object sender, EventArgs e)
        {
            FrmFactura frmFact = new FrmFactura();
            frmFact.ShowDialog();
        }

        private void btnReserva11_Click(object sender, EventArgs e)
        {
            FrmMenuReserva frmReser = new FrmMenuReserva();
            frmReser.ShowDialog();
        }
        
  
    }
}
