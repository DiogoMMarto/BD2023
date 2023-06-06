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
    public partial class CreateCompany : Form
    {
        public CreateCompany()
        {
            InitializeComponent();
        }

        private void CreateCompany_Load(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbPrivate_CheckedChanged(object sender, EventArgs e)
        {
            if (cbPrivate.Checked)
            {
                Ceo.Visible = true;
                tbCEO.Visible = true;
                cbPublic.Checked = false;
            }
            else
            {
                Ceo.Visible = false;
                tbCEO.Visible = false;
            }
        }

        private void cbPublic_CheckedChanged(object sender, EventArgs e)
        {
            if (cbPublic.Checked)
            {
                GOV.Visible = true;
                tbGov.Visible = true;
                cbPrivate.Checked = false;

            }
            else
            {
                GOV.Visible = false;
                tbGov.Visible = false;
            }
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            
            if (!tbCEO.Text.Equals(""))
                Mediator.AddCompany(new Company(tbName.Text,tbCountry.Text,tbCEO.Text,"Private",tbAcronym.Text));
            if (!tbGov.Text.Equals(""))
                Mediator.AddCompany(new Company(tbName.Text, tbCountry.Text, tbGov.Text, "Public", tbAcronym.Text));

            Form1 form1 =(Form1)Tag;
            form1.refresh();
            form1.Show();
            this.Close();
        }
    }
}
