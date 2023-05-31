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
            int Comp_ID;
            String Name;
            String Country;
            String Owner;
            String Type;
            String Acronym;
            if (!verifySGBDConnection())
                return companies;

            SqlCommand cmd = new SqlCommand("CALL getSpaceCompany", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["Gov"].Equals("NULL")) Type = "Public";
                else Type = "Private";
                Name = reader["Name"].ToString();
                Country = reader["Country"].ToString();
                if(Type.Equals("Public")) Owner = reader["Gov"].ToString();
                else Owner = reader["CEO"].ToString();
                if (reader["Acronym"] != null) Acronym = reader["Acronym"].ToString();
                else Acronym = "";
                Comp_ID = int.Parse(reader["Comp_ID"].ToString());
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
            SqlCommand cmd =new SqlCommand($"INSERT INTO SpaceCompany  (Name,Country,Acronym) VALUES ('{comp.Name}','{comp.Country}','{comp.Acronym}');",cn);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("SELECT TOP 1 Comp_ID FROM SpaceCompany ORDER BY Comp_ID DESC", cn);
            int id = (int)cmd.ExecuteScalar();
            if (comp.Type.Equals("Public"))
                cmd=new SqlCommand($"INSERT INTO PublicSpaceCompany (Comp_ID,Gov) VALUES ('{id}','{comp.Owner}')",cn);
            else
                cmd=new SqlCommand($"INSERT INTO PrivateSpaceCompany (Comp_ID,CEO) VALUES ('{id}','{int.Parse(comp.Owner)}')",cn);
            cmd.ExecuteNonQuery();
            cn.Close();

            return true;
        }

    }
}
