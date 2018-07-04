namespace FrbaHotel.AbmRol
{
    partial class FrmModifRol
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
            this.dtgFunc = new System.Windows.Forms.DataGridView();
            this.cbxAddFun = new System.Windows.Forms.ComboBox();
            this.btnAddFun = new System.Windows.Forms.Button();
            this.btnQuita = new System.Windows.Forms.Button();
            this.cbxRemFun = new System.Windows.Forms.ComboBox();
            this.lblAdd = new System.Windows.Forms.Label();
            this.lblelim = new System.Windows.Forms.Label();
            this.lblRol = new System.Windows.Forms.Label();
            this.txBRoleName = new System.Windows.Forms.TextBox();
            this.chkEstado = new System.Windows.Forms.CheckBox();
            this.btnAcept = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lblRolId = new System.Windows.Forms.Label();
            this.lbxAgrega = new System.Windows.Forms.ListBox();
            this.lbxQuita = new System.Windows.Forms.ListBox();
            this.btnClean = new System.Windows.Forms.Button();
            this.lblQuita = new System.Windows.Forms.Label();
            this.lblAgrega = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgFunc)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgFunc
            // 
            this.dtgFunc.AllowUserToAddRows = false;
            this.dtgFunc.AllowUserToDeleteRows = false;
            this.dtgFunc.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgFunc.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dtgFunc.Location = new System.Drawing.Point(413, 12);
            this.dtgFunc.MultiSelect = false;
            this.dtgFunc.Name = "dtgFunc";
            this.dtgFunc.ReadOnly = true;
            this.dtgFunc.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgFunc.Size = new System.Drawing.Size(378, 269);
            this.dtgFunc.TabIndex = 0;
            // 
            // cbxAddFun
            // 
            this.cbxAddFun.FormattingEnabled = true;
            this.cbxAddFun.Location = new System.Drawing.Point(105, 84);
            this.cbxAddFun.Name = "cbxAddFun";
            this.cbxAddFun.Size = new System.Drawing.Size(121, 21);
            this.cbxAddFun.TabIndex = 1;
            // 
            // btnAddFun
            // 
            this.btnAddFun.Location = new System.Drawing.Point(105, 114);
            this.btnAddFun.Name = "btnAddFun";
            this.btnAddFun.Size = new System.Drawing.Size(121, 23);
            this.btnAddFun.TabIndex = 2;
            this.btnAddFun.Text = "Agregar";
            this.btnAddFun.UseVisualStyleBackColor = true;
            this.btnAddFun.Click += new System.EventHandler(this.btnAddFun_Click);
            // 
            // btnQuita
            // 
            this.btnQuita.Location = new System.Drawing.Point(105, 176);
            this.btnQuita.Name = "btnQuita";
            this.btnQuita.Size = new System.Drawing.Size(121, 23);
            this.btnQuita.TabIndex = 3;
            this.btnQuita.Text = "Quitar";
            this.btnQuita.UseVisualStyleBackColor = true;
            this.btnQuita.Click += new System.EventHandler(this.btnQuita_Click);
            // 
            // cbxRemFun
            // 
            this.cbxRemFun.FormattingEnabled = true;
            this.cbxRemFun.Location = new System.Drawing.Point(105, 146);
            this.cbxRemFun.Name = "cbxRemFun";
            this.cbxRemFun.Size = new System.Drawing.Size(121, 21);
            this.cbxRemFun.TabIndex = 4;
            // 
            // lblAdd
            // 
            this.lblAdd.Location = new System.Drawing.Point(12, 84);
            this.lblAdd.Name = "lblAdd";
            this.lblAdd.Size = new System.Drawing.Size(85, 33);
            this.lblAdd.TabIndex = 5;
            this.lblAdd.Text = "Funcionalidades disponibles: ";
            // 
            // lblelim
            // 
            this.lblelim.Location = new System.Drawing.Point(12, 146);
            this.lblelim.Name = "lblelim";
            this.lblelim.Size = new System.Drawing.Size(87, 35);
            this.lblelim.TabIndex = 6;
            this.lblelim.Text = "Funcionalidades ya asignadas:";
            // 
            // lblRol
            // 
            this.lblRol.AutoSize = true;
            this.lblRol.Location = new System.Drawing.Point(13, 32);
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(63, 13);
            this.lblRol.TabIndex = 7;
            this.lblRol.Text = "Nombre Rol";
            // 
            // txBRoleName
            // 
            this.txBRoleName.Location = new System.Drawing.Point(105, 29);
            this.txBRoleName.MaxLength = 30;
            this.txBRoleName.Name = "txBRoleName";
            this.txBRoleName.Size = new System.Drawing.Size(121, 20);
            this.txBRoleName.TabIndex = 8;
            // 
            // chkEstado
            // 
            this.chkEstado.AutoSize = true;
            this.chkEstado.Location = new System.Drawing.Point(105, 58);
            this.chkEstado.Name = "chkEstado";
            this.chkEstado.Size = new System.Drawing.Size(75, 17);
            this.chkEstado.TabIndex = 10;
            this.chkEstado.Text = "Rol Activo";
            this.chkEstado.UseVisualStyleBackColor = true;
            this.chkEstado.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // btnAcept
            // 
            this.btnAcept.Location = new System.Drawing.Point(24, 259);
            this.btnAcept.Name = "btnAcept";
            this.btnAcept.Size = new System.Drawing.Size(75, 23);
            this.btnAcept.TabIndex = 11;
            this.btnAcept.Text = "Aceptar";
            this.btnAcept.UseVisualStyleBackColor = true;
            this.btnAcept.Click += new System.EventHandler(this.btnAcept_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(105, 259);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 12;
            this.btnCancel.Text = "Cancelar";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lblRolId
            // 
            this.lblRolId.AutoSize = true;
            this.lblRolId.Location = new System.Drawing.Point(12, 9);
            this.lblRolId.Name = "lblRolId";
            this.lblRolId.Size = new System.Drawing.Size(43, 13);
            this.lblRolId.TabIndex = 13;
            this.lblRolId.Text = "ID Rol: ";
            // 
            // lbxAgrega
            // 
            this.lbxAgrega.FormattingEnabled = true;
            this.lbxAgrega.Location = new System.Drawing.Point(287, 32);
            this.lbxAgrega.Name = "lbxAgrega";
            this.lbxAgrega.Size = new System.Drawing.Size(120, 95);
            this.lbxAgrega.TabIndex = 14;
            // 
            // lbxQuita
            // 
            this.lbxQuita.FormattingEnabled = true;
            this.lbxQuita.Location = new System.Drawing.Point(286, 186);
            this.lbxQuita.Name = "lbxQuita";
            this.lbxQuita.Size = new System.Drawing.Size(120, 95);
            this.lbxQuita.TabIndex = 15;
            // 
            // btnClean
            // 
            this.btnClean.Location = new System.Drawing.Point(286, 144);
            this.btnClean.Name = "btnClean";
            this.btnClean.Size = new System.Drawing.Size(121, 23);
            this.btnClean.TabIndex = 16;
            this.btnClean.Text = "Limpiar";
            this.btnClean.UseVisualStyleBackColor = true;
            this.btnClean.Click += new System.EventHandler(this.btnClean_Click);
            // 
            // lblQuita
            // 
            this.lblQuita.AutoSize = true;
            this.lblQuita.Location = new System.Drawing.Point(312, 168);
            this.lblQuita.Name = "lblQuita";
            this.lblQuita.Size = new System.Drawing.Size(60, 13);
            this.lblQuita.TabIndex = 17;
            this.lblQuita.Text = "Para Quitar";
            // 
            // lblAgrega
            // 
            this.lblAgrega.AutoSize = true;
            this.lblAgrega.Location = new System.Drawing.Point(312, 16);
            this.lblAgrega.Name = "lblAgrega";
            this.lblAgrega.Size = new System.Drawing.Size(69, 13);
            this.lblAgrega.TabIndex = 18;
            this.lblAgrega.Text = "Para Agregar";
            // 
            // FrmModifRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(803, 293);
            this.Controls.Add(this.lblAgrega);
            this.Controls.Add(this.lblQuita);
            this.Controls.Add(this.btnClean);
            this.Controls.Add(this.lbxQuita);
            this.Controls.Add(this.lbxAgrega);
            this.Controls.Add(this.lblRolId);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnAcept);
            this.Controls.Add(this.chkEstado);
            this.Controls.Add(this.txBRoleName);
            this.Controls.Add(this.lblRol);
            this.Controls.Add(this.lblelim);
            this.Controls.Add(this.lblAdd);
            this.Controls.Add(this.cbxRemFun);
            this.Controls.Add(this.btnQuita);
            this.Controls.Add(this.btnAddFun);
            this.Controls.Add(this.cbxAddFun);
            this.Controls.Add(this.dtgFunc);
            this.Name = "FrmModifRol";
            this.Text = "FrmModifRol";
            this.Load += new System.EventHandler(this.FrmModifRol_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgFunc)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgFunc;
        private System.Windows.Forms.ComboBox cbxAddFun;
        private System.Windows.Forms.Button btnAddFun;
        private System.Windows.Forms.Button btnQuita;
        private System.Windows.Forms.ComboBox cbxRemFun;
        private System.Windows.Forms.Label lblAdd;
        private System.Windows.Forms.Label lblelim;
        private System.Windows.Forms.Label lblRol;
        private System.Windows.Forms.TextBox txBRoleName;
        private System.Windows.Forms.CheckBox chkEstado;
        private System.Windows.Forms.Button btnAcept;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lblRolId;
        private System.Windows.Forms.ListBox lbxAgrega;
        private System.Windows.Forms.ListBox lbxQuita;
        private System.Windows.Forms.Button btnClean;
        private System.Windows.Forms.Label lblQuita;
        private System.Windows.Forms.Label lblAgrega;
    }
}