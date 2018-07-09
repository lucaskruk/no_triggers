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
        /*
        Es un formulario generico de busqueda. Primero se define la tabla a buscar con setBuscar, 
         * luego los campos a mostrar en el resultado con setCampos, y finalmente los campos a utilizar como filtros
         * en setCampo1, setCampo2, tambien se puede definir un comboBox de distintos valores de un campo, o realizar un llamado
         * a un subformulario del mismo tipo pero en otra tabla, como tambien buscar por fecha.

        */
        string tablaBuscar = "";
        string camposaMostrar = "*";
        string campo1="";
        string campo2="";
        string nomSPcomboB="";
        string campoBus="";
        int idSeleccionado {get;set;}
        int esFecha=0;

        //getters and setters
        public void setCampos(string campos)
        {
            if (campos != null)
            {
                this.camposaMostrar = campos;
            }
            else { this.camposaMostrar = "*"; }

        }
        public string getCampos(){return this.camposaMostrar;}
        
        public void setBuscar(string nombreSP)
        {
            if (nombreSP != null)
            {
                this.tablaBuscar = nombreSP;
            }
            else { MessageBox.Show("Nombre SP no puede ser nulo para buscador"); Application.Exit();}

        }
        public string getBuscar()
        {
            if (tablaBuscar== null || tablaBuscar ==""){
                MessageBox.Show("La tabla de busqueda no esta definida");
            }
            return this.tablaBuscar;
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
            if (this.campo1 != null)
            {
                return this.campo1;
            }
            else { return ""; }
        }

        //pasar nulo al label deja el nombre de la columna
        public void setCampo2(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null && nombreCampo !="")
            {
                this.campo2 = nombreCampo;
                if (lblStr != null && lblStr!="")
                { lblFil2.Text = lblStr; }
                else { lblFil2.Text = nombreCampo; }
            }
        }
        public string getCampo2()
        {
            return this.campo1;
        }

        public int getID()
        {
            return this.idSeleccionado;
        }
        public void setSPcomboB(string nombreCampo, string lblStr)
        {
            if (nombreCampo != null && nombreCampo !="")
            {
                this.nomSPcomboB = nombreCampo;
                if (lblStr != null && lblStr!="")
                { lblFil3.Text = lblStr; }
                else { lblFil3.Text = nombreCampo; }
                DataTable distValues = Utils.querytoTable(this.getBuscar(), string.Concat("distinct ", nombreCampo));
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

        //recibe el campo en el formato ideal para la consulta
        public string getWhereCampo1()
        {
            string resultado = "";

            if (this.campo1 != null && this.campo1 != "")
            {
                resultado = string.Concat(resultado, this.campo1, " like ('%", txbFil1.Text, "%')");
                //si hay mas campos para filtrar
                if (this.campo2 != "" || this.cbxFil3.Items.Count > 0 || this.campoBus != "")
                { resultado = string.Concat(resultado, " and "); }

            }
            return resultado;
        }
        public string getWhereCampo2()
        {
            string resultado = "";

            if (this.campo2 != null && this.campo2 != "")
            {
                resultado = string.Concat(resultado, this.campo2, " like ('%", txbFil2.Text, "%')");
                //si hay mas campos para filtrar
                if (this.cbxFil3.Items.Count > 0 || this.campoBus != "")
                { resultado = string.Concat(resultado, " and "); }
            }
            return resultado;
        }

        public void inicializar() {

            if (this.tablaBuscar != "")
            {

                if (this.campo1 != "")
                {
                    lblFil1.Visible = true;
                    txbFil1.Visible = true;
                }

                if (this.campo2 != "")
                {
                    lblFil2.Visible = true;
                    txbFil2.Visible = true;
                }
                if (this.nomSPcomboB != "")
                {
                    lblFil3.Visible = true;
                    cbxFil3.Visible = true;
                }
                if (this.campoBus != "")
                {
                    lblFil4.Visible = true;
                    txbFil4.Visible = true;
                    btnSelect.Visible = true;
                }
            }
            else { MessageBox.Show("No se puede inicializar buscador sin pasar tabla de busqueda"); }
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
            
            return result;
        }

        public FrmBuscador()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if (this.esFecha == 1) {
                mCalendar.Visible = true;
            }
        }

        private void mCalendar_DateChanged(object sender, DateRangeEventArgs e)
        {
            txbFil4.Text = mCalendar.SelectionStart.ToShortDateString();
            mCalendar.Visible = false;
        }

        

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (dtgridSearch.SelectedRows.Count > 0)
            {
                int primerFila = dtgridSearch.SelectedRows.Count -1;
                
                this.idSeleccionado = Convert.ToInt32(dtgridSearch.SelectedRows[primerFila].Cells[0].Value);
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            else {
                MessageBox.Show("No se selecciono ningun valor de la tabla de resultados");
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (getCampo1() != "" || getCampo2() != "" || getCampoBus() != "" || cbxFil3.Items.Count > 0)
            {
                string query = string.Concat(this.getBuscar(), " where ", this.getWhereCampo1(),this.getWhereCampo2());
               // MessageBox.Show(query);
                DataTable lisRes = Utils.querytoTable(query, this.camposaMostrar);
                dtgridSearch.DataSource = lisRes;
                dtgridSearch.AutoResizeColumns();
                //if (dtgridSearch.RowCount == 1) { dtgridSearch.s }

            }
            else { MessageBox.Show("Debe seleccionar al menos un filtro de busqueda"); }
        }

        private void FrmBuscador_Load(object sender, EventArgs e)
        {
            inicializar();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
