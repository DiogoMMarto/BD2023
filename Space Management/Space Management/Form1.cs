using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Space_Management
{
    public partial class Form1 : Form
    {
        private String type="Any";
        public Form1()
        {
            InitializeComponent();
            loadCompanies();

            this.Activated += Form1_Shown;
        }
        
       
        private void Form1_load(object sender, EventArgs e)
        {
            refresh();
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            refresh();
        }

        public void refresh()
        {
            loadCompanies();
        }
        private void loadCompanies()
        {
            lbCompanies.Items.Clear();
            List<Company> companies=Mediator.loadCompanies();
            foreach (Company current in companies)
            {
                lbCompanies.Items.Add(current);
            }
        }

        private void cbPrivate_CheckedChanged(object sender, EventArgs e)
        {
            if (cbPrivate.Checked)
            {
               
                cbPublic.Checked = false;
                cbAny.Checked = false;
                this.type = "Private";

            }
        }

        private void cbPublic_CheckedChanged(object sender, EventArgs e)
        {
            if (cbPublic.Checked)
            {

                cbPrivate.Checked = false;
                cbAny.Checked = false;
                this.type = "Public";


            }
        }

        private void cbAny_CheckedChanged(object sender, EventArgs e)
        {
            if (cbAny.Checked)
            {

                cbPublic.Checked = false;
                cbPrivate.Checked = false;
                this.type = "Any";


            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void MainPage_Load(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            CreateCompany createCompany = new CreateCompany();
            createCompany.Tag = this;
            createCompany.Show();
            this.Hide();
        }

        private void btnManage_Click(object sender, EventArgs e)
        {
            if (lbCompanies.SelectedItem != null)
            {
                ManageCompany manageForm= new ManageCompany((Company)lbCompanies.SelectedItem);
                manageForm.Tag = this;
                manageForm.Show(); 
                this.Hide();
            }
        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
            lbCompanies.Items.Clear();
            List<Company> companies = Mediator.loadCompanies(this.type, this.tbName.Text, this.tbCountry.Text);
            foreach (Company current in companies)
            {
                lbCompanies.Items.Add(current);
            }
        }
    }
}
