namespace FrbaHotel.AbmUsuario
{
    partial class FrmUsuario
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmUsuario));
            this.btnAlta = new System.Windows.Forms.Button();
            this.btnBaja = new System.Windows.Forms.Button();
            this.btnModif = new System.Windows.Forms.Button();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.dGridUser = new System.Windows.Forms.DataGridView();
            this.lblDatosU = new System.Windows.Forms.Label();
            this.lblUserId = new System.Windows.Forms.Label();
            this.dGridRoles = new System.Windows.Forms.DataGridView();
            this.dGridHoteles = new System.Windows.Forms.DataGridView();
            this.lblRoles = new System.Windows.Forms.Label();
            this.lblHoteles = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dGridUser)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGridRoles)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGridHoteles)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAlta
            // 
            this.btnAlta.Location = new System.Drawing.Point(10, 90);
            this.btnAlta.Name = "btnAlta";
            this.btnAlta.Size = new System.Drawing.Size(125, 45);
            this.btnAlta.TabIndex = 2;
            this.btnAlta.Text = "Alta";
            this.btnAlta.UseVisualStyleBackColor = true;
            this.btnAlta.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnBaja
            // 
            this.btnBaja.Location = new System.Drawing.Point(10, 146);
            this.btnBaja.Name = "btnBaja";
            this.btnBaja.Size = new System.Drawing.Size(125, 45);
            this.btnBaja.TabIndex = 3;
            this.btnBaja.Text = "Baja";
            this.btnBaja.UseVisualStyleBackColor = true;
            this.btnBaja.Click += new System.EventHandler(this.btnBaja_Click);
            // 
            // btnModif
            // 
            this.btnModif.Location = new System.Drawing.Point(10, 202);
            this.btnModif.Name = "btnModif";
            this.btnModif.Size = new System.Drawing.Size(125, 45);
            this.btnModif.TabIndex = 4;
            this.btnModif.Text = "Modificación";
            this.btnModif.UseVisualStyleBackColor = true;
            this.btnModif.Click += new System.EventHandler(this.btnModif_Click);
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(10, 39);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 1;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // dGridUser
            // 
            this.dGridUser.AllowUserToAddRows = false;
            this.dGridUser.AllowUserToDeleteRows = false;
            this.dGridUser.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dGridUser.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dGridUser.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGridUser.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dGridUser.Location = new System.Drawing.Point(160, 39);
            this.dGridUser.MultiSelect = false;
            this.dGridUser.Name = "dGridUser";
            this.dGridUser.ReadOnly = true;
            this.dGridUser.RowHeadersVisible = false;
            this.dGridUser.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dGridUser.Size = new System.Drawing.Size(764, 59);
            this.dGridUser.TabIndex = 4;
            this.dGridUser.TabStop = false;
            // 
            // lblDatosU
            // 
            this.lblDatosU.AutoSize = true;
            this.lblDatosU.Location = new System.Drawing.Point(157, 9);
            this.lblDatosU.Name = "lblDatosU";
            this.lblDatosU.Size = new System.Drawing.Size(142, 13);
            this.lblDatosU.TabIndex = 5;
            this.lblDatosU.Text = "Datos Usuario Seleccionado";
            // 
            // lblUserId
            // 
            this.lblUserId.AutoSize = true;
            this.lblUserId.Location = new System.Drawing.Point(12, 9);
            this.lblUserId.Name = "lblUserId";
            this.lblUserId.Size = new System.Drawing.Size(63, 13);
            this.lblUserId.TabIndex = 6;
            this.lblUserId.Text = "ID Usuario: ";
            // 
            // dGridRoles
            // 
            this.dGridRoles.AllowUserToAddRows = false;
            this.dGridRoles.AllowUserToDeleteRows = false;
            this.dGridRoles.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dGridRoles.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dGridRoles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGridRoles.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dGridRoles.Location = new System.Drawing.Point(160, 146);
            this.dGridRoles.MultiSelect = false;
            this.dGridRoles.Name = "dGridRoles";
            this.dGridRoles.ReadOnly = true;
            this.dGridRoles.RowHeadersVisible = false;
            this.dGridRoles.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dGridRoles.Size = new System.Drawing.Size(228, 101);
            this.dGridRoles.TabIndex = 7;
            this.dGridRoles.TabStop = false;
            // 
            // dGridHoteles
            // 
            this.dGridHoteles.AllowUserToAddRows = false;
            this.dGridHoteles.AllowUserToDeleteRows = false;
            this.dGridHoteles.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dGridHoteles.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dGridHoteles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGridHoteles.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dGridHoteles.Location = new System.Drawing.Point(534, 146);
            this.dGridHoteles.MultiSelect = false;
            this.dGridHoteles.Name = "dGridHoteles";
            this.dGridHoteles.ReadOnly = true;
            this.dGridHoteles.RowHeadersVisible = false;
            this.dGridHoteles.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dGridHoteles.Size = new System.Drawing.Size(256, 101);
            this.dGridHoteles.TabIndex = 8;
            this.dGridHoteles.TabStop = false;
            // 
            // lblRoles
            // 
            this.lblRoles.AutoSize = true;
            this.lblRoles.Location = new System.Drawing.Point(157, 122);
            this.lblRoles.Name = "lblRoles";
            this.lblRoles.Size = new System.Drawing.Size(141, 13);
            this.lblRoles.TabIndex = 9;
            this.lblRoles.Text = "Roles Usuario Seleccionado";
            // 
            // lblHoteles
            // 
            this.lblHoteles.AutoSize = true;
            this.lblHoteles.Location = new System.Drawing.Point(531, 122);
            this.lblHoteles.Name = "lblHoteles";
            this.lblHoteles.Size = new System.Drawing.Size(150, 13);
            this.lblHoteles.TabIndex = 10;
            this.lblHoteles.Text = "Hoteles Usuario Seleccionado";
            // 
            // FrmUsuario
            // 
            this.AcceptButton = this.btnBuscar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(936, 262);
            this.Controls.Add(this.lblHoteles);
            this.Controls.Add(this.lblRoles);
            this.Controls.Add(this.dGridHoteles);
            this.Controls.Add(this.dGridRoles);
            this.Controls.Add(this.lblUserId);
            this.Controls.Add(this.lblDatosU);
            this.Controls.Add(this.dGridUser);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.btnModif);
            this.Controls.Add(this.btnBaja);
            this.Controls.Add(this.btnAlta);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmUsuario";
            this.Text = "Administracion de Usuarios";
            this.Load += new System.EventHandler(this.FrmUsuario_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dGridUser)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGridRoles)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dGridHoteles)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAlta;
        private System.Windows.Forms.Button btnBaja;
        private System.Windows.Forms.Button btnModif;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.DataGridView dGridUser;
        private System.Windows.Forms.Label lblDatosU;
        private System.Windows.Forms.Label lblUserId;
        private System.Windows.Forms.DataGridView dGridRoles;
        private System.Windows.Forms.DataGridView dGridHoteles;
        private System.Windows.Forms.Label lblRoles;
        private System.Windows.Forms.Label lblHoteles;
    }
}