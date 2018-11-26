namespace PalcoNet.Login
{
    partial class Frm_Sel_Rol
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Frm_Sel_Rol));
            this.seleccionaRol = new System.Windows.Forms.Button();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.lblRol = new System.Windows.Forms.Label();
            this.cbxRol = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // seleccionaRol
            // 
            this.seleccionaRol.BackColor = System.Drawing.Color.LightSeaGreen;
            this.seleccionaRol.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.seleccionaRol.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.seleccionaRol.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.seleccionaRol.Location = new System.Drawing.Point(99, 98);
            this.seleccionaRol.Name = "seleccionaRol";
            this.seleccionaRol.Size = new System.Drawing.Size(243, 51);
            this.seleccionaRol.TabIndex = 13;
            this.seleccionaRol.Text = "Seleccionar";
            this.seleccionaRol.UseVisualStyleBackColor = false;
            this.seleccionaRol.Click += new System.EventHandler(this.seleccionaRol_Click);
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Location = new System.Drawing.Point(13, 13);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(49, 13);
            this.lblUsuario.TabIndex = 14;
            this.lblUsuario.Text = "Usuario: ";
            // 
            // lblRol
            // 
            this.lblRol.AutoSize = true;
            this.lblRol.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRol.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lblRol.Location = new System.Drawing.Point(31, 41);
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(167, 16);
            this.lblRol.TabIndex = 15;
            this.lblRol.Text = "Por favor, seleccione rol :";
            // 
            // cbxRol
            // 
            this.cbxRol.FormattingEnabled = true;
            this.cbxRol.Location = new System.Drawing.Point(221, 41);
            this.cbxRol.Name = "cbxRol";
            this.cbxRol.Size = new System.Drawing.Size(121, 21);
            this.cbxRol.TabIndex = 16;
            this.cbxRol.SelectedIndexChanged += new System.EventHandler(this.cbxRol_SelectedIndexChanged);
            // 
            // Frm_Sel_Rol
            // 
            this.AcceptButton = this.seleccionaRol;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(437, 216);
            this.Controls.Add(this.cbxRol);
            this.Controls.Add(this.lblRol);
            this.Controls.Add(this.lblUsuario);
            this.Controls.Add(this.seleccionaRol);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Frm_Sel_Rol";
            this.Text = "Login para personal - FRBA hotel";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Frm_Sel_Rol_FormClosing);
            this.Load += new System.EventHandler(this.Frm_Sel_Rol_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button seleccionaRol;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblRol;
        private System.Windows.Forms.ComboBox cbxRol;
    }
}