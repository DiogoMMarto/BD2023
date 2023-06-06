using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class Programa
    {
        private int _prog_ID;
        private int _comp_ID;
        private String _name;
        public int Prog_ID
        {
            get { return _prog_ID; }
            set { _prog_ID = value; }
        }
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
        public Programa(int ProgramID, int CompanyID, String Name)
        {
            this.Prog_ID = ProgramID;
            this.Comp_ID = CompanyID;
            this.Name = Name;
        }
        public Programa( int CompanyID, String Name)
        {
            this.Comp_ID = CompanyID;
            this.Name = Name;
        }

        public override String ToString()
        {
            return $"ID: {this.Prog_ID,-5} {this.Name,-45}";
        }

    }
}
