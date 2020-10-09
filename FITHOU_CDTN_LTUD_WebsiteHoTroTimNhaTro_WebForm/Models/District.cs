using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FITHOU_CDTN_LTUD_WebsiteHoTroTimNhaTro_WebForm.Models
{
    public class Province
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class City : Province
    {
        public int ProvinceId { get; set; }
    }
    public class District : Province
    {
        public int CityId { get; set; }
    }
    public class Line : Province
    {
        public int DistrictId { get; set; }
    }
}