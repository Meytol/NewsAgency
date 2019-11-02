using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class User : IAuditable
    {
        [MaxLength(50)]
        public string UserName { get; set; }
        [EmailAddress]
        [DataType(DataType.EmailAddress)]
        [MaxLength(100)]
        public string Email { get; set; }
        [DataType(DataType.Password)]
        [MaxLength(24)]
        [MinLength(8)]
        public string  Password { get; set; }
        [MaxLength(50)]
        public string FirstName { get; set; }
        [MaxLength(50)]
        [Required]
        public string LastName { get; set; }
        [NotMapped]
        public string FullName => FirstName + LastName;

        public bool IsActive { get; set; } = true;

        #region IAuditable Properties

        [Key]
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; } = (int) Common.Enums.Models.ViewState.Available;

        #endregion

        #region Relations

        public ICollection<UserRole> UserRoles { get; set; }

        #endregion
    }
}