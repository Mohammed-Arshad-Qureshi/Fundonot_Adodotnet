using DatabaseLayer.Note;
using DatabaseLayer.NoteModels;
using Microsoft.Extensions.Configuration;
using RepositoryLayer.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Services
{
    public class NoteRL : INoteRL
    {
        private readonly string connectionString;
        public NoteRL(IConfiguration configuartion)
        {
            connectionString = configuartion.GetConnectionString("Fundoonotes");
        }

        public async Task AddNote(int UserId, NoteModel noteModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            

            try
            {
                using (connection)
                {
                    connection.Open();
                    //Creating a stored Procedure for adding Users into database
                    SqlCommand com = new SqlCommand("spAddNote", connection);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@title", noteModel.Title);
                    com.Parameters.AddWithValue("@description", noteModel.Description);
                    com.Parameters.AddWithValue("@Bgcolor", noteModel.Bgcolor);
                    com.Parameters.AddWithValue("@UserId", UserId);
                    await com.ExecuteNonQueryAsync();
                   
                }
                   
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task UpdateNote(int UserId, int NoteId,UpdateNoteModel noteModel)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            var result = 0;

            try
            {
                using (connection)
                {
                    connection.Open();
                    //Creating a stored Procedure for adding Users into database
                    SqlCommand com = new SqlCommand("spUpdateNote", connection);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@title", noteModel.Title);
                    com.Parameters.AddWithValue("@description", noteModel.Description);
                    com.Parameters.AddWithValue("@Bgcolor", noteModel.Bgcolor);
                    com.Parameters.AddWithValue("@UserId", UserId);
                    com.Parameters.AddWithValue("@NoteId", NoteId);
                    com.Parameters.AddWithValue("@IsPin", noteModel.IsPin);
                    com.Parameters.AddWithValue("@IsArchive", noteModel.IsArchive);
                    com.Parameters.AddWithValue("@IsTrash", noteModel.IsTrash);
                    result = await com.ExecuteNonQueryAsync();
                    if(result <= 0)
                    {
                        throw new Exception("Note Does not Exist");
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

     
    }
}
