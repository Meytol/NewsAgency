using System;
using System.ComponentModel.DataAnnotations;

namespace DataAccessLayer.Entities
{
    public class Setting 
    {
        [Key]
        public string Key { get; set; }
        public string Value { get; set; }
    }
}