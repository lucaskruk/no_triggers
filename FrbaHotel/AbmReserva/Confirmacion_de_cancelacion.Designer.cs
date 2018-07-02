namespace FrbaHotel.GenerarModificacionReserva
{
    partial class Confirmacion_de_reserva
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Confirmacion_de_reserva));
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.reservar_otra_habitacion = new System.Windows.Forms.Button();
            this.menu_principal_para_usuario = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label2.Location = new System.Drawing.Point(166, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(298, 24);
            this.label2.TabIndex = 13;
            this.label2.Text = "¡Su reserva ha sido cancelada!";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(177, 67);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(287, 13);
            this.label4.TabIndex = 16;
            this.label4.Text = "Esperamos tenerlo entre nuestros huéspedes próximamente";
            // 
            // reservar_otra_habitacion
            // 
            this.reservar_otra_habitacion.BackColor = System.Drawing.Color.LightSeaGreen;
            this.reservar_otra_habitacion.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.reservar_otra_habitacion.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.reservar_otra_habitacion.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.reservar_otra_habitacion.Location = new System.Drawing.Point(107, 176);
            this.reservar_otra_habitacion.Name = "reservar_otra_habitacion";
            this.reservar_otra_habitacion.Size = new System.Drawing.Size(179, 39);
            this.reservar_otra_habitacion.TabIndex = 23;
            this.reservar_otra_habitacion.Text = "Reservar otra vez";
            this.reservar_otra_habitacion.UseVisualStyleBackColor = false;
            // 
            // menu_principal_para_usuario
            // 
            this.menu_principal_para_usuario.BackColor = System.Drawing.Color.LightSeaGreen;
            this.menu_principal_para_usuario.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.menu_principal_para_usuario.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menu_principal_para_usuario.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.menu_principal_para_usuario.Location = new System.Drawing.Point(317, 176);
            this.menu_principal_para_usuario.Name = "menu_principal_para_usuario";
            this.menu_principal_para_usuario.Size = new System.Drawing.Size(179, 39);
            this.menu_principal_para_usuario.TabIndex = 24;
            this.menu_principal_para_usuario.Text = "Ir al menú principal";
            this.menu_principal_para_usuario.UseVisualStyleBackColor = false;
            // 
            // Confirmacion_de_reserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(653, 261);
            this.Controls.Add(this.menu_principal_para_usuario);
            this.Controls.Add(this.reservar_otra_habitacion);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Confirmacion_de_reserva";
            this.Text = "Reserva cancelada- FRBA hotel";
            this.Load += new System.EventHandler(this.Confirmacion_de_reserva_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button reservar_otra_habitacion;
        private System.Windows.Forms.Button menu_principal_para_usuario;
    }
}