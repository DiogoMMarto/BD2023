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

                int Comp_ID = int.Parse(reader["Comp_ID"].ToString());
                Double Budget =Double.Parse(reader["Budget"].ToString());
                String Description = reader["Description"].ToString();
                String Conc_Date = reader["Conc_Date"].ToString();
                String Beg_Date = reader["Beg_Date"].ToString();

                Mission current = new Mission(Comp_ID,Budget,Description,Beg_Date,Conc_Date);
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
                String FName = reader["Fname"].ToString();
                String LName = reader["Lname"].ToString();
                String Birth = reader["Birth"].ToString();
                String Nationality = reader["Nationality"].ToString();
                String Role = reader["Role"].ToString();
                String Email = reader["Email"].ToString();
                String Phone = reader["Phone"].ToString();
                Employee current = new Employee(Comp_ID,FName,LName,Birth,Nationality,Role,Email,Phone);
                empregados.Add(current);
            }
            cn.Close();
            return empregados;
        }
    }
}
