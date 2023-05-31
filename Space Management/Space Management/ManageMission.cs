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
    public partial class ManageMission : Form
    {
        private Mission mission;
        private int compID;
        public ManageMission(Mission mission,int id)
        {
            this.mission = mission;
            this.compID = id;
            InitializeComponent();
        }

        private void groupOverview_Enter(object sender, EventArgs e)
        {

        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            ManageCompany form = (ManageCompany)this.Tag;
            form.Show();
            this.Close();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbTitle_TextChanged(object sender, EventArgs e)
        {

        }

        private void ManageMission_Load(object sender, EventArgs e)
        {
            this.tbBudget.Text = mission.Budget.ToString();
            this.tbBegDate.Text = mission.Beg_Date.ToString();
            this.tbDescription.Text = mission.Description;
            this.tbFinishDate.Text = mission.Conc_Date;
            this.tbCompID.Text = this.compID.ToString();
            this.tbID.Text = mission.Mission_ID.ToString();
        }
       
    }
}
