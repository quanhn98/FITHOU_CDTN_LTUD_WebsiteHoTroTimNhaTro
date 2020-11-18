using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using WebForm.SqlServer;

namespace WebForm.Models
{
    public class PostStatis
    {
        public PostStatis(Post post)
        {
            Id = post.Id;
            Title = post.Title;
            CountView = post.CountView;
            PostedDate = post.PostedDate;
            UserId = post.UserId;
        }
        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Title { get; set; }

        [StringLength(1000)]
        public string Description { get; set; }

        public string ImagePaths { get; set; }

        public string VideoPaths { get; set; }

        public int? Acreage { get; set; }

        public double? ElectricityPrice { get; set; }

        public double? WaterPrice { get; set; }

        public int? MaxMember { get; set; }

        public bool? WithHost { get; set; }

        public bool? SelfContained { get; set; }

        public string HouseAddress { get; set; }

        public int? LineId { get; set; }

        public int? DistrictId { get; set; }

        public int? CityId { get; set; }

        //public int? ProvinceId { get; set; }

        public int? UserId { get; set; }

        public double? Price { get; set; }

        public bool Closed { get; set; }
        public int? CountView { get; set; }
        public string CoordinatesX { get; set; }
        public string CoordinatesY { get; set; }
        public DateTime? PostedDate { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
    }
}