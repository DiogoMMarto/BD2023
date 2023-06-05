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
    public partial class CreateProgram : Form
    {
        private int compID;
        public CreateProgram(int compID)
        {
            InitializeComponent();
            this.compID = compID;
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            int id=Mediator.addProgram(this.compID,this.tbName.Text);
            Programa prog = new Programa(id,this.compID,this.tbName.Text);
            ManageCompany form=(ManageCompany)this.Tag;
            form.refresh();
            this.Close();
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
