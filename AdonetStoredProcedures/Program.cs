using System;
using System.Data;
using System.Data.SqlClient;
using System.Security;

namespace AdonetStoredProcedures
{
    class Program
    {
        static void Main(string[] args)
        {
            ExecStoredProcedure();
        }
        
        private static void ExecStoredProcedure()
        {
            SqlConnection conn = new SqlConnection("Data Source=192.168.0.106,1433;Initial Catalog=library;Integrated Security=False;user id=sa;password=Passw0rd%");
            conn.Open();
            SqlCommand cmd = new SqlCommand("getBooksNumber", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AuthorId", System.Data.
                SqlDbType.Int).Value = 2;
            SqlParameter outputParam = new SqlParameter("@BookCount", System.Data.SqlDbType.Int);
            outputParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(outputParam);
            cmd.ExecuteNonQuery();
            Console.WriteLine(cmd.Parameters["@BookCount"].Value.ToString());
        }
    }
}