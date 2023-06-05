
namespace Space_Management
{
    partial class CreatePayload
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreatePayload));
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.textBox7 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.lbSpacecrafts = new System.Windows.Forms.ListBox();
            this.lbAstronauts = new System.Windows.Forms.ListBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.lbRover = new System.Windows.Forms.ListBox();
            this.button1 = new System.Windows.Forms.Button();
            this.btnHome = new System.Windows.Forms.Button();
            this.lbCrew = new System.Windows.Forms.ListBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBox5
            // 
            this.textBox5.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox5.Font = new System.Drawing.Font("Calibri", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox5.ForeColor = System.Drawing.SystemColors.MenuText;
            this.textBox5.Location = new System.Drawing.Point(116, 84);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(1646, 74);
            this.textBox5.TabIndex = 82;
            this.textBox5.Text = "Add Payload to Mission";
            this.textBox5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox7
            // 
            this.textBox7.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox7.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox7.Location = new System.Drawing.Point(248, 164);
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new System.Drawing.Size(1325, 28);
            this.textBox7.TabIndex = 81;
            this.textBox7.Text = "Select a Spacecraft and at least of one of (Crew,Rover) and Select <Create>";
            this.textBox7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox4
            // 
            this.textBox4.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox4.Font = new System.Drawing.Font("Unispace", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox4.ForeColor = System.Drawing.Color.Black;
            this.textBox4.Location = new System.Drawing.Point(297, 307);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(362, 28);
            this.textBox4.TabIndex = 86;
            this.textBox4.Text = "Select a SpaceCraft:";
            this.textBox4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lbSpacecrafts
            // 
            this.lbSpacecrafts.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbSpacecrafts.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.lbSpacecrafts.FormattingEnabled = true;
            this.lbSpacecrafts.ItemHeight = 33;
            this.lbSpacecrafts.Location = new System.Drawing.Point(297, 341);
            this.lbSpacecrafts.Name = "lbSpacecrafts";
            this.lbSpacecrafts.Size = new System.Drawing.Size(362, 400);
            this.lbSpacecrafts.TabIndex = 85;
            this.lbSpacecrafts.Tag = "";
            // 
            // lbAstronauts
            // 
            this.lbAstronauts.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbAstronauts.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.lbAstronauts.FormattingEnabled = true;
            this.lbAstronauts.ItemHeight = 33;
            this.lbAstronauts.Location = new System.Drawing.Point(757, 341);
            this.lbAstronauts.Name = "lbAstronauts";
            this.lbAstronauts.Size = new System.Drawing.Size(362, 334);
            this.lbAstronauts.TabIndex = 87;
            this.lbAstronauts.Tag = "";
            this.lbAstronauts.SelectedIndexChanged += new System.EventHandler(this.lbAstronauts_SelectedIndexChanged);
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Font = new System.Drawing.Font("Unispace", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.ForeColor = System.Drawing.Color.Black;
            this.textBox2.Location = new System.Drawing.Point(1224, 307);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(362, 28);
            this.textBox2.TabIndex = 90;
            this.textBox2.Text = "Select a Rover:";
            this.textBox2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lbRover
            // 
            this.lbRover.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbRover.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.lbRover.FormattingEnabled = true;
            this.lbRover.ItemHeight = 33;
            this.lbRover.Location = new System.Drawing.Point(1224, 341);
            this.lbRover.Name = "lbRover";
            this.lbRover.Size = new System.Drawing.Size(362, 400);
            this.lbRover.TabIndex = 89;
            this.lbRover.Tag = "";
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.button1.Enabled = false;
            this.button1.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.Black;
            this.button1.Location = new System.Drawing.Point(1224, 828);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(362, 175);
            this.button1.TabIndex = 91;
            this.button1.Text = "Add Payload (+)";
            this.button1.UseMnemonic = false;
            this.button1.UseVisualStyleBackColor = false;
            // 
            // btnHome
            // 
            this.btnHome.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnHome.BackgroundImage")));
            this.btnHome.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnHome.Font = new System.Drawing.Font("Unispace", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHome.Location = new System.Drawing.Point(96, 135);
            this.btnHome.Name = "btnHome";
            this.btnHome.Size = new System.Drawing.Size(163, 78);
            this.btnHome.TabIndex = 92;
            this.btnHome.UseVisualStyleBackColor = true;
            // 
            // lbCrew
            // 
            this.lbCrew.Enabled = false;
            this.lbCrew.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCrew.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.lbCrew.FormattingEnabled = true;
            this.lbCrew.ItemHeight = 33;
            this.lbCrew.Location = new System.Drawing.Point(297, 834);
            this.lbCrew.Name = "lbCrew";
            this.lbCrew.Size = new System.Drawing.Size(822, 169);
            this.lbCrew.TabIndex = 93;
            this.lbCrew.Tag = "";
            // 
            // textBox3
            // 
            this.textBox3.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox3.Font = new System.Drawing.Font("Unispace", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.ForeColor = System.Drawing.Color.Black;
            this.textBox3.Location = new System.Drawing.Point(288, 792);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(362, 36);
            this.textBox3.TabIndex = 94;
            this.textBox3.Text = " Crew";
            // 
            // textBox1
            // 
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox1.Font = new System.Drawing.Font("Unispace", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.ForeColor = System.Drawing.Color.Black;
            this.textBox1.Location = new System.Drawing.Point(757, 307);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(362, 28);
            this.textBox1.TabIndex = 88;
            this.textBox1.Text = "Add Astronaut to Crew:";
            this.textBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.button2.Enabled = false;
            this.button2.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.ForeColor = System.Drawing.Color.Black;
            this.button2.Location = new System.Drawing.Point(757, 682);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(362, 59);
            this.button2.TabIndex = 96;
            this.button2.Text = "Add Astronaut to Crew(+)";
            this.button2.UseMnemonic = false;
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // CreatePayload
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(1902, 1033);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.lbCrew);
            this.Controls.Add(this.btnHome);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.lbRover);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lbAstronauts);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.lbSpacecrafts);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox7);
            this.Name = "CreatePayload";
            this.Text = "CreatePayload";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.CreatePayload_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.TextBox textBox7;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.ListBox lbSpacecrafts;
        private System.Windows.Forms.ListBox lbAstronauts;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.ListBox lbRover;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnHome;
        private System.Windows.Forms.ListBox lbCrew;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button2;
    }
}