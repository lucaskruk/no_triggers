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
    public partial class RESERVA_valido_huesped_y_login : Form
    {
        public RESERVA_valido_huesped_y_login()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            new GenerarModificacionReserva.CrearReserva().Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            new GenerarModificacionReserva.Modificar_reserva().Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //falta cancelar
        }

       
    }
}
