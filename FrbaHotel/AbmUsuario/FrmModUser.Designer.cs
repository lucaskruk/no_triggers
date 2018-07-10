namespace FrbaHotel.AbmUsuario
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
            this.lblName = new System.Windows.Forms.Label();
            this.lblApell = new System.Windows.Forms.Label();
            this.lblPass = new System.Windows.Forms.Label();
            this.lblMail = new System.Windows.Forms.Label();
            this.lblNac = new System.Windows.Forms.Label();
            this.lblTipo = new System.Windows.Forms.Label();
            this.lblNDoc = new System.Windows.Forms.Label();
            this.lblTel = new System.Windows.Forms.Label();
            this.chkActive = new System.Windows.Forms.CheckBox();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.txbUname = new System.Windows.Forms.TextBox();
            this.txbName = new System.Windows.Forms.TextBox();
            this.txbApell = new System.Windows.Forms.TextBox();
            this.txbPass = new System.Windows.Forms.TextBox();
            this.txbMail = new System.Windows.Forms.TextBox();
            this.txbNac = new System.Windows.Forms.TextBox();
            this.txbDoc = new System.Windows.Forms.TextBox();
            this.txbPhone = new System.Windows.Forms.TextBox();
            this.btnSel = new System.Windows.Forms.Button();
            this.cbxTdoc = new System.Windows.Forms.ComboBox();
            this.lbxAgregaRol = new System.Windows.Forms.ListBox();
            this.lbxAgregaHotel = new System.Windows.Forms.ListBox();
            this.cbxAgregaRol = new System.Windows.Forms.ComboBox();
            this.cbxAgregaHotel = new System.Windows.Forms.ComboBox();
            this.btnAgregaHotel = new System.Windows.Forms.Button();
            this.btnAgregaRol = new System.Windows.Forms.Button();
            this.btnQuitaRol = new System.Windows.Forms.Button();
            this.cbxQuitaRol = new System.Windows.Forms.ComboBox();
            this.lbxQuitaRol = new System.Windows.Forms.ListBox();
            this.btnQuitaHotel = new System.Windows.Forms.Button();
            this.cbxQuitaHotel = new System.Windows.Forms.ComboBox();
            this.lbxQuitaHotel = new System.Windows.Forms.ListBox();
            this.txbPass2 = new System.Windows.Forms.TextBox();
            this.lblPass2 = new System.Windows.Forms.Label();
            this.mCal = new System.Windows.Forms.MonthCalendar();
            this.lblAdvise = new System.Windows.Forms.Label();
            this.btnClear = new System.Windows.Forms.Button();
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
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.ForeColor = System.Drawing.Color.Red;
            this.lblName.Location = new System.Drawing.Point(16, 81);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(47, 13);
            this.lblName.TabIndex = 2;
            this.lblName.Text = "Nombre:";
            // 
            // lblApell
            // 
            this.lblApell.AutoSize = true;
            this.lblApell.ForeColor = System.Drawing.Color.Red;
            this.lblApell.Location = new System.Drawing.Point(181, 81);
            this.lblApell.Name = "lblApell";
            this.lblApell.Size = new System.Drawing.Size(50, 13);
            this.lblApell.TabIndex = 3;
            this.lblApell.Text = "Apellido: ";
            // 
            // lblPass
            // 
            this.lblPass.AutoSize = true;
            this.lblPass.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblPass.Location = new System.Drawing.Point(16, 111);
            this.lblPass.Name = "lblPass";
            this.lblPass.Size = new System.Drawing.Size(67, 13);
            this.lblPass.TabIndex = 4;
            this.lblPass.Text = "Contraseña: ";
            // 
            // lblMail
            // 
            this.lblMail.AutoSize = true;
            this.lblMail.ForeColor = System.Drawing.Color.Red;
            this.lblMail.Location = new System.Drawing.Point(16, 161);
            this.lblMail.Name = "lblMail";
            this.lblMail.Size = new System.Drawing.Size(35, 13);
            this.lblMail.TabIndex = 5;
            this.lblMail.Text = "Email:";
            this.lblMail.Click += new System.EventHandler(this.lblMail_Click);
            // 
            // lblNac
            // 
            this.lblNac.AutoSize = true;
            this.lblNac.ForeColor = System.Drawing.Color.Red;
            this.lblNac.Location = new System.Drawing.Point(16, 190);
            this.lblNac.Name = "lblNac";
            this.lblNac.Size = new System.Drawing.Size(66, 13);
            this.lblNac.TabIndex = 6;
            this.lblNac.Text = "Fecha Nac.:";
            this.lblNac.Click += new System.EventHandler(this.lblNac_Click);
            // 
            // lblTipo
            // 
            this.lblTipo.AutoSize = true;
            this.lblTipo.ForeColor = System.Drawing.Color.Red;
            this.lblTipo.Location = new System.Drawing.Point(16, 220);
            this.lblTipo.Name = "lblTipo";
            this.lblTipo.Size = new System.Drawing.Size(57, 13);
            this.lblTipo.TabIndex = 7;
            this.lblTipo.Text = "Tipo Doc.:";
            this.lblTipo.Click += new System.EventHandler(this.lblTipo_Click);
            // 
            // lblNDoc
            // 
            this.lblNDoc.AutoSize = true;
            this.lblNDoc.ForeColor = System.Drawing.Color.Red;
            this.lblNDoc.Location = new System.Drawing.Point(183, 220);
            this.lblNDoc.Name = "lblNDoc";
            this.lblNDoc.Size = new System.Drawing.Size(48, 13);
            this.lblNDoc.TabIndex = 8;
            this.lblNDoc.Text = "Nº Doc.:";
            this.lblNDoc.Click += new System.EventHandler(this.lblNDoc_Click);
            // 
            // lblTel
            // 
            this.lblTel.AutoSize = true;
            this.lblTel.ForeColor = System.Drawing.Color.Red;
            this.lblTel.Location = new System.Drawing.Point(16, 254);
            this.lblTel.Name = "lblTel";
            this.lblTel.Size = new System.Drawing.Size(52, 13);
            this.lblTel.TabIndex = 9;
            this.lblTel.Text = "Teléfono:";
            this.lblTel.Click += new System.EventHandler(this.lblTel_Click);
            // 
            // chkActive
            // 
            this.chkActive.AutoSize = true;
            this.chkActive.Location = new System.Drawing.Point(19, 283);
            this.chkActive.Name = "chkActive";
            this.chkActive.Size = new System.Drawing.Size(73, 17);
            this.chkActive.TabIndex = 10;
            this.chkActive.Text = "Habilitado";
            this.chkActive.UseVisualStyleBackColor = true;
            this.chkActive.CheckedChanged += new System.EventHandler(this.chkActive_CheckedChanged);
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(88, 469);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(75, 23);
            this.btnAceptar.TabIndex = 12;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(169, 469);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 13;
            this.btnCancel.Text = "Cancelar";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // txbUname
            // 
            this.txbUname.Location = new System.Drawing.Point(88, 48);
            this.txbUname.Name = "txbUname";
            this.txbUname.Size = new System.Drawing.Size(249, 20);
            this.txbUname.TabIndex = 14;
            // 
            // txbName
            // 
            this.txbName.Location = new System.Drawing.Point(88, 78);
            this.txbName.Name = "txbName";
            this.txbName.Size = new System.Drawing.Size(87, 20);
            this.txbName.TabIndex = 15;
            // 
            // txbApell
            // 
            this.txbApell.Location = new System.Drawing.Point(235, 78);
            this.txbApell.Name = "txbApell";
            this.txbApell.Size = new System.Drawing.Size(100, 20);
            this.txbApell.TabIndex = 16;
            // 
            // txbPass
            // 
            this.txbPass.Location = new System.Drawing.Point(137, 108);
            this.txbPass.Name = "txbPass";
            this.txbPass.PasswordChar = '*';
            this.txbPass.Size = new System.Drawing.Size(200, 20);
            this.txbPass.TabIndex = 17;
            // 
            // txbMail
            // 
            this.txbMail.Location = new System.Drawing.Point(88, 158);
            this.txbMail.Name = "txbMail";
            this.txbMail.Size = new System.Drawing.Size(249, 20);
            this.txbMail.TabIndex = 18;
            // 
            // txbNac
            // 
            this.txbNac.Enabled = false;
            this.txbNac.Location = new System.Drawing.Point(88, 187);
            this.txbNac.Name = "txbNac";
            this.txbNac.Size = new System.Drawing.Size(110, 20);
            this.txbNac.TabIndex = 19;
            // 
            // txbDoc
            // 
            this.txbDoc.Location = new System.Drawing.Point(237, 217);
            this.txbDoc.Name = "txbDoc";
            this.txbDoc.Size = new System.Drawing.Size(100, 20);
            this.txbDoc.TabIndex = 20;
            this.txbDoc.TextChanged += new System.EventHandler(this.txbDoc_TextChanged);
            this.txbDoc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txbDoc_KeyPress);
            // 
            // txbPhone
            // 
            this.txbPhone.Location = new System.Drawing.Point(88, 251);
            this.txbPhone.Name = "txbPhone";
            this.txbPhone.Size = new System.Drawing.Size(249, 20);
            this.txbPhone.TabIndex = 21;
            this.txbPhone.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txbPhone_KeyPress);
            // 
            // btnSel
            // 
            this.btnSel.Location = new System.Drawing.Point(237, 184);
            this.btnSel.Name = "btnSel";
            this.btnSel.Size = new System.Drawing.Size(100, 23);
            this.btnSel.TabIndex = 22;
            this.btnSel.Text = "Seleccionar";
            this.btnSel.UseVisualStyleBackColor = true;
            this.btnSel.Click += new System.EventHandler(this.btnSel_Click);
            // 
            // cbxTdoc
            // 
            this.cbxTdoc.FormattingEnabled = true;
            this.cbxTdoc.Location = new System.Drawing.Point(88, 217);
            this.cbxTdoc.Name = "cbxTdoc";
            this.cbxTdoc.Size = new System.Drawing.Size(87, 21);
            this.cbxTdoc.TabIndex = 23;
            this.cbxTdoc.SelectedIndexChanged += new System.EventHandler(this.cbxTdoc_SelectedIndexChanged);
            // 
            // lbxAgregaRol
            // 
            this.lbxAgregaRol.FormattingEnabled = true;
            this.lbxAgregaRol.Location = new System.Drawing.Point(19, 368);
            this.lbxAgregaRol.Name = "lbxAgregaRol";
            this.lbxAgregaRol.Size = new System.Drawing.Size(144, 95);
            this.lbxAgregaRol.TabIndex = 24;
            this.lbxAgregaRol.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // lbxAgregaHotel
            // 
            this.lbxAgregaHotel.FormattingEnabled = true;
            this.lbxAgregaHotel.Location = new System.Drawing.Point(186, 368);
            this.lbxAgregaHotel.Name = "lbxAgregaHotel";
            this.lbxAgregaHotel.Size = new System.Drawing.Size(151, 95);
            this.lbxAgregaHotel.TabIndex = 25;
            this.lbxAgregaHotel.SelectedIndexChanged += new System.EventHandler(this.lbxAgregaHotel_SelectedIndexChanged);
            // 
            // cbxAgregaRol
            // 
            this.cbxAgregaRol.FormattingEnabled = true;
            this.cbxAgregaRol.Location = new System.Drawing.Point(19, 315);
            this.cbxAgregaRol.Name = "cbxAgregaRol";
            this.cbxAgregaRol.Size = new System.Drawing.Size(144, 21);
            this.cbxAgregaRol.TabIndex = 26;
            this.cbxAgregaRol.SelectedIndexChanged += new System.EventHandler(this.cbxAgregaRol_SelectedIndexChanged);
            // 
            // cbxAgregaHotel
            // 
            this.cbxAgregaHotel.FormattingEnabled = true;
            this.cbxAgregaHotel.Location = new System.Drawing.Point(184, 315);
            this.cbxAgregaHotel.Name = "cbxAgregaHotel";
            this.cbxAgregaHotel.Size = new System.Drawing.Size(151, 21);
            this.cbxAgregaHotel.TabIndex = 27;
            this.cbxAgregaHotel.SelectedIndexChanged += new System.EventHandler(this.cbxAgregaHotel_SelectedIndexChanged);
            // 
            // btnAgregaHotel
            // 
            this.btnAgregaHotel.Location = new System.Drawing.Point(184, 339);
            this.btnAgregaHotel.Name = "btnAgregaHotel";
            this.btnAgregaHotel.Size = new System.Drawing.Size(153, 23);
            this.btnAgregaHotel.TabIndex = 28;
            this.btnAgregaHotel.Text = "Agregar Hotel";
            this.btnAgregaHotel.UseVisualStyleBackColor = true;
            this.btnAgregaHotel.Click += new System.EventHandler(this.btnAgregaHotel_Click);
            // 
            // btnAgregaRol
            // 
            this.btnAgregaRol.Location = new System.Drawing.Point(19, 339);
            this.btnAgregaRol.Name = "btnAgregaRol";
            this.btnAgregaRol.Size = new System.Drawing.Size(144, 23);
            this.btnAgregaRol.TabIndex = 29;
            this.btnAgregaRol.Text = "Agregar Rol";
            this.btnAgregaRol.UseVisualStyleBackColor = true;
            this.btnAgregaRol.Click += new System.EventHandler(this.btnAgregaRol_Click);
            // 
            // btnQuitaRol
            // 
            this.btnQuitaRol.Location = new System.Drawing.Point(363, 67);
            this.btnQuitaRol.Name = "btnQuitaRol";
            this.btnQuitaRol.Size = new System.Drawing.Size(144, 23);
            this.btnQuitaRol.TabIndex = 32;
            this.btnQuitaRol.Text = "Quitar Rol";
            this.btnQuitaRol.UseVisualStyleBackColor = true;
            this.btnQuitaRol.Click += new System.EventHandler(this.btnQuitaRol_Click);
            // 
            // cbxQuitaRol
            // 
            this.cbxQuitaRol.FormattingEnabled = true;
            this.cbxQuitaRol.Location = new System.Drawing.Point(363, 43);
            this.cbxQuitaRol.Name = "cbxQuitaRol";
            this.cbxQuitaRol.Size = new System.Drawing.Size(144, 21);
            this.cbxQuitaRol.TabIndex = 31;
            // 
            // lbxQuitaRol
            // 
            this.lbxQuitaRol.FormattingEnabled = true;
            this.lbxQuitaRol.Location = new System.Drawing.Point(363, 96);
            this.lbxQuitaRol.Name = "lbxQuitaRol";
            this.lbxQuitaRol.Size = new System.Drawing.Size(144, 95);
            this.lbxQuitaRol.TabIndex = 30;
            // 
            // btnQuitaHotel
            // 
            this.btnQuitaHotel.Location = new System.Drawing.Point(363, 238);
            this.btnQuitaHotel.Name = "btnQuitaHotel";
            this.btnQuitaHotel.Size = new System.Drawing.Size(144, 23);
            this.btnQuitaHotel.TabIndex = 35;
            this.btnQuitaHotel.Text = "Quitar Hotel";
            this.btnQuitaHotel.UseVisualStyleBackColor = true;
            this.btnQuitaHotel.Click += new System.EventHandler(this.btnQuitaHotel_Click);
            // 
            // cbxQuitaHotel
            // 
            this.cbxQuitaHotel.FormattingEnabled = true;
            this.cbxQuitaHotel.Location = new System.Drawing.Point(363, 212);
            this.cbxQuitaHotel.Name = "cbxQuitaHotel";
            this.cbxQuitaHotel.Size = new System.Drawing.Size(144, 21);
            this.cbxQuitaHotel.TabIndex = 34;
            // 
            // lbxQuitaHotel
            // 
            this.lbxQuitaHotel.FormattingEnabled = true;
            this.lbxQuitaHotel.Location = new System.Drawing.Point(363, 267);
            this.lbxQuitaHotel.Name = "lbxQuitaHotel";
            this.lbxQuitaHotel.Size = new System.Drawing.Size(144, 95);
            this.lbxQuitaHotel.TabIndex = 33;
            // 
            // txbPass2
            // 
            this.txbPass2.Location = new System.Drawing.Point(137, 130);
            this.txbPass2.Name = "txbPass2";
            this.txbPass2.PasswordChar = '*';
            this.txbPass2.Size = new System.Drawing.Size(200, 20);
            this.txbPass2.TabIndex = 37;
            // 
            // lblPass2
            // 
            this.lblPass2.AutoSize = true;
            this.lblPass2.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblPass2.Location = new System.Drawing.Point(16, 133);
            this.lblPass2.Name = "lblPass2";
            this.lblPass2.Size = new System.Drawing.Size(115, 13);
            this.lblPass2.TabIndex = 36;
            this.lblPass2.Text = "Reingrese Contraseña:";
            // 
            // mCal
            // 
            this.mCal.Location = new System.Drawing.Point(235, 212);
            this.mCal.MaxDate = new System.DateTime(2099, 12, 31, 0, 0, 0, 0);
            this.mCal.MaxSelectionCount = 1;
            this.mCal.MinDate = new System.DateTime(1908, 1, 1, 0, 0, 0, 0);
            this.mCal.Name = "mCal";
            this.mCal.TabIndex = 38;
            this.mCal.Visible = false;
            this.mCal.DateSelected += new System.Windows.Forms.DateRangeEventHandler(this.mCal_DateSelected);
            // 
            // lblAdvise
            // 
            this.lblAdvise.AutoSize = true;
            this.lblAdvise.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAdvise.ForeColor = System.Drawing.Color.Red;
            this.lblAdvise.Location = new System.Drawing.Point(16, 507);
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
            this.btnClear.TabIndex = 40;
            this.btnClear.Text = "Limpiar";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // FrmModUser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(539, 529);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.lblAdvise);
            this.Controls.Add(this.mCal);
            this.Controls.Add(this.txbPass2);
            this.Controls.Add(this.lblPass2);
            this.Controls.Add(this.btnQuitaHotel);
            this.Controls.Add(this.cbxQuitaHotel);
            this.Controls.Add(this.lbxQuitaHotel);
            this.Controls.Add(this.btnQuitaRol);
            this.Controls.Add(this.cbxQuitaRol);
            this.Controls.Add(this.lbxQuitaRol);
            this.Controls.Add(this.btnAgregaRol);
            this.Controls.Add(this.btnAgregaHotel);
            this.Controls.Add(this.cbxAgregaHotel);
            this.Controls.Add(this.cbxAgregaRol);
            this.Controls.Add(this.lbxAgregaHotel);
            this.Controls.Add(this.lbxAgregaRol);
            this.Controls.Add(this.cbxTdoc);
            this.Controls.Add(this.btnSel);
            this.Controls.Add(this.txbPhone);
            this.Controls.Add(this.txbDoc);
            this.Controls.Add(this.txbNac);
            this.Controls.Add(this.txbMail);
            this.Controls.Add(this.txbPass);
            this.Controls.Add(this.txbApell);
            this.Controls.Add(this.txbName);
            this.Controls.Add(this.txbUname);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.chkActive);
            this.Controls.Add(this.lblTel);
            this.Controls.Add(this.lblNDoc);
            this.Controls.Add(this.lblTipo);
            this.Controls.Add(this.lblNac);
            this.Controls.Add(this.lblMail);
            this.Controls.Add(this.lblPass);
            this.Controls.Add(this.lblApell);
            this.Controls.Add(this.lblName);
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
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label lblApell;
        private System.Windows.Forms.Label lblPass;
        private System.Windows.Forms.Label lblMail;
        private System.Windows.Forms.Label lblNac;
        private System.Windows.Forms.Label lblTipo;
        private System.Windows.Forms.Label lblNDoc;
        private System.Windows.Forms.Label lblTel;
        private System.Windows.Forms.CheckBox chkActive;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.TextBox txbUname;
        private System.Windows.Forms.TextBox txbName;
        private System.Windows.Forms.TextBox txbApell;
        private System.Windows.Forms.TextBox txbPass;
        private System.Windows.Forms.TextBox txbMail;
        private System.Windows.Forms.TextBox txbNac;
        private System.Windows.Forms.TextBox txbDoc;
        private System.Windows.Forms.TextBox txbPhone;
        private System.Windows.Forms.Button btnSel;
        private System.Windows.Forms.ComboBox cbxTdoc;
        private System.Windows.Forms.ListBox lbxAgregaRol;
        private System.Windows.Forms.ListBox lbxAgregaHotel;
        private System.Windows.Forms.ComboBox cbxAgregaRol;
        private System.Windows.Forms.ComboBox cbxAgregaHotel;
        private System.Windows.Forms.Button btnAgregaHotel;
        private System.Windows.Forms.Button btnAgregaRol;
        private System.Windows.Forms.Button btnQuitaRol;
        private System.Windows.Forms.ComboBox cbxQuitaRol;
        private System.Windows.Forms.ListBox lbxQuitaRol;
        private System.Windows.Forms.Button btnQuitaHotel;
        private System.Windows.Forms.ComboBox cbxQuitaHotel;
        private System.Windows.Forms.ListBox lbxQuitaHotel;
        private System.Windows.Forms.TextBox txbPass2;
        private System.Windows.Forms.Label lblPass2;
        private System.Windows.Forms.MonthCalendar mCal;
        private System.Windows.Forms.Label lblAdvise;
        private System.Windows.Forms.Button btnClear;
    }
}