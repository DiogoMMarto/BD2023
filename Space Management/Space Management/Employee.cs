using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class Employee
    {
        private int _comp_ID;
        private int _per_ID;
        private String _fname;
        private String _lname;
        private String _birth;
        private String _email;
        private String _phone;
        private String _nationality;
        private String _role;

        public int Comp_ID
        {
            get { return _comp_ID; }
            set { _comp_ID = value; }
        }
        public int Per_ID
        {
            get { return _per_ID; }
            set { _per_ID = value; }
        }
        public String FName
        {
            get { return _fname; }
            set { _fname = value; }
        }
        public String LName
        {
            get { return _lname; }
            set { _lname = value; }
        }
        public String Birth
        {
            get { return _birth; }
            set { _birth = value; }
        }
        public String Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public String Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        public String Nationality
        {
            get { return _nationality; }
            set { _nationality = value; }
        }
        public String Role
        {
            get { return _role; }
            set { _role = value; }
        }
        public Employee(int Comp_ID,int Per_ID,String fname, String lname,String birth, String nationality, String role, String email = "", String phone = "")
        {
            this.Comp_ID = Comp_ID;
            this.Per_ID = Per_ID;
            this.FName = fname;
            this.LName = lname;
            this.Birth = birth;
            this.Nationality = nationality;
            this.Role = role;
            this.Email = email;
            this.Phone = phone;

        }
        public override String ToString()
        {
            return $"  {this.FName,-10} {this.LName,-15}{this.Phone, -20} {this.Email,-30}";
        }

    }
}
