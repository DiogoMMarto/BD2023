
namespace Space_Management
{
    partial class CreateCompany
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
            this.textBox7 = new System.Windows.Forms.TextBox();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.tbName = new System.Windows.Forms.RichTextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.cbPublic = new System.Windows.Forms.CheckBox();
            this.cbPrivate = new System.Windows.Forms.CheckBox();
            this.tbAcronym = new System.Windows.Forms.RichTextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.tbCountry = new System.Windows.Forms.RichTextBox();
            this.tbCEO = new System.Windows.Forms.RichTextBox();
            this.Ceo = new System.Windows.Forms.TextBox();
            this.GOV = new System.Windows.Forms.TextBox();
            this.tbGov = new System.Windows.Forms.RichTextBox();
            this.btnCreate = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBox7
            // 
            this.textBox7.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox7.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox7.Location = new System.Drawing.Point(359, 106);
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new System.Drawing.Size(1185, 28);
            this.textBox7.TabIndex = 18;
            this.textBox7.Text = "Fill in the properties associated with your Company and Select <Create>";
            this.textBox7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox5
            // 
            this.textBox5.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox5.Font = new System.Drawing.Font("Calibri", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox5.ForeColor = System.Drawing.SystemColors.MenuText;
            this.textBox5.Location = new System.Drawing.Point(335, 26);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(1232, 74);
            this.textBox5.TabIndex = 19;
            this.textBox5.Text = "Create a Space Company";
            this.textBox5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // tbName
            // 
            this.tbName.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbName.Location = new System.Drawing.Point(668, 359);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(246, 32);
            this.tbName.TabIndex = 27;
            this.tbName.Text = "";
            // 
            // textBox3
            // 
            this.textBox3.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox3.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(491, 345);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(393, 40);
            this.textBox3.TabIndex = 26;
            this.textBox3.Text = "Name:";
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(491, 212);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(393, 40);
            this.textBox2.TabIndex = 24;
            this.textBox2.Text = "Country:";
            // 
            // textBox1
            // 
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox1.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(1118, 212);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(393, 40);
            this.textBox1.TabIndex = 23;
            this.textBox1.Text = "Company Type";
            // 
            // cbPublic
            // 
            this.cbPublic.AutoSize = true;
            this.cbPublic.Checked = true;
            this.cbPublic.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cbPublic.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbPublic.Location = new System.Drawing.Point(1162, 315);
            this.cbPublic.Name = "cbPublic";
            this.cbPublic.Size = new System.Drawing.Size(139, 38);
            this.cbPublic.TabIndex = 21;
            this.cbPublic.Text = "Public";
            this.cbPublic.UseVisualStyleBackColor = true;
            this.cbPublic.CheckedChanged += new System.EventHandler(this.cbPublic_CheckedChanged);
            // 
            // cbPrivate
            // 
            this.cbPrivate.AutoSize = true;
            this.cbPrivate.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbPrivate.Location = new System.Drawing.Point(1162, 270);
            this.cbPrivate.Name = "cbPrivate";
            this.cbPrivate.Size = new System.Drawing.Size(156, 38);
            this.cbPrivate.TabIndex = 20;
            this.cbPrivate.Text = "Private";
            this.cbPrivate.UseVisualStyleBackColor = true;
            this.cbPrivate.CheckedChanged += new System.EventHandler(this.cbPrivate_CheckedChanged);
            // 
            // tbAcronym
            // 
            this.tbAcronym.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbAcronym.Location = new System.Drawing.Point(668, 495);
            this.tbAcronym.Name = "tbAcronym";
            this.tbAcronym.Size = new System.Drawing.Size(246, 32);
            this.tbAcronym.TabIndex = 29;
            this.tbAcronym.Text = "";
            this.tbAcronym.TextChanged += new System.EventHandler(this.richTextBox2_TextChanged);
            // 
            // textBox4
            // 
            this.textBox4.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox4.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox4.Location = new System.Drawing.Point(491, 487);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(393, 40);
            this.textBox4.TabIndex = 28;
            this.textBox4.Text = "Acronym:";
            this.textBox4.TextChanged += new System.EventHandler(this.textBox4_TextChanged);
            // 
            // tbCountry
            // 
            this.tbCountry.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbCountry.Location = new System.Drawing.Point(668, 220);
            this.tbCountry.Name = "tbCountry";
            this.tbCountry.Size = new System.Drawing.Size(246, 32);
            this.tbCountry.TabIndex = 30;
            this.tbCountry.Text = "";
            // 
            // tbCEO
            // 
            this.tbCEO.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbCEO.Location = new System.Drawing.Point(1215, 491);
            this.tbCEO.Name = "tbCEO";
            this.tbCEO.Size = new System.Drawing.Size(246, 32);
            this.tbCEO.TabIndex = 32;
            this.tbCEO.Text = "";
            this.tbCEO.Visible = false;
            this.tbCEO.TextChanged += new System.EventHandler(this.richTextBox4_TextChanged);
            // 
            // Ceo
            // 
            this.Ceo.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.Ceo.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Ceo.Location = new System.Drawing.Point(1118, 487);
            this.Ceo.Name = "Ceo";
            this.Ceo.Size = new System.Drawing.Size(78, 40);
            this.Ceo.TabIndex = 31;
            this.Ceo.Text = "CEO:";
            this.Ceo.Visible = false;
            this.Ceo.TextChanged += new System.EventHandler(this.textBox6_TextChanged);
            // 
            // GOV
            // 
            this.GOV.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.GOV.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GOV.Location = new System.Drawing.Point(1118, 484);
            this.GOV.Name = "GOV";
            this.GOV.Size = new System.Drawing.Size(78, 40);
            this.GOV.TabIndex = 33;
            this.GOV.Text = "Gov:";
            // 
            // tbGov
            // 
            this.tbGov.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbGov.Location = new System.Drawing.Point(1215, 489);
            this.tbGov.Name = "tbGov";
            this.tbGov.Size = new System.Drawing.Size(246, 32);
            this.tbGov.TabIndex = 34;
            this.tbGov.Text = "";
            // 
            // btnCreate
            // 
            this.btnCreate.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCreate.ForeColor = System.Drawing.Color.Blue;
            this.btnCreate.Location = new System.Drawing.Point(874, 635);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(279, 53);
            this.btnCreate.TabIndex = 35;
            this.btnCreate.Text = "Create (+)";
            this.btnCreate.UseMnemonic = false;
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // CreateCompany
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(1902, 1033);
            this.Controls.Add(this.btnCreate);
            this.Controls.Add(this.tbGov);
            this.Controls.Add(this.GOV);
            this.Controls.Add(this.tbCEO);
            this.Controls.Add(this.Ceo);
            this.Controls.Add(this.tbCountry);
            this.Controls.Add(this.tbAcronym);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.tbName);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.cbPublic);
            this.Controls.Add(this.cbPrivate);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox7);
            this.Name = "CreateCompany";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CreateCompany";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.CreateCompany_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox7;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.RichTextBox tbName;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.CheckBox cbPublic;
        private System.Windows.Forms.CheckBox cbPrivate;
        private System.Windows.Forms.RichTextBox tbAcronym;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.RichTextBox tbCountry;
        private System.Windows.Forms.RichTextBox tbCEO;
        private System.Windows.Forms.TextBox Ceo;
        private System.Windows.Forms.TextBox GOV;
        private System.Windows.Forms.RichTextBox tbGov;
        private System.Windows.Forms.Button btnCreate;
    }
}