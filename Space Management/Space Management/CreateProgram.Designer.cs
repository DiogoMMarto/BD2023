
namespace Space_Management
{
    partial class CreateProgram
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreateProgram));
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.textBox7 = new System.Windows.Forms.TextBox();
            this.btnHome = new System.Windows.Forms.Button();
            this.tbName = new System.Windows.Forms.RichTextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.btnCreate = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBox5
            // 
            this.textBox5.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox5.Font = new System.Drawing.Font("Calibri", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox5.ForeColor = System.Drawing.SystemColors.MenuText;
            this.textBox5.Location = new System.Drawing.Point(-315, 129);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(1646, 74);
            this.textBox5.TabIndex = 86;
            this.textBox5.Text = "Create a new Program";
            this.textBox5.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox7
            // 
            this.textBox7.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox7.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox7.Location = new System.Drawing.Point(-183, 209);
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new System.Drawing.Size(1325, 28);
            this.textBox7.TabIndex = 85;
            this.textBox7.Text = "Fill in the name associated with your Program and Select <Create>";
            this.textBox7.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnHome
            // 
            this.btnHome.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnHome.BackgroundImage")));
            this.btnHome.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnHome.Font = new System.Drawing.Font("Unispace", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHome.Location = new System.Drawing.Point(40, 36);
            this.btnHome.Name = "btnHome";
            this.btnHome.Size = new System.Drawing.Size(163, 78);
            this.btnHome.TabIndex = 87;
            this.btnHome.UseVisualStyleBackColor = true;
            this.btnHome.Click += new System.EventHandler(this.btnHome_Click);
            // 
            // tbName
            // 
            this.tbName.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbName.Location = new System.Drawing.Point(281, 343);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(551, 40);
            this.tbName.TabIndex = 89;
            this.tbName.Text = "";
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(135, 343);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(110, 40);
            this.textBox2.TabIndex = 88;
            this.textBox2.Text = "Name:";
            // 
            // btnCreate
            // 
            this.btnCreate.Font = new System.Drawing.Font("Unispace", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCreate.ForeColor = System.Drawing.Color.Blue;
            this.btnCreate.Location = new System.Drawing.Point(338, 478);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(362, 53);
            this.btnCreate.TabIndex = 90;
            this.btnCreate.Text = "Create (+)";
            this.btnCreate.UseMnemonic = false;
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // CreateProgram
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(982, 753);
            this.Controls.Add(this.btnCreate);
            this.Controls.Add(this.tbName);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.btnHome);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox7);
            this.Name = "CreateProgram";
            this.Text = "CreateProgram";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.TextBox textBox7;
        private System.Windows.Forms.Button btnHome;
        private System.Windows.Forms.RichTextBox tbName;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Button btnCreate;
    }
}