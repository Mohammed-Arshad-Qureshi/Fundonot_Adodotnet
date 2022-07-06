using DatabaseLayer;
using Microsoft.Extensions.Configuration;
using RepositoryLayer.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace RepositoryLayer.Services
{
    public class UserRL : IUserRL
    {

        private readonly string connectionString;
        public UserRL(IConfiguration configuartion)
        {
            connectionString = configuartion.GetConnectionString("Fundoonotes");
        }

        public bool AddUser(UsersModel users)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                using(connection)
                {
                    connection.Open();
                    //Creating a stored Procedure for adding Users into database
                    SqlCommand com = new SqlCommand("spAddUser", connection);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Firstname", users.FirstName);
                    com.Parameters.AddWithValue("@Lastname", users.LastName);
                    com.Parameters.AddWithValue("@Email", users.Email);
                    com.Parameters.AddWithValue("@password", users.Password);
                    var result = com.ExecuteNonQuery();
                    if(result > 0)
                    {
                        return true;
                    }
                    return false;
                }
                

            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
    }
}
