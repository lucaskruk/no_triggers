namespace FrbaHotel.GenerarModificacionReserva
{
    partial class Ver_disponibilidad
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Ver_disponibilidad));
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.reservar_opcion = new System.Windows.Forms.Button();
            this.atras = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(192, 32);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(240, 150);
            this.dataGridView1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label1.Location = new System.Drawing.Point(12, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(288, 16);
            this.label1.TabIndex = 11;
            this.label1.Text = "Seleccionar la opción deseada para reservar";
            // 
            // reservar_opcion
            // 
            this.reservar_opcion.BackColor = System.Drawing.Color.LightSeaGreen;
            this.reservar_opcion.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.reservar_opcion.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.reservar_opcion.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.reservar_opcion.Location = new System.Drawing.Point(102, 200);
            this.reservar_opcion.Name = "reservar_opcion";
            this.reservar_opcion.Size = new System.Drawing.Size(179, 39);
            this.reservar_opcion.TabIndex = 22;
            this.reservar_opcion.Text = "Reservar";
            this.reservar_opcion.UseVisualStyleBackColor = false;
            // 
            // atras
            // 
            this.atras.BackColor = System.Drawing.Color.LightSeaGreen;
            this.atras.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.atras.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.atras.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.atras.Location = new System.Drawing.Point(343, 200);
            this.atras.Name = "atras";
            this.atras.Size = new System.Drawing.Size(179, 39);
            this.atras.TabIndex = 23;
            this.atras.Text = "Atrás";
            this.atras.UseVisualStyleBackColor = false;
            // 
            // Ver_disponibilidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(653, 261);
            this.Controls.Add(this.atras);
            this.Controls.Add(this.reservar_opcion);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Ver_disponibilidad";
            this.Text = "Disponibilidad - Hotel FRBA";
            this.Load += new System.EventHandler(this.Ver_disponibilidad_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button reservar_opcion;
        private System.Windows.Forms.Button atras;

    }
}