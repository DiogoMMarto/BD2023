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
    public partial class CreateVehicle : Form
    {
        private Company comp;
        private String type;
        public CreateVehicle(Company comp)
        {
            this.comp = comp;
            InitializeComponent();
        }

        private void CreateVehicle_Load(object sender, EventArgs e)
        {
            tbTitle.Text = this.comp.Name;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void tbPropulsion_TextChanged(object sender, EventArgs e)
        {

        }

        private void gbSpaceProbe_Enter(object sender, EventArgs e)
        {

        }

        private void textBox12_TextChanged(object sender, EventArgs e)
        {

        }

        private void tbPurposeSP_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox13_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox27_TextChanged(object sender, EventArgs e)
        {

        }

        private void rbRover_CheckedChanged(object sender, EventArgs e)
        {
            type = "Rover";
            gbRover.Visible = true;
            gbSatelite.Visible = false;
            gbCrewedSpacecraft.Visible = false;
            gbSpaceStation.Visible = false;
            gbSpaceProbe.Visible = false;
            gbLaunchVehicle.Visible = false;
        }

        private void rbSpaceProbe_CheckedChanged(object sender, EventArgs e)
        {
            type = "SpaceProbe";
            gbRover.Visible = false;
            gbSatelite.Visible = false;
            gbCrewedSpacecraft.Visible = false;
            gbSpaceStation.Visible = false;
            gbSpaceProbe.Visible = true;
            gbLaunchVehicle.Visible = false;
        }

        private void rbSpaceStation_CheckedChanged(object sender, EventArgs e)
        {
            type = "SpaceStation";

            gbRover.Visible = false;
            gbSatelite.Visible = false;
            gbCrewedSpacecraft.Visible = false;
            gbSpaceStation.Visible = true;
            gbSpaceProbe.Visible = false;
            gbLaunchVehicle.Visible = false;
        }

        private void rbSatelite_CheckedChanged(object sender, EventArgs e)
        {
            type = "Satelite";

            gbRover.Visible = false;
            gbSatelite.Visible = true;
            gbCrewedSpacecraft.Visible = false;
            gbSpaceStation.Visible = false;
            gbSpaceProbe.Visible = false;
            gbLaunchVehicle.Visible = false;
        }

        private void rbCrewedSpacecraft_CheckedChanged(object sender, EventArgs e)
        {
            type = "CrewedSpacecraft";

            gbRover.Visible = false;
            gbSatelite.Visible = false;
            gbCrewedSpacecraft.Visible = true;
            gbSpaceStation.Visible = false;
            gbSpaceProbe.Visible = false;
            gbLaunchVehicle.Visible = false;
        }

        private void rbLaunchVehicle_CheckedChanged(object sender, EventArgs e)
        {
            type = "LaunchVehicle";

            gbRover.Visible = false;
            gbSatelite.Visible = false;
            gbCrewedSpacecraft.Visible = false;
            gbSpaceStation.Visible = false;
            gbSpaceProbe.Visible = false;
            gbLaunchVehicle.Visible = true;
        }

        private void tbPropulsionCrewed_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox24_TextChanged(object sender, EventArgs e)
        {

        }

        private void gbSpaceStation_Enter(object sender, EventArgs e)
        {

        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            ManageCompany form = (ManageCompany)this.Tag;
            form.Show();
            this.Close();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            if(type.Equals("Rover"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeR.Text, "", tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, "", "", tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);
            if (type.Equals("LaunchVehicle"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeR.Text, "", tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, "", "", tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);
            if (type.Equals("SpaceProbe"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeSP.Text,tbPropulsionSP.Text, tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, "", "", tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);
            if (type.Equals("SpaceStation"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeSpaceStation.Text, tbPropulsionSS.Text, tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, tbMinCapacitySS.Text, tbMaxCapacitySS.Text, tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);
            if (type.Equals("CrewedSpacecraft"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeCrewed.Text, tbPropulsionCrewed.Text, tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, tbMinCrewed.Text, tbMaxCrewed.Text, tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);
            if (type.Equals("Satelite"))
                Mediator.addVehicle(this.type, tbName.Text, this.comp.Comp_ID, tbSize.Text, tbMass.Text, tbManufacturer.Text, tbDescription.Text, tbPurposeSatelite.Text, tbPropulsionSatelite.Text, tbAutonomy.Text, tbCommSP.Text, tbScopeSP.Text, tbMinCrewed.Text, tbMaxCrewed.Text, tbLaunchCostLV.Text, tbDevCostLV.Text, tbFuelLV.Text, tbTypeLV.Text, tbRangeLV.Text, tbLoadLV.Text);

            ManageCompany form = (ManageCompany)this.Tag;
            form.Show();
            form.refresh();
            this.Close();
        }
    }
}
