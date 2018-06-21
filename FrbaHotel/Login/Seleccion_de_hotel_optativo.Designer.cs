namespace FrbaHotel.Login
{
    partial class Frm_Sel_Hotel
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Frm_Sel_Hotel));
            this.label1 = new System.Windows.Forms.Label();
            this.listBx_hotel = new System.Windows.Forms.ComboBox();
            this.ingresar_hotel_deseado = new System.Windows.Forms.Button();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label1.Location = new System.Drawing.Point(35, 54);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(332, 16);
            this.label1.TabIndex = 11;
            this.label1.Text = "Por favor, seleccione el hotel donde desea ingresar";
            // 
            // listBx_hotel
            // 
            this.listBx_hotel.FormattingEnabled = true;
            this.listBx_hotel.Location = new System.Drawing.Point(511, 54);
            this.listBx_hotel.Name = "listBx_hotel";
            this.listBx_hotel.Size = new System.Drawing.Size(121, 21);
            this.listBx_hotel.TabIndex = 12;
            this.listBx_hotel.SelectedIndexChanged += new System.EventHandler(this.listBx_hotel_SelectedIndexChanged);
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
            this.ingresar_hotel_deseado.Click += new System.EventHandler(this.ingresar_hotel_deseado_Click);
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
            // Frm_Sel_Hotel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(687, 216);
            this.Controls.Add(this.lblUsuario);
            this.Controls.Add(this.ingresar_hotel_deseado);
            this.Controls.Add(this.listBx_hotel);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Frm_Sel_Hotel";
            this.Text = "Login para personal - FRBA hotel";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Frm_Sel_Hotel_FormClosing);
            this.Load += new System.EventHandler(this.Frm_Sel_Hotel_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox listBx_hotel;
        private System.Windows.Forms.Button ingresar_hotel_deseado;
        private System.Windows.Forms.Label lblUsuario;
    }
}