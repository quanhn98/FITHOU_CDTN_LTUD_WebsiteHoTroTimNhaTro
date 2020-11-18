using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using WebForm.SqlServer;

namespace WebForm.Models
{
    public class UserStatis
    {
        public UserStatis(User user)
        {
            Id = user.Id;
            UserName = user.UserName;
            Password = user.Password;
            RegistrationDate = user.RegistrationDate;
            IsAdmin = user.IsAdmin;
            PhoneNumber = user.PhoneNumber;
            TotalPost = user.TotalPost;
            FullName = user.FullName;
        }
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string UserName { get; set; }

        [Required]
        [StringLength(8)]
        public string Password { get; set; }

        public DateTimeOffset? RegistrationDate { get; set; }

        public bool? IsAdmin { get; set; }
        public string PhoneNumber { get; set; }
        public int TotalPost { get; set; }
        public string FullName { get; set; }
        public int PostActive { get; set; }
        public int PostClosed { get; set; }
    }
}