using DataAccessLayer.Repository;
using Action = DataAccessLayer.Entities.Action;

namespace BusinessLogicLayer.IServices
{
    public interface IActionService  : IGenericRepository<Action>
    {

    }
}