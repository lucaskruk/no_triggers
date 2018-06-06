namespace FrbaHotel.Login
{
    partial class Seleccion_de_hotel_optativo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Seleccion_de_hotel_optativo));
            this.label1 = new System.Windows.Forms.Label();
            this.desplegar_hoteles_donde_trabaja = new System.Windows.Forms.ComboBox();
            this.ingresar_hotel_deseado = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(332, 16);
            this.label1.TabIndex = 11;
            this.label1.Text = "Por favor, seleccione el hotel donde desea ingresar";
            // 
            // desplegar_hoteles_donde_trabaja
            // 
            this.desplegar_hoteles_donde_trabaja.FormattingEnabled = true;
            this.desplegar_hoteles_donde_trabaja.Location = new System.Drawing.Point(407, 19);
            this.desplegar_hoteles_donde_trabaja.Name = "desplegar_hoteles_donde_trabaja";
            this.desplegar_hoteles_donde_trabaja.Size = new System.Drawing.Size(121, 21);
            this.desplegar_hoteles_donde_trabaja.TabIndex = 12;
            // 
            // ingresar_hotel_deseado
            // 
            this.ingresar_hotel_deseado.BackColor = System.Drawing.Color.LightSeaGreen;
            this.ingresar_hotel_deseado.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.ingresar_hotel_deseado.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ingresar_hotel_deseado.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ingresar_hotel_deseado.Location = new System.Drawing.Point(222, 105);
            this.ingresar_hotel_deseado.Name = "ingresar_hotel_deseado";
            this.ingresar_hotel_deseado.Size = new System.Drawing.Size(243, 51);
            this.ingresar_hotel_deseado.TabIndex = 13;
            this.ingresar_hotel_deseado.Text = "Ingresar";
            this.ingresar_hotel_deseado.UseVisualStyleBackColor = false;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(686, 261);
            this.Controls.Add(this.ingresar_hotel_deseado);
            this.Controls.Add(this.desplegar_hoteles_donde_trabaja);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form2";
            this.Text = "Login para personal - FRBA hotel";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox desplegar_hoteles_donde_trabaja;
        private System.Windows.Forms.Button ingresar_hotel_deseado;
    }
}