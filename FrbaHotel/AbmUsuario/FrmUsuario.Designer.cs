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
            this.SuspendLayout();
            // 
            // btnAlta
            // 
            this.btnAlta.Location = new System.Drawing.Point(86, 29);
            this.btnAlta.Name = "btnAlta";
            this.btnAlta.Size = new System.Drawing.Size(125, 45);
            this.btnAlta.TabIndex = 0;
            this.btnAlta.Text = "Alta";
            this.btnAlta.UseVisualStyleBackColor = true;
            this.btnAlta.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnBaja
            // 
            this.btnBaja.Location = new System.Drawing.Point(86, 85);
            this.btnBaja.Name = "btnBaja";
            this.btnBaja.Size = new System.Drawing.Size(125, 45);
            this.btnBaja.TabIndex = 1;
            this.btnBaja.Text = "Baja";
            this.btnBaja.UseVisualStyleBackColor = true;
            this.btnBaja.Click += new System.EventHandler(this.btnBaja_Click);
            // 
            // btnModif
            // 
            this.btnModif.Location = new System.Drawing.Point(86, 141);
            this.btnModif.Name = "btnModif";
            this.btnModif.Size = new System.Drawing.Size(125, 45);
            this.btnModif.TabIndex = 2;
            this.btnModif.Text = "Modificación";
            this.btnModif.UseVisualStyleBackColor = true;
            this.btnModif.Click += new System.EventHandler(this.btnModif_Click);
            // 
            // FrmUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(291, 215);
            this.Controls.Add(this.btnModif);
            this.Controls.Add(this.btnBaja);
            this.Controls.Add(this.btnAlta);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmUsuario";
            this.Text = "Administracion de Usuarios";
            this.Load += new System.EventHandler(this.FrmUsuario_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnAlta;
        private System.Windows.Forms.Button btnBaja;
        private System.Windows.Forms.Button btnModif;
    }
}