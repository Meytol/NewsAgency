using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Common.Enums.Models;
using Common.Interfaces.Models;
using DataAccessLayer.Database;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer.Repository
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class, IAuditable
    {
        protected DatabaseContext Context;
        private bool _disposed = false;

        public GenericRepository(DatabaseContext context)
        {
            Context = context;
        }

        #region Create

        /// <summary>
        /// Insert object to database
        /// </summary>
        /// <param name="entity">object</param>
        /// <param name="createdById">id of user who want to insert this object</param>
        /// <returns>
        /// return inserted object with id
        /// </returns>
        public virtual T Add(T entity, int createdById)
        {
            entity.CreatedBy = createdById;
            entity.CreatedOn = DateTime.Now;

            entity.UpdatedBy = createdById;
            entity.UpdatedOn = entity.CreatedOn;

            entity.ViewState = ViewState.Available.GetHashCode();

            Context.Set<T>().Add(entity);
            Save();

            return entity;
        }

        /// <summary>
        /// Insert object to database async
        /// </summary>
        /// <param name="entity">object</param>
        /// <param name="createdById">id of user who want to insert this object</param>
        /// <returns>
        /// return inserted object with id
        /// </returns>
        public virtual async Task<T> AddAsync(T entity, int createdById)
        {
            entity.CreatedBy = createdById;
            entity.CreatedOn = DateTime.Now;

            entity.UpdatedBy = createdById;
            entity.UpdatedOn = entity.CreatedOn;

            entity.ViewState = ViewState.Available.GetHashCode();

            await Context.Set<T>().AddAsync(entity);
            await SaveAsync();
            return entity;
        }

        #endregion

        #region Read By Admin

        /// <summary>
        /// Get all objects even those ViewState set to Deleted
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// Return objects if those are found else method returns null
        /// </returns>
        public IQueryable<T> GetAllByAdmin()
        {
            return Context.Set<T>();
        }

        /// <summary>
        /// Get all objects async even those ViewState set to Deleted
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// Return objects if those are found else method returns null
        /// </returns>
        public virtual async Task<ICollection<T>> GetAllAsyncByAdmin()
        {
            return await Context.Set<T>().ToListAsync();
        }

        /// <summary>
        /// Find object by id even thats's ViewState set to Deleted
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual T GetByAdmin(int id)
        {
            return Context.Set<T>().Find(id);
        }

        /// <summary>
        /// Find object Async by id even even thats's ViewState set to Deleted
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// Return object if that's found else method returns null
        /// </returns>
        public virtual async Task<T> GetAsyncByAdmin(int id)
        {
            return await Context.Set<T>().FindAsync(id);
        }

        /// <summary>
        /// Find object by some expression even that's ViewState set to Deleted
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual IQueryable<T> FindByAdmin(Expression<Func<T, bool>> match)
        {
            return Context.Set<T>().Where(match);
        }

        /// <summary>
        /// Find object async by some expression even that's ViewState set to Deleted
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual async Task<List<T>> FindAsyncByAdmin(Expression<Func<T, bool>> match)
        {
            return await Context.Set<T>().Where(match).ToListAsync();
        }

        /// <summary>
        /// Find objects by some expression even those's ViewState set to Deleted
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public ICollection<T> FinDataAccessLayerlByAdmin(Expression<Func<T, bool>> match)
        {
            return Context.Set<T>()
                .Where(match)
                .ToList();
        }

        /// <summary>
        /// Find objects async by some expression even those's ViewState set to Deleted
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public async Task<ICollection<T>> FinDataAccessLayerlAsyncByAdmin(Expression<Func<T, bool>> match)
        {
            return await Context.Set<T>()
                .Where(match)
                .ToListAsync();
        }

        /// <summary>
        /// Find objects by some expression even those's ViewState set to Deleted
        /// </summary>
        /// <param name="predicate"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public virtual IQueryable<T> FindByByAdmin(Expression<Func<T, bool>> predicate)
        {
            var query = Context.Set<T>()
                                .Where(predicate);
            return query;
        }

        /// <summary>
        /// Find objects async by some expression even those's ViewState set to Deleted
        /// </summary>
        /// <param name="predicate"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public virtual async Task<ICollection<T>> FindByAsyncByAdmin(Expression<Func<T, bool>> predicate)
        {
            var query = await Context.Set<T>()
                                      .Where(predicate)
                                      .ToListAsync();
            return query;
        }

        public IQueryable<T> GetAllIncludingByAdmin(params Expression<Func<T, object>>[] includeProperties)
        {

            var queryable = GetAllByAdmin();

            foreach (Expression<Func<T, object>> includeProperty in includeProperties)
            {
                queryable = queryable.Include<T, object>(includeProperty);
            }

            return queryable;
        }
        
        /// <summary>
        /// Count objects quentity even those's that ViewState set to Deleted
        /// </summary>
        /// <returns>
        /// return objects quentity
        /// </returns>
        public int CountByAdmin()
        {
            return Context.Set<T>()
                .Count();
        }

        /// <summary>
        /// Count objects quentity async even those's that ViewState set to Deleted
        /// </summary>
        /// <returns>
        /// return objects quentity
        /// </returns>
        public async Task<int> CountAsyncByAdmin()
        {
            return await Context.Set<T>()
                .CountAsync();
        }

        /// <summary>
        /// Check object exists by id even thats's ViewState set to Deleted
        /// </summary>
        /// <param name="id">object id</param>
        /// <returns></returns>
        public bool ExistsByAdmin(int id)
        {
            return Context.Set<T>()
                .Any(t => t.Id == id);
        }

        #endregion

        #region Read

        /// <summary>
        /// Get all available objects
        /// </summary>
        /// <returns>
        /// Return objects if those are found else method returns null
        /// </returns>
        public IQueryable<T> GetAll()
        {

            var entities = Context.Set<T>()
                .Where(e => e.ViewState == ViewState.Available.GetHashCode());

            return entities;

        }

        /// <summary>
        /// Get all available objects async
        /// </summary>
        /// <returns>
        /// Return objects if those are found else method returns null
        /// </returns>
        public virtual async Task<ICollection<T>> GetAllAsync()
        {
            var entities = Context.Set<T>()
                .Where(e => e.ViewState == ViewState.Available.GetHashCode())
                .ToListAsync();

            return await entities;
        }

        /// <summary>
        /// Find available object by id
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual T Get(int id)
        {
            var entity = Context.Set<T>().FirstOrDefault(e => e.Id == id && e.ViewState == ViewState.Available.GetHashCode());

            return entity;
        }

        /// <summary>
        /// Find available object async by id
        /// </summary>
        /// <param name="id"> object id </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual async Task<T> GetAsync(int id)
        {
            var entity = Context.Set<T>().FirstOrDefaultAsync(e => e.Id == id &&
                        e.ViewState == ViewState.Available.GetHashCode());

            return await entity;
        }

        /// <summary>
        /// Find available object by some expression
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual T Find(Expression<Func<T, bool>> match)
        {
            var t = Context.Set<T>().FirstOrDefault(match);

            return t?.ViewState == ViewState.Available.GetHashCode() ? t : null;
        }

        /// <summary>
        /// Find available object async by some expression
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return object if that's found else method returns null
        /// </returns>
        public virtual async Task<T> FindAsync(Expression<Func<T, bool>> match)
        {
            var t = await Context.Set<T>().FirstOrDefaultAsync(match);

            return t.ViewState == ViewState.Available.GetHashCode() ? t : null;

        }

        /// <summary>
        /// Find available objects by some expression
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public ICollection<T> FinDataAccessLayerl(Expression<Func<T, bool>> match)
        {
            return Context.Set<T>()
                .Where(match)
                .Where(t => t.ViewState == ViewState.Available.GetHashCode())
                .ToList();
        }

        /// <summary>
        /// Find available objects async by some expression
        /// </summary>
        /// <param name="match"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public async Task<ICollection<T>> FinDataAccessLayerlAsync(Expression<Func<T, bool>> match)
        {
            return await Context.Set<T>()
                .Where(match)
                .Where(t => t.ViewState == ViewState.Available.GetHashCode())
                .ToListAsync();
        }

        /// <summary>
        /// Find available objects by some expression
        /// </summary>
        /// <param name="predicate"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public virtual IQueryable<T> FindBy(Expression<Func<T, bool>> predicate)
        {
            var query = Context.Set<T>()
                                .Where(predicate)
                                .Where(t => t.ViewState == ViewState.Available.GetHashCode());
            return query;
        }

        /// <summary>
        /// Find available objects async by some expression
        /// </summary>
        /// <param name="predicate"> expression </param>
        /// <returns>
        /// return objects if that's found else method returns null
        /// </returns>
        public virtual async Task<ICollection<T>> FindByAsync(Expression<Func<T, bool>> predicate)
        {
            var query = await Context.Set<T>()
                                      .Where(predicate)
                                      .Where(t => t.ViewState == ViewState.Available.GetHashCode())
                                      .ToListAsync();
            return query;
        }

        public IQueryable<T> GetAllIncluding(params Expression<Func<T, object>>[] includeProperties)
        {

            var queryable = GetAll();

            foreach (Expression<Func<T, object>> includeProperty in includeProperties)
            {
                queryable = queryable.Include<T, object>(includeProperty);
            }

            return queryable;
        }

        /// <summary>
        /// Count available objects quentity
        /// </summary>
        /// <returns>
        /// return objects quentity
        /// </returns>
        public int Count()
        {
            return Context
                .Set<T>()
                .Count(t => t.ViewState == ViewState.Available.GetHashCode());
        }

        /// <summary>
        /// Count available objects quentity asunc
        /// </summary>
        /// <returns>
        /// return objects quentity
        /// </returns>
        public async Task<int> CountAsync()
        {
            return await Context.Set<T>()
                .Where(t => t.ViewState == ViewState.Available.GetHashCode())
                .CountAsync();
        }

        /// <summary>
        /// Check available object exists by id
        /// </summary>
        /// <param name="id">object id</param>
        /// <returns></returns>
        public bool Exists(int id)
        {
            return Context.Set<T>()
                .Where(t => t.ViewState == ViewState.Available.GetHashCode())
                .Any(t => t.Id == id);
        }

        #endregion

        #region Update

        /// <summary>
        /// update an object data
        /// </summary>
        /// <param name="newValue">new value object</param>
        /// <param name="oldValue">old value object with itself id</param>
        /// <param name="updatedById">id of user who want to update this object</param>
        /// <returns>
        /// returns updated object
        /// </returns>
        public virtual T Update(T newValue, T oldValue, int updatedById)
        {
            newValue.CreatedBy = oldValue.CreatedBy;
            newValue.CreatedOn = oldValue.CreatedOn;

            newValue.UpdatedBy = updatedById;
            newValue.UpdatedOn = DateTime.Now;

            Context.Entry(oldValue).CurrentValues.SetValues(newValue);
            Save();

            return oldValue;
        }

        /// <summary>
        /// update an object data async
        /// </summary>
        /// <param name="newValue">new value object</param>
        /// <param name="oldValue">old value object with itself id</param>
        /// <param name="updatedById">id of user who want to update this object</param>
        /// <returns>
        /// returns updated object
        /// </returns>
        public virtual async Task<T> UpdateAsync(T newValue, T oldValue, int updatedById)
        {
            newValue.CreatedBy = oldValue.CreatedBy;
            newValue.CreatedOn = oldValue.CreatedOn;

            newValue.UpdatedBy = updatedById;
            newValue.UpdatedOn = DateTime.Now;

            Context.Entry(oldValue).CurrentValues.SetValues(newValue);
            await SaveAsync();

            return oldValue;
        }


        /// <summary>
        /// update an object data
        /// </summary>
        /// <param name="newValue">object must have id</param>
        /// <param name="updatedById">id of user who want to update this object</param>
        /// <returns>
        /// returns updated object
        /// </returns>
        public virtual T Update(T newValue, int updatedById)
        {
            var oldValue = Get(newValue.Id);

            newValue.CreatedBy = oldValue.CreatedBy;
            newValue.CreatedOn = oldValue.CreatedOn;

            newValue.UpdatedBy = updatedById;
            newValue.UpdatedOn = DateTime.Now;

            Context.Entry(oldValue).CurrentValues.SetValues(newValue);

            Save();

            return oldValue;
        }

        /// <summary>
        /// update an object data async
        /// </summary>
        /// <param name="newValue">new value object with itself id</param>
        /// <param name="updatedById">id of user who want to update this object</param>
        /// <returns>
        /// returns updated object
        /// </returns>
        public virtual async Task<T> UpdateAsync(T newValue, int updatedById)
        {
            var oldValue = await GetAsync(newValue.Id);

            newValue.CreatedBy = oldValue.CreatedBy;
            newValue.CreatedOn = oldValue.CreatedOn;

            newValue.UpdatedBy = updatedById;
            newValue.UpdatedOn = DateTime.Now;

            Context.Entry(oldValue).CurrentValues.SetValues(newValue);

            await SaveAsync();

            return oldValue;
        }

        /// <summary>
        /// Logicaly delete an object
        /// set object Viewstate to Deleted
        /// </summary>
        /// <param name="id">object id</param>
        /// <param name="updatedById">id of user who want to disable this object</param>
        public void Disable(int id, int updatedById)
        {
            var entity = Get(id);
            entity.ViewState = ViewState.Deleted.GetHashCode();
            Update(entity, updatedById);
        }

        /// <summary>
        /// Logicaly delete an object async
        /// set object Viewstate to Deleted
        /// </summary>
        /// <param name="id">object id</param>
        /// <param name="updatedById">id of user who want to disable this object</param>
        public async Task DisableAsync(int id, int updatedById)
        {
            var entity = Get(id);
            entity.ViewState = ViewState.Deleted.GetHashCode();
            await UpdateAsync(entity, updatedById);
        }

        /// <summary>
        /// Restore an object
        /// set object Viewstate to Available
        /// </summary>
        /// <param name="id">object id</param>
        /// <param name="updatedById">id of user who want to enable this object</param>
        public void Enable(int id, int updatedById)
        {
            var entity = Get(id);
            entity.ViewState = ViewState.Available.GetHashCode();
            Update(entity, updatedById);
        }

        /// <summary>
        /// Restore an object async
        /// set object Viewstate to Available
        /// </summary>
        /// <param name="id">object id</param>
        /// <param name="updatedById">id of user who want to enable this object</param>
        public async Task EnableAsync(int id, int updatedById)
        {
            var entity = Get(id);
            entity.ViewState = ViewState.Available.GetHashCode();
            await UpdateAsync(entity, updatedById);
        }


        #endregion

        #region Delete

        /// <summary>
        /// delete prementaly an object from database
        /// </summary>
        /// <param name="entity">object</param>
        public virtual void Delete(T entity)
        {
            Context.Set<T>().Remove(entity);
            Save();
        }

        /// <summary>
        /// delete prementaly an object from database async
        /// </summary>
        /// <param name="entity">object</param>
        public virtual async Task DeleteAsync(T entity)
        {
            Context.Set<T>().Remove(entity);
            await SaveAsync();
        }

        /// <summary>
        /// delete prementaly an object from database with objectId
        /// </summary>
        /// <param name="entityId">object Id</param>
        public virtual void Delete(int entityId)
        {
            var entity = Get(entityId);
            Context.Set<T>().Remove(entity);
            Save();
        }

        /// <summary>
        /// delete prementaly an object from database async with objectId
        /// </summary>
        /// <param name="entityId">object Id</param>
        public virtual async Task DeleteAsync(int entityId)
        {
            var entity = await GetAsync(entityId);
            Context.Set<T>().Remove(entity);
            await SaveAsync();
        }

        #endregion

        #region Save DB

        /// <summary>
        /// save database changes
        /// </summary>
        public virtual void Save()
        {
            Context.SaveChanges();
        }

        /// <summary>
        /// save database changes async
        /// </summary>
        public virtual async Task SaveAsync()
        {
            await Context.SaveChangesAsync();
        }

        #endregion

        #region Dispose

        protected virtual void Dispose(bool disposing)
        {
            if (!this._disposed)
            {
                if (disposing)
                {
                    Context.Dispose();
                }
                this._disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


        #endregion
    }
}