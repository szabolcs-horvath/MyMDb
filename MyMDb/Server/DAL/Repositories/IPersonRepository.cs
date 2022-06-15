﻿using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories
{
    public interface IPersonRepository
    {
        Task<IReadOnlyCollection<PersonDto>> GetAll();
        Task<PersonDto?> Get(int id);
        Task<PersonDto> Insert(CreatePerson value);
        Task<PersonDto?> Update(PersonDto value);
        Task<PersonDto?> Delete(int id);
        Task<IReadOnlyCollection<SearchPerson>> SearchByName(string name);
    }
}