namespace FrbaHotel.Utility
{
    partial class FrmBuscador
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmBuscador));
            this.gbFilters = new System.Windows.Forms.GroupBox();
            this.cbxFil3 = new System.Windows.Forms.ComboBox();
            this.txbFil4 = new System.Windows.Forms.TextBox();
            this.txbFil2 = new System.Windows.Forms.TextBox();
            this.txbFil1 = new System.Windows.Forms.TextBox();
            this.btnSelect = new System.Windows.Forms.Button();
            this.lblFil4 = new System.Windows.Forms.Label();
            this.lblFil3 = new System.Windows.Forms.Label();
            this.lblFil2 = new System.Windows.Forms.Label();
            this.lblFil1 = new System.Windows.Forms.Label();
            this.dtgridSearch = new System.Windows.Forms.DataGridView();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.mCalendar = new System.Windows.Forms.MonthCalendar();
            this.gbFilters.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgridSearch)).BeginInit();
            this.SuspendLayout();
            // 
            // gbFilters
            // 
            this.gbFilters.Controls.Add(this.cbxFil3);
            this.gbFilters.Controls.Add(this.txbFil4);
            this.gbFilters.Controls.Add(this.txbFil2);
            this.gbFilters.Controls.Add(this.txbFil1);
            this.gbFilters.Controls.Add(this.btnSelect);
            this.gbFilters.Controls.Add(this.lblFil4);
            this.gbFilters.Controls.Add(this.lblFil3);
            this.gbFilters.Controls.Add(this.lblFil2);
            this.gbFilters.Controls.Add(this.lblFil1);
            this.gbFilters.Location = new System.Drawing.Point(13, 13);
            this.gbFilters.Name = "gbFilters";
            this.gbFilters.Size = new System.Drawing.Size(644, 96);
            this.gbFilters.TabIndex = 0;
            this.gbFilters.TabStop = false;
            this.gbFilters.Text = "Filtros de Busqueda";
            this.gbFilters.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // cbxFil3
            // 
            this.cbxFil3.FormattingEnabled = true;
            this.cbxFil3.Location = new System.Drawing.Point(387, 25);
            this.cbxFil3.Name = "cbxFil3";
            this.cbxFil3.Size = new System.Drawing.Size(181, 21);
            this.cbxFil3.TabIndex = 10;
            this.cbxFil3.Visible = false;
            // 
            // txbFil4
            // 
            this.txbFil4.Enabled = false;
            this.txbFil4.Location = new System.Drawing.Point(387, 58);
            this.txbFil4.Name = "txbFil4";
            this.txbFil4.Size = new System.Drawing.Size(100, 20);
            this.txbFil4.TabIndex = 9;
            this.txbFil4.Visible = false;
            // 
            // txbFil2
            // 
            this.txbFil2.Location = new System.Drawing.Point(134, 54);
            this.txbFil2.Name = "txbFil2";
            this.txbFil2.Size = new System.Drawing.Size(141, 20);
            this.txbFil2.TabIndex = 8;
            this.txbFil2.Visible = false;
            // 
            // txbFil1
            // 
            this.txbFil1.Location = new System.Drawing.Point(134, 28);
            this.txbFil1.Name = "txbFil1";
            this.txbFil1.Size = new System.Drawing.Size(141, 20);
            this.txbFil1.TabIndex = 7;
            this.txbFil1.Visible = false;
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(493, 56);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(75, 23);
            this.btnSelect.TabIndex = 6;
            this.btnSelect.Text = "Seleccionar";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Visible = false;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // lblFil4
            // 
            this.lblFil4.AutoSize = true;
            this.lblFil4.Location = new System.Drawing.Point(287, 61);
            this.lblFil4.Name = "lblFil4";
            this.lblFil4.Size = new System.Drawing.Size(38, 13);
            this.lblFil4.TabIndex = 3;
            this.lblFil4.Text = "Filtro 4";
            this.lblFil4.Visible = false;
            // 
            // lblFil3
            // 
            this.lblFil3.AutoSize = true;
            this.lblFil3.Location = new System.Drawing.Point(287, 28);
            this.lblFil3.Name = "lblFil3";
            this.lblFil3.Size = new System.Drawing.Size(38, 13);
            this.lblFil3.TabIndex = 2;
            this.lblFil3.Text = "Filtro 3";
            this.lblFil3.Visible = false;
            // 
            // lblFil2
            // 
            this.lblFil2.AutoSize = true;
            this.lblFil2.Location = new System.Drawing.Point(19, 60);
            this.lblFil2.Name = "lblFil2";
            this.lblFil2.Size = new System.Drawing.Size(38, 13);
            this.lblFil2.TabIndex = 1;
            this.lblFil2.Text = "Filtro 2";
            this.lblFil2.Visible = false;
            // 
            // lblFil1
            // 
            this.lblFil1.AutoSize = true;
            this.lblFil1.Location = new System.Drawing.Point(19, 28);
            this.lblFil1.Name = "lblFil1";
            this.lblFil1.Size = new System.Drawing.Size(38, 13);
            this.lblFil1.TabIndex = 0;
            this.lblFil1.Text = "Filtro 1";
            this.lblFil1.Visible = false;
            // 
            // dtgridSearch
            // 
            this.dtgridSearch.AllowUserToAddRows = false;
            this.dtgridSearch.AllowUserToDeleteRows = false;
            this.dtgridSearch.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dtgridSearch.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dtgridSearch.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgridSearch.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dtgridSearch.Location = new System.Drawing.Point(13, 144);
            this.dtgridSearch.MultiSelect = false;
            this.dtgridSearch.Name = "dtgridSearch";
            this.dtgridSearch.ReadOnly = true;
            this.dtgridSearch.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgridSearch.ShowEditingIcon = false;
            this.dtgridSearch.Size = new System.Drawing.Size(568, 270);
            this.dtgridSearch.TabIndex = 1;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Location = new System.Drawing.Point(593, 173);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(75, 23);
            this.btnLimpiar.TabIndex = 2;
            this.btnLimpiar.Text = "Limpiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(593, 144);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(75, 23);
            this.btnBuscar.TabIndex = 3;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(593, 220);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 4;
            this.btnOK.Text = "Aceptar";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(593, 249);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "Cancelar";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // mCalendar
            // 
            this.mCalendar.Location = new System.Drawing.Point(354, 104);
            this.mCalendar.MaxDate = new System.DateTime(2099, 12, 31, 0, 0, 0, 0);
            this.mCalendar.MaxSelectionCount = 1;
            this.mCalendar.MinDate = new System.DateTime(1990, 1, 1, 0, 0, 0, 0);
            this.mCalendar.Name = "mCalendar";
            this.mCalendar.TabIndex = 11;
            this.mCalendar.Visible = false;
            this.mCalendar.DateSelected += new System.Windows.Forms.DateRangeEventHandler(this.mCalendar_DateChanged);
            // 
            // FrmBuscador
            // 
            this.AcceptButton = this.btnBuscar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(701, 426);
            this.Controls.Add(this.mCalendar);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.btnLimpiar);
            this.Controls.Add(this.dtgridSearch);
            this.Controls.Add(this.gbFilters);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmBuscador";
            this.Text = "Busqueda";
            this.Load += new System.EventHandler(this.FrmBuscador_Load);
            this.gbFilters.ResumeLayout(false);
            this.gbFilters.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgridSearch)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbFilters;
        private System.Windows.Forms.DataGridView dtgridSearch;
        private System.Windows.Forms.ComboBox cbxFil3;
        private System.Windows.Forms.TextBox txbFil4;
        private System.Windows.Forms.TextBox txbFil2;
        private System.Windows.Forms.TextBox txbFil1;
        private System.Windows.Forms.Button btnSelect;
        private System.Windows.Forms.Label lblFil4;
        private System.Windows.Forms.Label lblFil3;
        private System.Windows.Forms.Label lblFil2;
        private System.Windows.Forms.Label lblFil1;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.MonthCalendar mCalendar;
    }
}