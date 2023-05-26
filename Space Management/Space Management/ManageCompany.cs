﻿using System;
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
        }


        private void btnMissions_Click_1(object sender, EventArgs e)
        {

            groupMissions.Visible = true;
            groupStaff.Visible = false;
            groupOverview.Visible = false;
            groupVehicles.Visible = false;
        }

        private void btnVehicles_Click_1(object sender, EventArgs e)
        {
            groupVehicles.Visible = true;
            groupStaff.Visible = false;
            groupOverview.Visible = false;
            groupMissions.Visible = false;
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
    }
}