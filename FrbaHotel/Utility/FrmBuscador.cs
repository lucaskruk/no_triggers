using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Utility
{
    public partial class FrmBuscador : Form
    {
        string spBuscar = "";
        string campo1="";
        string campo2="";
        string nomSPcomboB="";
        string campoBus="";
        int esFecha=0;

        //getters and setters
        public void setBuscar(string nombreSP)
        {
            if (nombreSP != null)
            {
                this.spBuscar = nombreSP;
            }
            else { MessageBox.Show("Nombre SP no puede ser nulo para buscador"); Application.Exit();}

        }
        public string getBuscar()
        {
            return this.spBuscar;
        }
        
        public void setCampo1(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null)
            {
                this.campo1 = nombreCampo;
                if (lblStr != null)
                { lblFil1.Text = lblStr; }
                else { lblFil1.Text = nombreCampo; }
            }
            
        }
        public string getCampo1() {
            return this.campo1;
        }
        //pasar nulo al label deja el nombre de la columna
        public void setCampo2(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null)
            {
                this.campo2 = nombreCampo;
                if (lblStr != null)
                { lblFil2.Text = lblStr; }
                else { lblFil2.Text = nombreCampo; }
            }
        }
        public string getCampo2()
        {
            return this.campo1;
        }

        public void setSPcomboB(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null)
            {
                this.nomSPcomboB = nombreCampo;
                if (lblStr != null)
                { lblFil3.Text = lblStr; }
                else { lblFil3.Text = nombreCampo; }
            }
        }
        public string getSPcomboB()
        {
            return this.nomSPcomboB;
        }

        public void setCampoBus(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null)
            {
                this.campoBus = nombreCampo;
                if (lblStr != null)
                { lblFil4.Text = lblStr; }
                else { lblFil4.Text = nombreCampo; }
            }
        }
        public string getCampoBus ()
        {
            return this.campoBus;
        }

        public void toggleFechaOn()
        { this.esFecha = 1; }

        public void toggleFechaOff()
        { this.esFecha = 0; }

        public void inicializar() {

            if (this.spBuscar != null)
            {

                if (this.campo1 != null)
                {
                    lblFil1.Visible = true;
                    txbFil1.Visible = true;
                }

                if (this.campo2 != null)
                {
                    lblFil2.Visible = true;
                    txbFil2.Visible = true;
                }
                if (this.nomSPcomboB != null)
                {
                    lblFil3.Visible = true;
                    cbxFil3.Visible = true;
                }
                if (this.campoBus != null)
                {
                    lblFil4.Visible = true;
                    txbFil4.Visible = true;
                    btnSelect.Visible = true;
                }
            }
            else { MessageBox.Show("No se puede inicializar buscador sin pasar SP de busqueda"); }
        }

        //este proceso genera un nuevo form buscador para un campo especifico.
        //Para mantener cierto orden no se permite mas de un nivel de subbuscador
        //uso setSubBuscador (campo1, label1, campo2, label2, campo3, label3, campo4, label4)
        private FrmBuscador setSubBuscador(string cp1, string lb1, string cp2, string lb2, string spCB, string lb3, string cpFecha, string lb4)
        {
            FrmBuscador result = new FrmBuscador();
            result.setCampo1(cp1,lb1);
            result.setCampo2(cp2,lb2);
            result.setSPcomboB(spCB,lb3);
            if (cpFecha != null)
            {
                result.toggleFechaOn();
                result.setCampoBus(cpFecha,lb4);
            }
            result.inicializar();
            return result;
        }

        public FrmBuscador()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
