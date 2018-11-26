using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace ABMComprar
{
    public partial class FrmComprar : Form
    {
        string connstring;
        SqlConnection con;
        private SqlCommand cmd1;
        private SqlCommand cmd2;
        private SqlDataAdapter adp1;
        DataSet ds;

        private int PageSize = 10;
        private int CurrentPageIndex = 1;
        private int TotalPage = 0; 

        public FrmComprar()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            connstring = ConfigurationSettings.AppSettings["ConnectionString"];
             con = new SqlConnection(connstring);
            cmd1 = new SqlCommand("Select * from Customers order by CustomerID", con);
            ds = new DataSet();
            adp1 = new SqlDataAdapter(cmd1);
            adp1.Fill(ds, "Customers");
            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "Customers";

            // PAGINADO DE DATAGRIDVIEW
            // Cuenta el total de paginas
            this.CalculateTotalPages();
            this.dataGridView1.ReadOnly = true;
            // Carga la primer pagina
            this.dataGridView1.DataSource = GetCurrentRecords(1, con);
        }

        private void CalculateTotalPages()
        {
            int rowCount = ds.Tables["Customers"].Rows.Count;
            this.TotalPage = rowCount / PageSize;
            if (rowCount % PageSize > 0) // if remainder is more than  zero 
            {
                this.TotalPage += 1;
            }
        }

        private DataTable GetCurrentRecords(int page, SqlConnection con)
        {
            DataTable dt = new DataTable();

            if (page == 1)
            {
                cmd2 = new SqlCommand("Select TOP " + PageSize + " * from Customers ORDER BY CustomerID", con);
            }
            else
            {
                int PreviouspageLimit = (page - 1) * PageSize;

                cmd2 = new SqlCommand("Select TOP " + PageSize +
                    " * from Customers " +
                    "WHERE CustomerID NOT IN " +
                "(Select TOP " + PreviouspageLimit + " CustomerID from customers ORDER BY CustomerID) ", con); // +
                //"order by customerid", con);
            }
            try
            {
                // con.Open();
                this.adp1.SelectCommand = cmd2;
                this.adp1.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt;
        }

        private void btnFirstPAge_Click(object sender, EventArgs e)
        {
            this.CurrentPageIndex = 1;
            this.dataGridView1.DataSource = GetCurrentRecords(this.CurrentPageIndex, con);
        }

        private void btnNxtPage_Click(object sender, EventArgs e)
        {
            if (this.CurrentPageIndex < this.TotalPage)
            {
                this.CurrentPageIndex++;
                this.dataGridView1.DataSource = GetCurrentRecords(this.CurrentPageIndex, con);
            }
        }

        private void btnPrevPage_Click(object sender, EventArgs e)
        {
            if (this.CurrentPageIndex > 1)
            {
                this.CurrentPageIndex--;
                this.dataGridView1.DataSource = GetCurrentRecords(this.CurrentPageIndex, con);
            } 
        }

        private void btnLastPage_Click(object sender, EventArgs e)
        {
            this.CurrentPageIndex = TotalPage;
            this.dataGridView1.DataSource = GetCurrentRecords(this.CurrentPageIndex, con); 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close(); 
        }
    }
}