using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Space_Management
{
    public class Payload
    {
        private int _mission_ID;
        private int _craft_ID;
        private int _crew_ID;
        private int _rover_ID;
        public int Mission_ID
        {
            get { return _mission_ID; }
            set { _mission_ID = value; }
        }
        public int Craft_ID
        {
            get { return _craft_ID; }
            set { _craft_ID = value; }
        }
        public int Crew_ID
        {
            get { return _crew_ID; }
            set { _crew_ID = value; }
        }
        public int Rover_ID
        {
            get { return _rover_ID; }
            set { _rover_ID = value; }
        }
        public Payload(int Craft,int Mission=-1,int Crew=-1, int Rover = -1)
        {
            this.Mission_ID = Mission;
            this.Craft_ID = Craft;
            this.Crew_ID = Crew;
            this.Rover_ID = Rover;
        }
        public override String ToString()
        {
            String crew = "";
            String rover = "";
            if (this.Crew_ID != -1) crew = Crew_ID.ToString();
            if (this.Rover_ID != -1) rover = Rover_ID.ToString();

            return $"{this.Mission_ID,-5} {this.Craft_ID,-5} {crew, -5} {rover,-5}";
        }

    }
}
