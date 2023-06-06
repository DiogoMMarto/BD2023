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
    public partial class ManageCompany : Form
    {
        private Company comp;
        public ManageCompany(Company comp)
        {
            InitializeComponent();
            this.comp = comp;
        }
        public void refresh()
        {
            this.loadMissions();
            this.loadEmployees();
            this.loadVehicles();
            this.loadPrograms();
        }
        public void loadMissions()
        {
            this.lbMissions.Items.Clear();
            List<Mission> missions =Mediator.loadMissions(this.comp.Comp_ID);
            foreach(Mission m in missions)
            {
                this.lbMissions.Items.Add(m);
            }
        }
        public void loadEmployees()
        {
            this.lbEmployees.Items.Clear();
            List<Employee> empregados = Mediator.loadEmployees(this.comp.Comp_ID);
            foreach (Employee m in empregados)
            {
                this.lbEmployees.Items.Add(m);
            }
        }
        public void loadVehicles()
        {
            this.lbVehicles.Items.Clear();
            List<Vehicle> empregados = Mediator.loadVehicles(this.comp.Comp_ID);
            foreach (Vehicle m in empregados)
            {
                this.lbVehicles.Items.Add(m);
            }
        }
        public void loadPrograms()
        {
            this.lbPrograms.Items.Clear();
            List<Programa> empregados = Mediator.loadPrograms(this.comp.Comp_ID);
            foreach (Programa m in empregados)
            {
                this.lbPrograms.Items.Add(m);
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            groupOverview.Visible = true;
            groupMissions.Visible = false;
            groupStaff.Visible = false;
            groupVehicles.Visible = false;
            
        }

        private void ManageCompany_Load(object sender, EventArgs e)
        {
            tbTitle.Text = comp.Name;
            tbName.Text = comp.Name;
            if(comp.Acronym.Equals("")) tbAcronym.Text = "- Non Existent - ";
            else tbAcronym.Text = comp.Acronym;
            tbCountry.Text = comp.Country;
            if(comp.Type.Equals("Public")) tbOwner.Text = "Government of "+comp.Owner;
            else tbOwner.Text = comp.Owner;
            tbType.Text = comp.Type;
            this.loadMissions();
            this.loadEmployees();
            this.loadVehicles();
            this.loadPrograms();
        }
        
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupOverview_Enter(object sender, EventArgs e)
        {

        }

        private void btnEmployees_Click(object sender, EventArgs e)
        {
            groupStaff.Visible = true;
            groupMissions.Visible = false;
            groupOverview.Visible = false;
            groupVehicles.Visible = false;
            gbPrograms.Visible = false;
        }


        private void btnMissions_Click_1(object sender, EventArgs e)
        {

            groupMissions.Visible = true;
            groupStaff.Visible = false;
            groupOverview.Visible = false;
            groupVehicles.Visible = false;
            gbPrograms.Visible = false;

        }

        private void btnVehicles_Click_1(object sender, EventArgs e)
        {
            groupVehicles.Visible = true;
            groupStaff.Visible = false;
            groupOverview.Visible = false;
            groupMissions.Visible = false;
            gbPrograms.Visible = false;

        }

        private void groupVehicles_Enter(object sender, EventArgs e)
        {

        }

        private void textBox12_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupOverview_Enter_1(object sender, EventArgs e)
        {

        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            Form1 home=(Form1)this.Tag;
            home.Show();
            this.Close();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnAddMission_Click(object sender, EventArgs e)
        {
            CreateMission form = new CreateMission(this.comp);
            form.Tag = this;
            form.Show();
            this.Hide();
        }

        private void groupMissions_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(this.lbMissions.SelectedItem!=null)
            {
                ManageMission form = new ManageMission((Mission)this.lbMissions.SelectedItem,this.comp.Comp_ID);
                form.Tag = this;
                form.Show();
                this.Hide();
            }
            
        }

        private void btnRemMission_Click(object sender, EventArgs e)
        {
            Mission mission = (Mission)lbMissions.SelectedItem;
            Mediator.deleteMission(mission.Mission_ID);
            this.refresh();

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            Vehicle vehicle = (Vehicle)lbVehicles.SelectedItem;
            Mediator.deleteVehicle(vehicle.Veh_ID);
            this.refresh();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {


        }

        private void button3_Click(object sender, EventArgs e)
        {
            CreateProgram form = new CreateProgram(this.comp.Comp_ID);
            form.Tag = this;
            form.Show();
            

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Programa prog = (Programa)lbPrograms.SelectedItem;
            Mediator.deleteProgram(prog.Prog_ID);
            this.refresh();
        }

        private void btnPrograms_Click(object sender, EventArgs e)
        {
            groupVehicles.Visible = false;
            groupStaff.Visible = false;
            groupOverview.Visible = false;
            groupMissions.Visible = false;
            gbPrograms.Visible = true;
        }

        private void btnNewVehicle_Click(object sender, EventArgs e)
        {
            CreateVehicle form = new CreateVehicle(this.comp);
            form.Tag = this;
            form.Show();
            this.Hide();
        }

        private void groupStaff_Enter(object sender, EventArgs e)
        {

        }

        private void btnUpdateSC_Click(object sender, EventArgs e)
        {
            Mediator.updateSpaceCompany(this.comp.Comp_ID, tbName.Text, tbCountry.Text, tbAcronym.Text, tbType.Text, tbOwner.Text);
            Console.WriteLine(this.comp.Comp_ID+tbName.Text+ tbCountry.Text+ tbAcronym.Text+ tbType.Text+ tbOwner.Text);
        }
    }
}
