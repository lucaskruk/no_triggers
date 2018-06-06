namespace FrbaHotel.Login
{
    partial class Login
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.usuario = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Iniciar_Sesion = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Ir_a_pantalla_principal = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Lucida Sans Unicode", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(22, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(281, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Bienvenido a FRBA hotel";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("MS Reference Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.label2.Location = new System.Drawing.Point(24, 53);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(149, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Por favor, inicie sesión";
            // 
            // usuario
            // 
            this.usuario.BackColor = System.Drawing.Color.Gainsboro;
            this.usuario.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.usuario.ForeColor = System.Drawing.SystemColors.GrayText;
            this.usuario.Location = new System.Drawing.Point(224, 124);
            this.usuario.Name = "usuario";
            this.usuario.Size = new System.Drawing.Size(211, 17);
            this.usuario.TabIndex = 2;
            this.usuario.Text = "Usuario";
            this.usuario.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.Color.Gainsboro;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.ForeColor = System.Drawing.SystemColors.GrayText;
            this.textBox1.Location = new System.Drawing.Point(224, 177);
            this.textBox1.Name = "textBox1";
            this.textBox1.PasswordChar = '*';
            this.textBox1.Size = new System.Drawing.Size(211, 17);
            this.textBox1.TabIndex = 3;
            this.textBox1.Text = "Contraseña";
            this.textBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.textBox1.UseSystemPasswordChar = true;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(549, 9);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(97, 82);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // Iniciar_Sesion
            // 
            this.Iniciar_Sesion.BackColor = System.Drawing.Color.LightSeaGreen;
            this.Iniciar_Sesion.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Iniciar_Sesion.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Iniciar_Sesion.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Iniciar_Sesion.Location = new System.Drawing.Point(224, 242);
            this.Iniciar_Sesion.Name = "Iniciar_Sesion";
            this.Iniciar_Sesion.Size = new System.Drawing.Size(211, 23);
            this.Iniciar_Sesion.TabIndex = 5;
            this.Iniciar_Sesion.Text = "Iniciar sesión";
            this.Iniciar_Sesion.UseVisualStyleBackColor = false;
            this.Iniciar_Sesion.Click += new System.EventHandler(this.Iniciar_Sesion_Click);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(27, 98);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(166, 123);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 6;
            this.pictureBox2.TabStop = false;
            // 
            // Ir_a_pantalla_principal
            // 
            this.Ir_a_pantalla_principal.BackColor = System.Drawing.Color.DarkSlateGray;
            this.Ir_a_pantalla_principal.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Ir_a_pantalla_principal.Font = new System.Drawing.Font("MS Reference Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Ir_a_pantalla_principal.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Ir_a_pantalla_principal.Location = new System.Drawing.Point(532, 285);
            this.Ir_a_pantalla_principal.Name = "Ir_a_pantalla_principal";
            this.Ir_a_pantalla_principal.Size = new System.Drawing.Size(114, 23);
            this.Ir_a_pantalla_principal.TabIndex = 7;
            this.Ir_a_pantalla_principal.Text = "Atrás";
            this.Ir_a_pantalla_principal.UseVisualStyleBackColor = false;
            this.Ir_a_pantalla_principal.Click += new System.EventHandler(this.Ir_a_pantalla_principal_Click);
            // 
            // Login
            // 
            this.AcceptButton = this.Iniciar_Sesion;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.ClientSize = new System.Drawing.Size(658, 320);
            this.Controls.Add(this.Ir_a_pantalla_principal);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.Iniciar_Sesion);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.usuario);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Login";
            this.Text = "Login -FRBA Hotel";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox usuario;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button Iniciar_Sesion;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button Ir_a_pantalla_principal;
    }
}