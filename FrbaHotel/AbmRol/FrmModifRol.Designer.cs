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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.cbxAddFun = new System.Windows.Forms.ComboBox();
            this.btnAddFun = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.cbxRemFun = new System.Windows.Forms.ComboBox();
            this.lblAdd = new System.Windows.Forms.Label();
            this.lblelim = new System.Windows.Forms.Label();
            this.lblRol = new System.Windows.Forms.Label();
            this.txBRoleName = new System.Windows.Forms.TextBox();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.btnAcept = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lblRolId = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(233, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(301, 270);
            this.dataGridView1.TabIndex = 0;
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
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(105, 176);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(121, 23);
            this.button2.TabIndex = 3;
            this.button2.Text = "Quitar";
            this.button2.UseVisualStyleBackColor = true;
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
            this.txBRoleName.Name = "txBRoleName";
            this.txBRoleName.Size = new System.Drawing.Size(121, 20);
            this.txBRoleName.TabIndex = 8;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(105, 58);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(75, 17);
            this.checkBox1.TabIndex = 10;
            this.checkBox1.Text = "Rol Activo";
            this.checkBox1.UseVisualStyleBackColor = true;
            this.checkBox1.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // btnAcept
            // 
            this.btnAcept.Location = new System.Drawing.Point(24, 259);
            this.btnAcept.Name = "btnAcept";
            this.btnAcept.Size = new System.Drawing.Size(75, 23);
            this.btnAcept.TabIndex = 11;
            this.btnAcept.Text = "Aceptar";
            this.btnAcept.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(105, 259);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 12;
            this.btnCancel.Text = "Cancelar";
            this.btnCancel.UseVisualStyleBackColor = true;
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
            // FrmModifRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(542, 293);
            this.Controls.Add(this.lblRolId);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnAcept);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.txBRoleName);
            this.Controls.Add(this.lblRol);
            this.Controls.Add(this.lblelim);
            this.Controls.Add(this.lblAdd);
            this.Controls.Add(this.cbxRemFun);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.btnAddFun);
            this.Controls.Add(this.cbxAddFun);
            this.Controls.Add(this.dataGridView1);
            this.Name = "FrmModifRol";
            this.Text = "FrmModifRol";
            this.Load += new System.EventHandler(this.FrmModifRol_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ComboBox cbxAddFun;
        private System.Windows.Forms.Button btnAddFun;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.ComboBox cbxRemFun;
        private System.Windows.Forms.Label lblAdd;
        private System.Windows.Forms.Label lblelim;
        private System.Windows.Forms.Label lblRol;
        private System.Windows.Forms.TextBox txBRoleName;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.Button btnAcept;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lblRolId;
    }
}