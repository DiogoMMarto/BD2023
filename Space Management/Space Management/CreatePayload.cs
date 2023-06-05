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
        private Company comp;
        public CreatePayload(Company comp)
        {
            InitializeComponent();
            this.comp = comp;
        }

        private void CreatePayload_Load(object sender, EventArgs e)
        {

        }

        private void lbAstronauts_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            lbCrew.Items.Add(lbAstronauts.SelectedItem);
        }
    }
}
