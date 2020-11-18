using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.Models
{
    public class MediaInfo
    {
        public Guid Id { get; set; } = new Guid();
        public EnumFileType EnumFileType { get; set; }
        public string Path { get; set; }
    }
}