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
    public partial class CreatePayload : Form
    {
        private int mission_ID;
        private int comp_ID;
        public CreatePayload(int mission_ID,int comp_ID)
        {
            InitializeComponent();
            this.mission_ID = mission_ID;
            this.comp_ID = comp_ID;
        }

        private void CreatePayload_Load(object sender, EventArgs e)
        {
            this.loadSpacecrafts();
            this.loadRovers();
            this.loadAstronauts();
        }
        private void loadSpacecrafts()
        {
            this.lbSpacecrafts.Items.Clear();
            List<Spacecraft>crafts=Mediator.loadSpacecrafts(this.comp_ID);
            foreach(Spacecraft x in crafts)
            {
                this.lbSpacecrafts.Items.Add(x);
            }
        }
        private void loadRovers()
        {
            this.lbRover.Items.Clear();
            List<Rover> crafts = Mediator.loadRovers(this.comp_ID);
            foreach (Rover x in crafts)
            {
                this.lbRover.Items.Add(x);
            }
        }
        private void loadAstronauts()
        {
            this.lbAstronauts.Items.Clear();
            List<Employee> astronauts = Mediator.loadEmployees(this.comp_ID);
            foreach (Employee x in astronauts)
            {
                if(x.Role.Equals("Astronaut"))
                    this.lbAstronauts.Items.Add(x);
            }
        }
        private void lbAstronauts_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            lbCrew.Items.Add(lbAstronauts.SelectedItem);
            lbAstronauts.Items.Remove(lbAstronauts.SelectedItem);
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int roverID = -1;
            int crewID = -1;
            if (this.lbSpacecrafts.SelectedItem != null)
            {
                if (this.lbCrew.Items.Count != 0)
                {
                    Employee supervisor =(Employee) this.lbCrew.Items[0];
                    crewID=Mediator.createCrew(supervisor.Per_ID);
                    List<Employee> crew = new List<Employee>();
                    foreach(Employee x in lbCrew.Items)
                    {
                        crew.Add(x);
                    }
                    Mediator.addToCrew(crewID, crew);
                }
                

                Spacecraft craft = (Spacecraft)this.lbSpacecrafts.SelectedItem;
                int craftID = craft.Veh_ID;
                Rover rover = (Rover)this.lbRover.SelectedItem;
                if(rover!=null)
                    roverID = rover.Veh_ID;
                Mediator.AddPayload(craftID, this.mission_ID, crewID, roverID);
                ManageCompany form = (ManageCompany)this.Tag;
                form.refresh();
                form.Show();
                this.Close();

            }
        }
    }
}
