using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class SpaceProbe
    {
        private int _comp_ID;
        private int _veh_ID;
        private String _name;
        private String _size;
        private String _manufacturer;
        private String _description;
        private String _status;
        private String _location;
        private String _propulsion;
        private String _purpose;


        public int Comp_ID
        {
            get { return _comp_ID; }
            set { _comp_ID = value; }
        }
        public int Veh_ID
        {
            get { return _veh_ID; }
            set { _veh_ID = value; }
        }
        public String Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public String Manufacturer
        {
            get { return _manufacturer; }
            set { _manufacturer = value; }
        }
        public String Size
        {
            get { return _size; }
            set { _size = value; }
        }
        public String Description
        {
            get { return _description; }
            set { _description = value; }
        }
        public String Status
        {
            get { return _status; }
            set { _status = value; }
        }
        public String Location
        {
            get { return _location; }
            set { _location = value; }
        }
        public String Propulsion
        {
            get { return _propulsion; }
            set { _propulsion = value; }
        }
        public String Purpose
        {
            get { return _purpose; }
            set { _purpose = value; }
        }
        public SpaceProbe(int Comp_ID,int Veh_ID,String Name, String Size, String Manufacturer, String Description, String Status="", String Location="", String Propulsion="", String Purpose="")
        {
            this.Comp_ID = Comp_ID;
            this.Veh_ID = Veh_ID;
            this.Name = Name;
            this.Size = Size;
            this.Manufacturer = Manufacturer;
            this.Description = Description;
            this.Status = Status;
            this.Location = Location;
            this.Propulsion = Propulsion;
            this.Purpose = Purpose;

        }
        
        public override String ToString()
        {
            return $"{this.Veh_ID,-5} {this.Name,-45} ";
        }

    }
}
