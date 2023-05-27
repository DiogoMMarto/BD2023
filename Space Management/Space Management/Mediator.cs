using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Space_Management
{
    public static class Mediator
    {
        private static SqlConnection cn = getSGBDConnection();

        private static SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source= localhost\\NORTHWIND;integrated security=true;initial catalog=PFinal");
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

            name = name + "'%'";
            country = country + "'%'";

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
            cmd.ExecuteNonQuery();

            cn.Close();

            return true;
        }

    }
}
