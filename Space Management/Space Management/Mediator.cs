using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace Space_Management
{
    public static class Mediator
    {
        private static SqlConnection cn = getSGBDConnection();

        private static SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source= localhost;integrated security=true;initial catalog=PFinal");
        }

        private static bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }
        public static List<Company> loadCompanies(String type="Any",String name="", String country="")
        {
            List<Company> companies = new List<Company>();
            if (!verifySGBDConnection())
                return companies;

            String priv = "default";
            String pub = "default";

            if(type.Equals("Public"))
                priv = "0";

            if(type.Equals("Private"))
                pub = "0";

            name = "'"+name + "%'";
            country = "'"+country + "%'";

            String command = "SELECT * FROM getSpaceAgency("+priv+","+pub+","+country+","+name+")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                int Comp_ID=int.Parse(reader["Comp_ID"].ToString());
                String Name = reader["Name"].ToString();
                String Country= reader["Country"].ToString();
                String Owner=reader["Owner"].ToString();
                String Type=reader["Type"].ToString();
                String Acronym=reader["Acronym"].ToString();

                Company current = new Company(Comp_ID, Name, Country, Owner, Type, Acronym);
                companies.Add(current);
            }
            cn.Close();
            return companies;
        }
        public static bool AddCompany(Company comp)
        {
            if (!verifySGBDConnection())
                return false;
            
            SqlCommand cmd =new SqlCommand("EXEC addCompany '" + comp.Name +"','"+comp.Country+"','"+comp.Acronym+"','"+comp.Type+"','"+comp.Owner+"';",cn);
            Console.WriteLine("EXEC addCompany '" + comp.Name + "','" + comp.Country + "','" + comp.Acronym + "','" + comp.Type + "','" + comp.Owner + "';");
            cmd.ExecuteNonQuery();

            cn.Close();

            return true;
        }
        public static List<Mission> loadMissions(int comp_ID)
        {
            List<Mission> missions = new List<Mission>();
            if (!verifySGBDConnection())
                return missions;

            String command = "SELECT * FROM getMissionsFromSpaceCompany("+comp_ID+")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                int Mission_Id = int.Parse(reader["Mission_ID"].ToString());
                Double Budget =Double.Parse(reader["Budget"].ToString());
                String Description = reader["Description"].ToString();
                String Conc_Date = reader["Conc_Date"].ToString();
                String Beg_Date = reader["Beg_Date"].ToString();

                Mission current = new Mission(Mission_Id, Budget,Description,Beg_Date,Conc_Date);
                missions.Add(current);
            }
            cn.Close();
            return missions;
        }
        public static int AddMission(Mission mission)
        {
            if (!verifySGBDConnection())
                return -1;
            SqlCommand cmd;
            DateTime beg;
            DateTime end;
            DateTime.TryParseExact(mission.Beg_Date, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out beg);
            if (mission.Conc_Date != "")
            {
                DateTime.TryParseExact(mission.Conc_Date, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out end);
                cmd = new SqlCommand("DECLARE @id INT; \nEXEC addMission '" + mission.Budget + "','" + mission.Description + "','" + beg + "','" + end + "', @id=@id OUTPUT;\n SELECT @id AS OutputID;", cn);
            }
            else
            {
                cmd = new SqlCommand("DECLARE @id INT;\nEXEC addMission '" + mission.Budget + "','" + mission.Description + "','" + beg  + "',@id=@id OUTPUT;\n SELECT @id AS OutputID;", cn);
            }
            Console.WriteLine("AddMission: "+"DECLARE @id INT;\nEXEC addMission '" + mission.Budget + "','" + mission.Description + "','" + beg + "',@id=@id OUTPUT;\n SELECT @id AS OutputID;");
            SqlDataReader reader= cmd.ExecuteReader();
            reader.Read();
            int id =(int)reader["OutputID"];
            cn.Close();

            return id;
        }
        public static void AddMissionToProgram(int missionID, int progID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("EXEC addMissionToProgram '"+progID+"','"+missionID+"';", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        public static List<Programa> loadPrograms(int comp_ID)
        {
            List<Programa> programas = new List<Programa>();
            if (!verifySGBDConnection())
                return programas;

            String command = "SELECT * FROM getProgramsOfCompany(" + comp_ID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int prog_ID = int.Parse(reader["Prog_ID"].ToString());
                String name = reader["Name"].ToString();
                Programa current = new Programa(prog_ID,comp_ID,name);
                programas.Add(current);
            }
            cn.Close();
            return programas;
        }
        public static List<Employee> loadEmployees(int comp_ID)
        {
            List<Employee> empregados = new List<Employee>();
            if (!verifySGBDConnection())
                return empregados;

            String command = "SELECT * FROM getEmployeesFromSpaceCompany(" + comp_ID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Comp_ID = (int)reader["Comp_ID"];
                int Per_ID = (int)reader["Per_ID"];
                String FName = reader["Fname"].ToString();
                String LName = reader["Lname"].ToString();
                String Birth = reader["Birth"].ToString();
                String Nationality = reader["Nationality"].ToString();
                String Role = reader["Role"].ToString();
                String Email = reader["Email"].ToString();
                String Phone = reader["Phone"].ToString();
                Employee current = new Employee(Comp_ID, Per_ID, FName,LName,Birth,Nationality,Role,Email,Phone);
                empregados.Add(current);
            }
            cn.Close();
            return empregados;
        }
        public static List<Vehicle> loadVehicles(int comp_ID)
        {
            List<Vehicle> veiculos = new List<Vehicle>();
            if (!verifySGBDConnection())
                return veiculos;

            String command = "SELECT * FROM getVehiclesFromSpaceCompany(" + comp_ID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Comp_ID = (int)reader["Comp_ID"];
                int Veh_ID = (int)reader["Veh_ID"];
                String Name = reader["Name"].ToString();
                String Size = reader["Size"].ToString();
                String Manufacturer = reader["Manufacturer"].ToString();
                String Description = reader["Description"].ToString();
                String Status = reader["Status"].ToString();
                String Location = reader["Location"].ToString();
                Vehicle current = new Vehicle(Comp_ID, Veh_ID,Name, Size, Description, Status, Location);
                veiculos.Add(current);
            }
            cn.Close();
            return veiculos;
        }
        public static List<Spacecraft> loadSpacecrafts(int comp_ID)
        {
            List<Spacecraft> crafts = new List<Spacecraft>();
            if (!verifySGBDConnection())
                return crafts;

            String command = "SELECT * FROM getSpacecraftFromSpaceCompany(" + comp_ID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Comp_ID = (int)reader["Comp_ID"];
                int Veh_ID = (int)reader["Veh_ID"];
                String Name = reader["Name"].ToString();
                String Size = reader["Size"].ToString();
                String Manufacturer = reader["Manufacturer"].ToString();
                String Description = reader["Description"].ToString();
                String Status = reader["Status"].ToString();
                String Location = reader["Location"].ToString();
                String Propulsion = reader["Propulsion"].ToString();
                String Purpose = reader["Purpose"].ToString();

                Spacecraft current = new Spacecraft(Comp_ID,Veh_ID, Name,Size,Manufacturer, Description,Status,Location,Propulsion,Purpose);
                crafts.Add(current);
            }
            cn.Close();
            return crafts;
        }
        public static List<Rover> loadRovers(int comp_ID)
        {
            List<Rover> rovers = new List<Rover>();
            if (!verifySGBDConnection())
                return rovers;

            String command = "SELECT * FROM getRoverFromSpaceCompany(" + comp_ID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Comp_ID = (int)reader["Comp_ID"];
                int Veh_ID = (int)reader["Veh_ID"];
                String Name = reader["Name"].ToString();
                String Size = reader["Size"].ToString();
                String Manufacturer = reader["Manufacturer"].ToString();
                String Description = reader["Description"].ToString();
                String Status = reader["Status"].ToString();
                String Location = reader["Location"].ToString();
                String Autonomy = reader["Autonomy"].ToString();
                String Purpose = reader["Purpose"].ToString();

                Rover current = new Rover(Comp_ID, Veh_ID, Name, Size, Manufacturer, Description, Status, Location, Autonomy, Purpose);
                rovers.Add(current);
            }
            cn.Close();
            return rovers;
        }
        public static List<String> loadSpacecraftsOfMission(int missionID)
        {
            List<String> spacecrafts = new List<String>();
            if (!verifySGBDConnection())
                return spacecrafts;

            String command = "SELECT * FROM getSpacecraftsOfMission(" + missionID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Mission_ID = (int)reader["Mission_ID"];
                int Veh_ID = (int)reader["Veh_ID"];
                String Name = reader["Name"].ToString();
               
                spacecrafts.Add($"{Veh_ID,-5} {Name,-45} ");
            }
            cn.Close();
            return spacecrafts;
        }
        public static Dictionary<String,Dictionary<String, String>> loadSpacecraftInvolvments(int missionID)
        {

            Dictionary<String,Dictionary<String, String>> spacecrafts=new Dictionary<String,Dictionary<string, string>>();
            if (!verifySGBDConnection())
                return spacecrafts;

            String command = "SELECT * FROM getSpacecraftInvolmentsInMission(" + missionID + ", -1)";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Dictionary<String, String> dic = new Dictionary<string, string>();
                String SpacecraftID= reader["SpacecraftID"].ToString();
                String Spacecraft = reader["SpacecraftName"].ToString();
                String Name = reader["Name"].ToString();
                String CrewId = reader["CrewID"].ToString();
                dic["Name"] = Name;
                dic["CrewID"] = CrewId;
                spacecrafts[SpacecraftID]=dic;
            }
            cn.Close();
            return spacecrafts;
        }
        public static List<Employee> loadCrew(int crewID)
        {

            List<Employee> empregados = new List<Employee>();
            if (!verifySGBDConnection())
                return empregados;

            String command = "SELECT * FROM getAustronautsFromCrew(" + crewID + ")";
            Console.WriteLine(command);
            SqlCommand cmd = new SqlCommand(command, cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int Per_ID = (int)reader["Per_ID"];
                String FName = reader["Fname"].ToString();
                String LName = reader["Lname"].ToString();
                String Birth = reader["Birth"].ToString();
                String Nationality = reader["Nationality"].ToString();
                String Role = reader["Role"].ToString();
                String Email = reader["Email"].ToString();
                String Phone = reader["Phone"].ToString();
                Employee current = new Employee(1, Per_ID, FName, LName, Birth, Nationality, Role, Email, Phone);
                empregados.Add(current);
            }
            cn.Close();
            return empregados;
        }
        public static void AddPayload(int craftID, int missionID, int crewID,int RoverID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("EXEC addPayload '" + craftID + "','" + missionID +"','" + craftID + "','"+ RoverID + "';", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        public static int createCrew(int supervisor)
        {
            if (!verifySGBDConnection())
                return -1;
            SqlCommand cmd = new SqlCommand("DECLARE @id INTEGER;\n EXEC addCrew '" +supervisor + "',@id=@id OUTPUT;\n SELECT @id AS OutputID;", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            int id = (int)reader["OutputID"];
            cn.Close();
            return id;
        }
        public static void addToCrew(int crewID,List<Employee> crew)
        {
            if (!verifySGBDConnection())
                return;
            foreach(Employee x in crew)
            {
                SqlCommand cmd = new SqlCommand("EXEC addToCrew '" + crewID + "','" + x.Per_ID + "';", cn);
                cmd.ExecuteNonQuery(); 
            }		

            cn.Close();
        }
        public static void addVehicle(String tipo, String Name, int Owner, String Size, String Mass, String Manufacturer, String description, String Purpose = "", String Propulsion = "", String Autonomy = "", String Comm = "", String Scope="",String Min="", String Max="",String LaunchCost="", String DevCost="",String Fuel="",String Type="",String Range="", String Load="")
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("DECLARE @id INTEGER; \nEXEC addVehicle '" + Name + "'," + Owner +",'" +Size  +"'," + Mass + ",'" + Manufacturer+"','" + description + "','OK','OK',@id=@id OUTPUT;\n SELECT @id AS OutputID;", cn);
            Console.WriteLine("DECLARE @id INTEGER; \nEXEC addVehicle '" + Name + "'," + Owner + ",'" + Size + "'," + Mass + ",'" + Manufacturer + "','" + description + "','OK','OK',@id=@id OUTPUT;\n SELECT @id AS OutputID;");
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            int id = (int)reader["OutputID"];
            reader.Close();
            if (tipo.Equals("Rover"))
            {
                cmd = new SqlCommand("EXEC addRover " + id + ",'" + Purpose +"',"+Autonomy+ ";", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                return;

            }
            if (tipo.Equals("LaunchVehicle"))
            {
                cmd = new SqlCommand("EXEC addSpaceProbe " + id + "," + LaunchCost + "," + DevCost + ",'" + Fuel + "'," + Range + ",'" + Load + "';", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                return;
            }
            cmd = new SqlCommand("EXEC addSpacecraft " + id + ",'" + Purpose + "','" + Propulsion + "';", cn);
            cmd.ExecuteNonQuery();
            if (tipo.Equals("SpaceProbe"))
            {
                cmd = new SqlCommand("EXEC addSpaceProbe " + id + ",'" + Comm + "','" + Scope + "';", cn);
                cmd.ExecuteNonQuery();

            }
            if (tipo.Equals("SpaceStation"))
            {
                cmd = new SqlCommand("EXEC addSpaceStation " + id + "," + Min + "," + Max + ";", cn);
                cmd.ExecuteNonQuery();

            }
            if (tipo.Equals("Satelite"))
            {
                cmd = new SqlCommand("EXEC addSatelite " + id+ ";", cn);
                cmd.ExecuteNonQuery();

            }
            

            cn.Close();
        }
        public static void deleteMission(int missionID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("EXEC deleteMission '" + missionID + "';", cn);
            cmd.ExecuteNonQuery();
            
            cn.Close();
        }
        public static void deleteVehicle(int vehicleID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("EXEC deleteVehicle '" + vehicleID + "';", cn);
            cmd.ExecuteNonQuery();

            cn.Close();
        }
        public static int addProgram(int compID,String Name)
        {
            if (!verifySGBDConnection())
                return -1;
            SqlCommand cmd = new SqlCommand("DECLARE @id INTEGER;\n EXEC addProgram '" + Name + "','" +compID + "',@id=@id OUTPUT;\n SELECT @id AS OutputID;", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            int id = (int)reader["OutputID"];
            cn.Close();
            return id;
        }
        public static void deleteProgram(int progID)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("EXEC deleteProgram '" + progID + "';", cn);
            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static void updateSpaceCompany(int ID, string Name ,string Country  ,string Acronym ,string Type  ,string Owner )
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("DECLARE @id INTEGER;\n EXEC updateCompany " + ID + ",'" + Name  + "','" + Country +  "','" + Acronym + "','" + Type + "','" + Owner+ "';", cn);
            cmd.ExecuteReader();
            cn.Close();
        }
    }
}
