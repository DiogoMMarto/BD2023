
namespace Space_Management
{
    partial class ManageMission
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ManageMission));
            this.textBox11 = new System.Windows.Forms.TextBox();
            this.tbTitle = new System.Windows.Forms.TextBox();
            this.groupOverview = new System.Windows.Forms.GroupBox();
            this.textBox13 = new System.Windows.Forms.TextBox();
            this.tbBudget = new System.Windows.Forms.RichTextBox();
            this.textBox10 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.tbFinishDate = new System.Windows.Forms.RichTextBox();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.tbBegDate = new System.Windows.Forms.RichTextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.tbCompID = new System.Windows.Forms.RichTextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.tbDescription = new System.Windows.Forms.RichTextBox();
            this.textBox12 = new System.Windows.Forms.TextBox();
            this.tbID = new System.Windows.Forms.RichTextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox6 = new System.Windows.Forms.TextBox();
            this.gbPayload = new System.Windows.Forms.GroupBox();
            this.tbRoverID = new System.Windows.Forms.RichTextBox();
            this.textBox9 = new System.Windows.Forms.TextBox();
            this.tbCrewID = new System.Windows.Forms.RichTextBox();
            this.textBox8 = new System.Windows.Forms.TextBox();
            this.tbSpacecraftID = new System.Windows.Forms.RichTextBox();
            this.textBox7 = new System.Windows.Forms.TextBox();
            this.btnHome = new System.Windows.Forms.Button();
            this.groupOverview.SuspendLayout();
            this.gbPayload.SuspendLayout();
            this.SuspendLayout();
            // 
            // textBox11
            // 
            this.textBox11.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox11.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox11.Location = new System.Drawing.Point(356, 92);
            this.textBox11.Name = "textBox11";
            this.textBox11.Size = new System.Drawing.Size(1185, 28);
            this.textBox11.TabIndex = 69;
            this.textBox11.Text = "Make use of the Presented Options and Menus to Manage the Mission";
            this.textBox11.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // tbTitle
            // 
            this.tbTitle.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tbTitle.Font = new System.Drawing.Font("Calibri", 36F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbTitle.ForeColor = System.Drawing.SystemColors.MenuText;
            this.tbTitle.Location = new System.Drawing.Point(325, 12);
            this.tbTitle.Name = "tbTitle";
            this.tbTitle.Size = new System.Drawing.Size(1232, 74);
            this.tbTitle.TabIndex = 68;
            this.tbTitle.Text = "Mission Managment ";
            this.tbTitle.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.tbTitle.TextChanged += new System.EventHandler(this.tbTitle_TextChanged);
            // 
            // groupOverview
            // 
            this.groupOverview.Controls.Add(this.textBox13);
            this.groupOverview.Controls.Add(this.tbBudget);
            this.groupOverview.Controls.Add(this.textBox10);
            this.groupOverview.Controls.Add(this.textBox4);
            this.groupOverview.Controls.Add(this.tbFinishDate);
            this.groupOverview.Controls.Add(this.textBox5);
            this.groupOverview.Controls.Add(this.tbBegDate);
            this.groupOverview.Controls.Add(this.textBox2);
            this.groupOverview.Controls.Add(this.tbCompID);
            this.groupOverview.Controls.Add(this.textBox1);
            this.groupOverview.Controls.Add(this.tbDescription);
            this.groupOverview.Controls.Add(this.textBox12);
            this.groupOverview.Controls.Add(this.tbID);
            this.groupOverview.Controls.Add(this.textBox3);
            this.groupOverview.Controls.Add(this.textBox6);
            this.groupOverview.Controls.Add(this.gbPayload);
            this.groupOverview.Location = new System.Drawing.Point(73, 183);
            this.groupOverview.Name = "groupOverview";
            this.groupOverview.Size = new System.Drawing.Size(1817, 800);
            this.groupOverview.TabIndex = 70;
            this.groupOverview.TabStop = false;
            this.groupOverview.Enter += new System.EventHandler(this.groupOverview_Enter);
            // 
            // textBox13
            // 
            this.textBox13.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox13.Font = new System.Drawing.Font("Unispace", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox13.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
            this.textBox13.Location = new System.Drawing.Point(496, 592);
            this.textBox13.Name = "textBox13";
            this.textBox13.Size = new System.Drawing.Size(225, 28);
            this.textBox13.TabIndex = 72;
            this.textBox13.Text = "millions.";
            // 
            // tbBudget
            // 
            this.tbBudget.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbBudget.Location = new System.Drawing.Point(342, 592);
            this.tbBudget.Name = "tbBudget";
            this.tbBudget.Size = new System.Drawing.Size(127, 32);
            this.tbBudget.TabIndex = 71;
            this.tbBudget.Text = "";
            this.tbBudget.TextChanged += new System.EventHandler(this.richTextBox3_TextChanged);
            // 
            // textBox10
            // 
            this.textBox10.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox10.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox10.Location = new System.Drawing.Point(111, 584);
            this.textBox10.Name = "textBox10";
            this.textBox10.Size = new System.Drawing.Size(225, 40);
            this.textBox10.TabIndex = 70;
            this.textBox10.Text = "Budget:";
            this.textBox10.TextChanged += new System.EventHandler(this.textBox10_TextChanged);
            // 
            // textBox4
            // 
            this.textBox4.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox4.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox4.Location = new System.Drawing.Point(111, 484);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(186, 40);
            this.textBox4.TabIndex = 67;
            this.textBox4.Text = "Payload:";
            // 
            // tbFinishDate
            // 
            this.tbFinishDate.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbFinishDate.Location = new System.Drawing.Point(1178, 337);
            this.tbFinishDate.Name = "tbFinishDate";
            this.tbFinishDate.Size = new System.Drawing.Size(381, 32);
            this.tbFinishDate.TabIndex = 66;
            this.tbFinishDate.Text = "In Progress...";
            // 
            // textBox5
            // 
            this.textBox5.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox5.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox5.Location = new System.Drawing.Point(855, 338);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(317, 40);
            this.textBox5.TabIndex = 65;
            this.textBox5.Text = "Finishing Date:";
            // 
            // tbBegDate
            // 
            this.tbBegDate.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbBegDate.Location = new System.Drawing.Point(434, 345);
            this.tbBegDate.Name = "tbBegDate";
            this.tbBegDate.Size = new System.Drawing.Size(400, 32);
            this.tbBegDate.TabIndex = 64;
            this.tbBegDate.Text = "";
            // 
            // textBox2
            // 
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(111, 345);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(317, 40);
            this.textBox2.TabIndex = 63;
            this.textBox2.Text = "Beginning Date:";
            // 
            // tbCompID
            // 
            this.tbCompID.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbCompID.Location = new System.Drawing.Point(877, 53);
            this.tbCompID.Name = "tbCompID";
            this.tbCompID.Size = new System.Drawing.Size(127, 32);
            this.tbCompID.TabIndex = 62;
            this.tbCompID.Text = "";
            // 
            // textBox1
            // 
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox1.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(625, 53);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(225, 40);
            this.textBox1.TabIndex = 61;
            this.textBox1.Text = "Company ID:";
            // 
            // tbDescription
            // 
            this.tbDescription.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbDescription.Location = new System.Drawing.Point(354, 172);
            this.tbDescription.Name = "tbDescription";
            this.tbDescription.Size = new System.Drawing.Size(1193, 105);
            this.tbDescription.TabIndex = 60;
            this.tbDescription.Text = "";
            // 
            // textBox12
            // 
            this.textBox12.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox12.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox12.Location = new System.Drawing.Point(102, 170);
            this.textBox12.Name = "textBox12";
            this.textBox12.Size = new System.Drawing.Size(260, 40);
            this.textBox12.TabIndex = 59;
            this.textBox12.Text = "Description:";
            // 
            // tbID
            // 
            this.tbID.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbID.Location = new System.Drawing.Point(354, 61);
            this.tbID.Name = "tbID";
            this.tbID.Size = new System.Drawing.Size(127, 32);
            this.tbID.TabIndex = 48;
            this.tbID.Text = "";
            // 
            // textBox3
            // 
            this.textBox3.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox3.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(102, 61);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(225, 40);
            this.textBox3.TabIndex = 47;
            this.textBox3.Text = "Mission ID:";
            // 
            // textBox6
            // 
            this.textBox6.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox6.Font = new System.Drawing.Font("Unispace", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox6.Location = new System.Drawing.Point(342, 484);
            this.textBox6.Name = "textBox6";
            this.textBox6.Size = new System.Drawing.Size(1221, 36);
            this.textBox6.TabIndex = 68;
            this.textBox6.Text = "This Mission does not involve any Payload.";
            // 
            // gbPayload
            // 
            this.gbPayload.Controls.Add(this.tbRoverID);
            this.gbPayload.Controls.Add(this.textBox9);
            this.gbPayload.Controls.Add(this.tbCrewID);
            this.gbPayload.Controls.Add(this.textBox8);
            this.gbPayload.Controls.Add(this.tbSpacecraftID);
            this.gbPayload.Controls.Add(this.textBox7);
            this.gbPayload.Cursor = System.Windows.Forms.Cursors.No;
            this.gbPayload.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbPayload.Location = new System.Drawing.Point(111, 470);
            this.gbPayload.Name = "gbPayload";
            this.gbPayload.Size = new System.Drawing.Size(1227, 132);
            this.gbPayload.TabIndex = 69;
            this.gbPayload.TabStop = false;
            this.gbPayload.Text = "Payload";
            this.gbPayload.Visible = false;
            // 
            // tbRoverID
            // 
            this.tbRoverID.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbRoverID.Location = new System.Drawing.Point(1087, 39);
            this.tbRoverID.Name = "tbRoverID";
            this.tbRoverID.Size = new System.Drawing.Size(127, 32);
            this.tbRoverID.TabIndex = 75;
            this.tbRoverID.Text = "";
            // 
            // textBox9
            // 
            this.textBox9.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox9.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox9.Location = new System.Drawing.Point(873, 39);
            this.textBox9.Name = "textBox9";
            this.textBox9.Size = new System.Drawing.Size(208, 40);
            this.textBox9.TabIndex = 74;
            this.textBox9.Text = "Rover ID:";
            // 
            // tbCrewID
            // 
            this.tbCrewID.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbCrewID.Location = new System.Drawing.Point(703, 39);
            this.tbCrewID.Name = "tbCrewID";
            this.tbCrewID.Size = new System.Drawing.Size(127, 32);
            this.tbCrewID.TabIndex = 73;
            this.tbCrewID.Text = "";
            // 
            // textBox8
            // 
            this.textBox8.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox8.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox8.Location = new System.Drawing.Point(494, 39);
            this.textBox8.Name = "textBox8";
            this.textBox8.Size = new System.Drawing.Size(189, 40);
            this.textBox8.TabIndex = 72;
            this.textBox8.Text = "Crew ID:";
            // 
            // tbSpacecraftID
            // 
            this.tbSpacecraftID.Font = new System.Drawing.Font("Unispace", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tbSpacecraftID.Location = new System.Drawing.Point(328, 44);
            this.tbSpacecraftID.Name = "tbSpacecraftID";
            this.tbSpacecraftID.Size = new System.Drawing.Size(127, 32);
            this.tbSpacecraftID.TabIndex = 71;
            this.tbSpacecraftID.Text = "";
            // 
            // textBox7
            // 
            this.textBox7.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox7.Font = new System.Drawing.Font("Unispace", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox7.Location = new System.Drawing.Point(21, 44);
            this.textBox7.Name = "textBox7";
            this.textBox7.Size = new System.Drawing.Size(301, 40);
            this.textBox7.TabIndex = 70;
            this.textBox7.Text = "SpaceCraft ID:";
            this.textBox7.TextChanged += new System.EventHandler(this.textBox7_TextChanged);
            // 
            // btnHome
            // 
            this.btnHome.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnHome.BackgroundImage")));
            this.btnHome.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnHome.Font = new System.Drawing.Font("Unispace", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHome.Location = new System.Drawing.Point(23, 42);
            this.btnHome.Name = "btnHome";
            this.btnHome.Size = new System.Drawing.Size(163, 78);
            this.btnHome.TabIndex = 71;
            this.btnHome.UseVisualStyleBackColor = true;
            this.btnHome.Click += new System.EventHandler(this.btnHome_Click);
            // 
            // ManageMission
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(1902, 1033);
            this.Controls.Add(this.btnHome);
            this.Controls.Add(this.groupOverview);
            this.Controls.Add(this.textBox11);
            this.Controls.Add(this.tbTitle);
            this.Name = "ManageMission";
            this.Text = "ManageMission";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.ManageMission_Load);
            this.groupOverview.ResumeLayout(false);
            this.groupOverview.PerformLayout();
            this.gbPayload.ResumeLayout(false);
            this.gbPayload.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox11;
        private System.Windows.Forms.TextBox tbTitle;
        private System.Windows.Forms.GroupBox groupOverview;
        private System.Windows.Forms.RichTextBox tbDescription;
        private System.Windows.Forms.TextBox textBox12;
        private System.Windows.Forms.RichTextBox tbID;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.GroupBox gbPayload;
        private System.Windows.Forms.RichTextBox tbRoverID;
        private System.Windows.Forms.TextBox textBox9;
        private System.Windows.Forms.RichTextBox tbCrewID;
        private System.Windows.Forms.TextBox textBox8;
        private System.Windows.Forms.RichTextBox tbSpacecraftID;
        private System.Windows.Forms.TextBox textBox7;
        private System.Windows.Forms.TextBox textBox6;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.RichTextBox tbFinishDate;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.RichTextBox tbBegDate;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.RichTextBox tbCompID;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.RichTextBox tbBudget;
        private System.Windows.Forms.TextBox textBox10;
        private System.Windows.Forms.TextBox textBox13;
        private System.Windows.Forms.Button btnHome;
    }
}