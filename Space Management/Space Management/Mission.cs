using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class Mission
    {
        private int _mission_ID;
        private Double _budget;
        private String _description;
        private String _beg_date;
        private String _conc_date;
        public int Mission_ID
        {
            get { return _mission_ID; }
            set { _mission_ID = value; }
        }
        public Double Budget
        {
            get { return _budget; }
            set { _budget = value; }
        }
        public String Description
        {
            get { return _description; }
            set { _description = value; }
        }
        public String Beg_Date
        {
            get { return _beg_date; }
            set { _beg_date = value; }
        }
        public String Conc_Date
        {
            get { return _conc_date; }
            set { _conc_date = value; }
        }
     
        public Mission(int Mission_ID,Double Budget, String Description,String Beg_Date,String Conc_Date="")
        {
            this.Mission_ID = Mission_ID;
            this.Budget = Budget;
            this.Description = Description;
            this.Beg_Date = Beg_Date;
            this.Conc_Date = Conc_Date;
        }
        public Mission(Double Budget, String Description, String Beg_Date, String Conc_Date = "")
        {
            this.Budget = Budget;
            this.Description = Description;
            this.Beg_Date = Beg_Date;
            this.Conc_Date = Conc_Date;
        }

        public override String ToString()
        {
            return $"{this._mission_ID,-5} {this._description,-45} {this.Budget+" M€", -10} {this.Beg_Date}";
        }

    }
}
