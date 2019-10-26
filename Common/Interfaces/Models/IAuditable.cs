using System;

namespace Common.Interfaces.Models
{
    public interface IAuditable
    {
        int Id { get; set; }

        int CreatedBy { get; set; }
        DateTime CreatedOn { get; set; }

        int UpdatedBy { get; set; }
        DateTime UpdatedOn { get; set; }

        int ViewState { get; set; }
    }
}