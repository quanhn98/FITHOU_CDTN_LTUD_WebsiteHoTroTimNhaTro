using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FITHOU_CDTN_LTUD_WebsiteHoTroTimNhaTro_WebForm.Models
{
    public class Post
    {
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string[] ImagePaths { get; set; }
        public string[] VideoPaths { get; set; }
        public int Acreage { get; set; }
        public double ElectricityPrice { get; set; }
        public double WaterPrice { get; set; }
        public int MaxMember { get; set; }
        public bool WithHost { get; set; }
        public bool SelfContained { get; set; }
        public string HouseAddress { get; set; }
        public int LineId { get; set; }
        public int DistrictId { get; set; }
        public int CityId { get; set; }
        public int ProvinceId { get; set; }
        public int UserId { get; set; }
        public string ApartmentFull {
            get
            {
                return HouseAddress + "," + Line.Name + "," +District.Name+","+City.Name+","+ Province.Name;
            }
            set
            {
                this.ApartmentFull = value;
            }
        }
        public virtual District District {get;set;}
        public virtual City City {get;set;}
        public virtual Line Line {get;set; }
        public virtual Province Province {get;set; }
    }
}