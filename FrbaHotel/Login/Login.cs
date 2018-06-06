using FrbaHotel.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Ir_a_pantalla_principal_Click(object sender, EventArgs e)
        {
            this.Hide();
            new FRBAhotel_pantallaPrincipal().Show();
        }

        private void Iniciar_Sesion_Click(object sender, EventArgs e)
        {
            using (GD1C2018Entities1 context = new GD1C2018Entities1())
            {
                var asd = context.Database.SqlQuery<Object>("sp_adasdadas", new SqlParameter("@mierda", 456)).ToList();
                asd.ForEach(x => x.ToString());
            }
        }
    }
}
