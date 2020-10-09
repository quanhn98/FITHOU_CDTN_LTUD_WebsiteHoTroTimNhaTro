using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FITHOU_CDTN_LTUD_WebsiteHoTroTimNhaTro_WebForm.Models
{
    public class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public DateTimeOffset RegistrationDate { get; set; }
        public bool IsAdmin { get; set; }
    }
}