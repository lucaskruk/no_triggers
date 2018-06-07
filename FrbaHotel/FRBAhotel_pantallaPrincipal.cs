using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel
{
    public partial class FRBAhotel_pantallaPrincipal : Form
    {
        public FRBAhotel_pantallaPrincipal()
        {
            InitializeComponent();
        }

        private void Ingresar_hotel_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Login.Login().Show();
        }

        private void Ingresar_para_huespedes_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Login.RESERVA_valido_huesped_y_login().Show();
        }
    }
}
