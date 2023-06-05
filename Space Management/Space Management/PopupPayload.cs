using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Space_Management
{
    public partial class PopupPayload : Form
    {
        private int mission_ID;
        private int comp_ID;

        public PopupPayload(int mission_ID,int comp_ID)
        {
            InitializeComponent();
            this.mission_ID = mission_ID;
            this.comp_ID = comp_ID;

        }

        private void PopupPayload_Load(object sender, EventArgs e)
        {
            ManageCompany form = (ManageCompany)this.Tag;
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ManageCompany form = (ManageCompany)this.Tag;
            form.refresh();
            form.Show();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CreatePayload form =new CreatePayload(this.mission_ID,this.comp_ID);
            form.Show();
            form.Tag = this.Tag;
            this.Close();
        }
    }
}
