namespace PalcoNet.AbmUsuario
{
    partial class FrmModUser
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmModUser));
            this.lblID = new System.Windows.Forms.Label();
            this.lblUsername = new System.Windows.Forms.Label();
            this.lblPass = new System.Windows.Forms.Label();
            this.chkActive = new System.Windows.Forms.CheckBox();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.txbUname = new System.Windows.Forms.TextBox();
            this.txbPass = new System.Windows.Forms.TextBox();
            this.txbPass2 = new System.Windows.Forms.TextBox();
            this.lblPass2 = new System.Windows.Forms.Label();
            this.lblAdvise = new System.Windows.Forms.Label();
            this.btnClear = new System.Windows.Forms.Button();
            this.rbCliente = new System.Windows.Forms.RadioButton();
            this.rbEmpresa = new System.Windows.Forms.RadioButton();
            this.SuspendLayout();
            // 
            // lblID
            // 
            this.lblID.AutoSize = true;
            this.lblID.Location = new System.Drawing.Point(16, 13);
            this.lblID.Name = "lblID";
            this.lblID.Size = new System.Drawing.Size(76, 13);
            this.lblID.TabIndex = 0;
            this.lblID.Text = "ID USUARIO: ";
            // 
            // lblUsername
            // 
            this.lblUsername.AutoSize = true;
            this.lblUsername.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsername.ForeColor = System.Drawing.Color.Red;
            this.lblUsername.Location = new System.Drawing.Point(16, 51);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(58, 13);
            this.lblUsername.TabIndex = 1;
            this.lblUsername.Text = "Usuario: ";
            // 
            // lblPass
            // 
            this.lblPass.AutoSize = true;
            this.lblPass.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPass.ForeColor = System.Drawing.Color.Red;
            this.lblPass.Location = new System.Drawing.Point(16, 81);
            this.lblPass.Name = "lblPass";
            this.lblPass.Size = new System.Drawing.Size(79, 13);
            this.lblPass.TabIndex = 4;
            this.lblPass.Text = "Contraseña: ";
            // 
            // chkActive
            // 
            this.chkActive.AutoSize = true;
            this.chkActive.Location = new System.Drawing.Point(19, 132);
            this.chkActive.Name = "chkActive";
            this.chkActive.Size = new System.Drawing.Size(73, 17);
            this.chkActive.TabIndex = 11;
            this.chkActive.Text = "Habilitado";
            this.chkActive.UseVisualStyleBackColor = true;
            this.chkActive.CheckedChanged += new System.EventHandler(this.chkActive_CheckedChanged);
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(105, 209);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 23);
            this.btnAceptar.TabIndex = 21;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(186, 209);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 22;
            this.btnCancel.Text = "Cancelar";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // txbUname
            // 
            this.txbUname.Location = new System.Drawing.Point(88, 48);
            this.txbUname.MaxLength = 50;
            this.txbUname.Name = "txbUname";
            this.txbUname.Size = new System.Drawing.Size(249, 20);
            this.txbUname.TabIndex = 1;
            // 
            // txbPass
            // 
            this.txbPass.Location = new System.Drawing.Point(137, 78);
            this.txbPass.MaxLength = 15;
            this.txbPass.Name = "txbPass";
            this.txbPass.PasswordChar = '*';
            this.txbPass.Size = new System.Drawing.Size(200, 20);
            this.txbPass.TabIndex = 4;
            this.txbPass.TextChanged += new System.EventHandler(this.txbPass_TextChanged);
            // 
            // txbPass2
            // 
            this.txbPass2.Location = new System.Drawing.Point(137, 100);
            this.txbPass2.MaxLength = 15;
            this.txbPass2.Name = "txbPass2";
            this.txbPass2.PasswordChar = '*';
            this.txbPass2.Size = new System.Drawing.Size(200, 20);
            this.txbPass2.TabIndex = 5;
            // 
            // lblPass2
            // 
            this.lblPass2.AutoSize = true;
            this.lblPass2.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblPass2.Location = new System.Drawing.Point(16, 103);
            this.lblPass2.Name = "lblPass2";
            this.lblPass2.Size = new System.Drawing.Size(115, 13);
            this.lblPass2.TabIndex = 36;
            this.lblPass2.Text = "Reingrese Contraseña:";
            // 
            // lblAdvise
            // 
            this.lblAdvise.AutoSize = true;
            this.lblAdvise.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAdvise.ForeColor = System.Drawing.Color.Red;
            this.lblAdvise.Location = new System.Drawing.Point(16, 170);
            this.lblAdvise.Name = "lblAdvise";
            this.lblAdvise.Size = new System.Drawing.Size(316, 13);
            this.lblAdvise.TabIndex = 39;
            this.lblAdvise.Text = "* Nota, los campos resaltados en rojo son obligatorios.";
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(257, 8);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(75, 23);
            this.btnClear.TabIndex = 20;
            this.btnClear.Text = "Limpiar";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // rbCliente
            // 
            this.rbCliente.AutoSize = true;
            this.rbCliente.Location = new System.Drawing.Point(137, 132);
            this.rbCliente.Name = "rbCliente";
            this.rbCliente.Size = new System.Drawing.Size(57, 17);
            this.rbCliente.TabIndex = 40;
            this.rbCliente.TabStop = true;
            this.rbCliente.Text = "Cliente";
            this.rbCliente.UseVisualStyleBackColor = true;
            // 
            // rbEmpresa
            // 
            this.rbEmpresa.AutoSize = true;
            this.rbEmpresa.Location = new System.Drawing.Point(228, 131);
            this.rbEmpresa.Name = "rbEmpresa";
            this.rbEmpresa.Size = new System.Drawing.Size(66, 17);
            this.rbEmpresa.TabIndex = 41;
            this.rbEmpresa.TabStop = true;
            this.rbEmpresa.Text = "Empresa";
            this.rbEmpresa.UseVisualStyleBackColor = true;
            // 
            // FrmModUser
            // 
            this.AcceptButton = this.btnAceptar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(355, 253);
            this.Controls.Add(this.rbEmpresa);
            this.Controls.Add(this.rbCliente);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.lblAdvise);
            this.Controls.Add(this.txbPass2);
            this.Controls.Add(this.lblPass2);
            this.Controls.Add(this.txbPass);
            this.Controls.Add(this.txbUname);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.chkActive);
            this.Controls.Add(this.lblPass);
            this.Controls.Add(this.lblUsername);
            this.Controls.Add(this.lblID);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmModUser";
            this.Text = "Alta/Modificacion Usuario";
            this.Load += new System.EventHandler(this.FrmModUser_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblID;
        private System.Windows.Forms.Label lblUsername;
        private System.Windows.Forms.Label lblPass;
        private System.Windows.Forms.CheckBox chkActive;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.TextBox txbUname;
        private System.Windows.Forms.TextBox txbPass;
        private System.Windows.Forms.TextBox txbPass2;
        private System.Windows.Forms.Label lblPass2;
        private System.Windows.Forms.Label lblAdvise;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.RadioButton rbCliente;
        private System.Windows.Forms.RadioButton rbEmpresa;
    }
}