namespace FrbaHotel.GenerarModificacionReserva
{
    partial class Modificar_reserva
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Modificar_reserva));
            this.label1 = new System.Windows.Forms.Label();
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.mostrar_tipo_regimen = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.Mostrar_tipo_habitacion = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.cantidad_de_personas = new System.Windows.Forms.NumericUpDown();
            this.label5 = new System.Windows.Forms.Label();
            this.mostrar_hotel_solo_usuario_guest = new System.Windows.Forms.ComboBox();
            this.Atrás = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cantidad_de_personas)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 13);
            this.label1.TabIndex = 15;
            this.label1.Text = "Código de reserva";
            // 
            // Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo
            // 
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Location = new System.Drawing.Point(120, 6);
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Name = "Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo";
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.ReadOnly = true;
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.Size = new System.Drawing.Size(100, 20);
            this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo.TabIndex = 18;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cantidad_de_personas);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.mostrar_hotel_solo_usuario_guest);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.mostrar_tipo_regimen);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.Mostrar_tipo_habitacion);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.dateTimePicker2);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.dateTimePicker1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(24, 41);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(603, 142);
            this.groupBox1.TabIndex = 19;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos modificables";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label2.Location = new System.Drawing.Point(6, 33);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Check-in";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(124, 27);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(196, 20);
            this.dateTimePicker1.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(326, 33);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Check-out";
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Location = new System.Drawing.Point(397, 27);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker2.TabIndex = 4;
            // 
            // mostrar_tipo_regimen
            // 
            this.mostrar_tipo_regimen.FormattingEnabled = true;
            this.mostrar_tipo_regimen.Location = new System.Drawing.Point(397, 60);
            this.mostrar_tipo_regimen.Name = "mostrar_tipo_regimen";
            this.mostrar_tipo_regimen.Size = new System.Drawing.Size(121, 21);
            this.mostrar_tipo_regimen.TabIndex = 29;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(293, 60);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(98, 13);
            this.label4.TabIndex = 28;
            this.label4.Text = "Tipo de régimen";
            // 
            // Mostrar_tipo_habitacion
            // 
            this.Mostrar_tipo_habitacion.FormattingEnabled = true;
            this.Mostrar_tipo_habitacion.Location = new System.Drawing.Point(125, 57);
            this.Mostrar_tipo_habitacion.Name = "Mostrar_tipo_habitacion";
            this.Mostrar_tipo_habitacion.Size = new System.Drawing.Size(121, 21);
            this.Mostrar_tipo_habitacion.TabIndex = 27;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(6, 65);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(113, 13);
            this.label7.TabIndex = 26;
            this.label7.Text = "Tipo de habitación";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(261, 100);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(130, 13);
            this.label6.TabIndex = 32;
            this.label6.Text = "Cantidad de personas";
            // 
            // cantidad_de_personas
            // 
            this.cantidad_de_personas.Location = new System.Drawing.Point(398, 98);
            this.cantidad_de_personas.Name = "cantidad_de_personas";
            this.cantidad_de_personas.Size = new System.Drawing.Size(120, 20);
            this.cantidad_de_personas.TabIndex = 33;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(13, 107);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(106, 13);
            this.label5.TabIndex = 30;
            this.label5.Text = "Seleccionar hotel";
            // 
            // mostrar_hotel_solo_usuario_guest
            // 
            this.mostrar_hotel_solo_usuario_guest.FormattingEnabled = true;
            this.mostrar_hotel_solo_usuario_guest.Location = new System.Drawing.Point(125, 99);
            this.mostrar_hotel_solo_usuario_guest.Name = "mostrar_hotel_solo_usuario_guest";
            this.mostrar_hotel_solo_usuario_guest.Size = new System.Drawing.Size(121, 21);
            this.mostrar_hotel_solo_usuario_guest.TabIndex = 31;
            // 
            // Atrás
            // 
            this.Atrás.BackColor = System.Drawing.Color.LightSeaGreen;
            this.Atrás.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Atrás.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Atrás.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Atrás.Location = new System.Drawing.Point(93, 189);
            this.Atrás.Name = "Atrás";
            this.Atrás.Size = new System.Drawing.Size(211, 42);
            this.Atrás.TabIndex = 21;
            this.Atrás.Text = "Atrás";
            this.Atrás.UseVisualStyleBackColor = false;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.LightSeaGreen;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button1.Location = new System.Drawing.Point(331, 189);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(211, 42);
            this.button1.TabIndex = 22;
            this.button1.Text = "Modificar reserva";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // Modificar_reserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(653, 261);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.Atrás);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Modificar_reserva";
            this.Text = "Modificar reserva";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cantidad_de_personas)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox Número_de_reserva_que_debe_Traer_los_Datos_de_Abajo;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.NumericUpDown cantidad_de_personas;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox mostrar_hotel_solo_usuario_guest;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox mostrar_tipo_regimen;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox Mostrar_tipo_habitacion;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button Atrás;
        private System.Windows.Forms.Button button1;
    }
}