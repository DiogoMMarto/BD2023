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
        private Dictionary<String, Dictionary<String, String>> dic;
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
            dic = Mediator.loadSpacecraftInvolvments(this.mission.Mission_ID);
            this.loadSpacecrafts(); 

        }
        private void loadSpacecrafts()
        {
            List<String> spacecrafts = Mediator.loadSpacecraftsOfMission(this.mission.Mission_ID);
            foreach (String x in spacecrafts)
                lbSpacecrafts.Items.Add(x);
        }
        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbCrewID_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbSpacecraft_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lbSpacecrafts_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbCrew.Items.Clear();
            lbCrew.Items.Add("No crew associated to this Spacecraft");
            tbRover.Text = "Spacecraft does not carry a Rover";
            int craftID =int.Parse(lbSpacecrafts.SelectedItem.ToString().Substring(0,5).Trim());
            if (dic.ContainsKey(craftID.ToString()))
            {
                if (dic[craftID.ToString()].ContainsKey("CrewID") && ! dic[craftID.ToString()]["CrewID"].Equals("") )
                    this.loadCrew(int.Parse(dic[craftID.ToString()]["CrewID"]));
                if (dic[craftID.ToString()].ContainsKey("Name"))
                    this.tbRover.Text = dic[craftID.ToString()]["Name"];
            }  
        }
        private void loadCrew(int crewID=-1)
        {
            lbCrew.Items.Clear();
            if (crewID == -1)
                this.lbCrew.Items.Clear();
            else
            {
                List<Employee> emps = Mediator.loadCrew(crewID);
                foreach (Employee x in emps)
                    this.lbCrew.Items.Add(x.ToString2());
            }
        }   
    }
}
