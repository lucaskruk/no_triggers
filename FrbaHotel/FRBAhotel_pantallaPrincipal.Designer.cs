namespace FrbaHotel
{
    partial class FRBAhotel_pantallaPrincipal
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FRBAhotel_pantallaPrincipal));
            this.Ingresar_para_huespedes = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.Ingresar_hotel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Ingresar_para_huespedes
            // 
            this.Ingresar_para_huespedes.BackColor = System.Drawing.Color.LightSeaGreen;
            this.Ingresar_para_huespedes.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Ingresar_para_huespedes.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Ingresar_para_huespedes.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Ingresar_para_huespedes.Location = new System.Drawing.Point(54, 138);
            this.Ingresar_para_huespedes.Name = "Ingresar_para_huespedes";
            this.Ingresar_para_huespedes.Size = new System.Drawing.Size(243, 51);
            this.Ingresar_para_huespedes.TabIndex = 6;
            this.Ingresar_para_huespedes.Text = "Ingreso huespedes";
            this.Ingresar_para_huespedes.UseVisualStyleBackColor = false;
            this.Ingresar_para_huespedes.Click += new System.EventHandler(this.Ingresar_para_huespedes_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Lucida Sans Unicode", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(185, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(281, 25);
            this.label2.TabIndex = 9;
            this.label2.Text = "Bienvenido a FRBA hotel";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label1.Location = new System.Drawing.Point(202, 63);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(264, 16);
            this.label1.TabIndex = 10;
            this.label1.Text = "Por favor, seleccione la opción adecuada";
            // 
            // Ingresar_hotel
            // 
            this.Ingresar_hotel.BackColor = System.Drawing.Color.LightSeaGreen;
            this.Ingresar_hotel.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Ingresar_hotel.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Ingresar_hotel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Ingresar_hotel.Location = new System.Drawing.Point(337, 138);
            this.Ingresar_hotel.Name = "Ingresar_hotel";
            this.Ingresar_hotel.Size = new System.Drawing.Size(243, 51);
            this.Ingresar_hotel.TabIndex = 11;
            this.Ingresar_hotel.Text = "Ingreso personal del hotel";
            this.Ingresar_hotel.UseVisualStyleBackColor = false;
            this.Ingresar_hotel.Click += new System.EventHandler(this.Ingresar_hotel_Click);
            // 
            // FRBAhotel_pantallaPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(637, 261);
            this.Controls.Add(this.Ingresar_hotel);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Ingresar_para_huespedes);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FRBAhotel_pantallaPrincipal";
            this.Text = "FRBA hotel";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Ingresar_para_huespedes;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Ingresar_hotel;

    }
}

