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
    public partial class CreateMission : Form
    {
        private Company company;
        private int prog_ID;
        public CreateMission(Company comp,int prog_ID=1)
        {
            this.company = comp;
            this.prog_ID = prog_ID;
            InitializeComponent();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void CreateMission_Load(object sender, EventArgs e)
        {
            this.tbTitle.Text = this.company.Name;
            this.tbBegDate.Text = DateTime.Now.ToString();
            loadPrograms();

        }
        public void loadPrograms()
        {
            this.lbPrograms.Items.Clear();

            List<Programa> programs=Mediator.loadPrograms(this.company.Comp_ID);
            foreach(Programa program in programs)
            {
                this.lbPrograms.Items.Add(program);
            }
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            
            Mission mission = new Mission(Double.Parse(this.tbBudget.Text), this.tbDescription.Text, this.tbBegDate.Text, this.tbFinishDate.Text);
            Mediator.AddMission(mission);
            Mediator.AddMissionToProgram(mission.Mission_ID, prog_ID);
            Console.WriteLine("AQUI");
            ManageCompany form = (ManageCompany)Tag;
            form.refresh();
            form.Show();
            this.Close();
        }

        private void lbPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.btnCreate.Enabled = true;
            Programa prog= (Programa)lbPrograms.SelectedItem;
            this.prog_ID=prog.Prog_ID;
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            ManageCompany form = (ManageCompany)Tag;
            form.refresh();
            form.Show();
            this.Close();
        }
    }
}
