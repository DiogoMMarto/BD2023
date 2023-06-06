using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class Company
    {
        private int _comp_ID;
        private String _name;
        private String _country;
        private String _owner;
        private String _acronym;
        private String _type;
        public int Comp_ID
        {
            get { return _comp_ID; }
            set { _comp_ID = value; }
        }
        public String Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public String Country
        {
            get { return _country; }
            set { _country = value; }
        }
        public String Acronym
        {
            get { return _acronym; }
            set { _acronym = value; }
        }
        public String Owner
        {
            get { return _owner; }
            set { _owner = value; }
        }
        public String Type
        {
            get { return _type; }
            set { _type = value; }
        }
        public Company(int Comp_ID,String name, String Country,String Owner,String Type,String Acronym= "")
        {
            this.Comp_ID = Comp_ID;
            this.Name = name;
            this.Country = Country;
            this.Owner = Owner;
            this.Type = Type;
            this.Acronym = Acronym;

        }
        public Company( String name, String Country, String Owner, String Type, String Acronym = "")
        {
            this.Name = name;
            this.Country = Country;
            this.Owner = Owner;
            this.Type = Type;
            this.Acronym = Acronym;

        }
        public override String ToString()
        {
            return $"{this._comp_ID,-5} {this._name,-45} {this._acronym, -5}";
        }

    }
}
