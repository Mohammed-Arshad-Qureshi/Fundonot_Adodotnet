using DatabaseLayer.Note;
using DatabaseLayer.NoteModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryLayer.Interface
{
    public interface INoteRL
    {
        Task AddNote(int UserId, NoteModel noteModel);
        Task UpdateNote(int UserId,int NoteId, UpdateNoteModel noteModel);
        Task<List<NoteResponseModel>> GetAllNotes(int UserId);
        Task DeleteNote(int UserId, int NoteId);
    }
}
