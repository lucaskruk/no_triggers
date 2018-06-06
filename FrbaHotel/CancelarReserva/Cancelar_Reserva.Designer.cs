namespace FrbaHotel.CancelarReserva
{
    partial class Cancelar_Reserva
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Cancelar_Reserva));
            this.button1 = new System.Windows.Forms.Button();
            this.Atrás = new System.Windows.Forms.Button();
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.Motivos_De_cancelacion = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.LightSeaGreen;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button1.Location = new System.Drawing.Point(345, 201);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(211, 42);
            this.button1.TabIndex = 27;
            this.button1.Text = "Cancelar reserva";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // Atrás
            // 
            this.Atrás.BackColor = System.Drawing.Color.LightSeaGreen;
            this.Atrás.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Atrás.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Atrás.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Atrás.Location = new System.Drawing.Point(143, 201);
            this.Atrás.Name = "Atrás";
            this.Atrás.Size = new System.Drawing.Size(196, 42);
            this.Atrás.TabIndex = 26;
            this.Atrás.Text = "Atrás";
            this.Atrás.UseVisualStyleBackColor = false;
            // 
            // Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo
            // 
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Location = new System.Drawing.Point(143, 18);
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Name = "Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo";
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Size = new System.Drawing.Size(100, 20);
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.TabIndex = 24;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(44, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 13);
            this.label1.TabIndex = 23;
            this.label1.Text = "Código de reserva";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(22, 70);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(115, 13);
            this.label3.TabIndex = 30;
            this.label3.Text = "Motivo de cancelación";
            // 
            // Motivos_De_cancelacion
            // 
            this.Motivos_De_cancelacion.Location = new System.Drawing.Point(143, 63);
            this.Motivos_De_cancelacion.Multiline = true;
            this.Motivos_De_cancelacion.Name = "Motivos_De_cancelacion";
            this.Motivos_De_cancelacion.Size = new System.Drawing.Size(413, 132);
            this.Motivos_De_cancelacion.TabIndex = 31;
            // 
            // Cancelar_Reserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(654, 261);
            this.Controls.Add(this.Motivos_De_cancelacion);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.Atrás);
            this.Controls.Add(this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Cancelar_Reserva";
            this.Text = "Cancelar reserva- FRBA hotel";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button Atrás;
        private System.Windows.Forms.TextBox Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox Motivos_De_cancelacion;
    }
}