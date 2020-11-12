using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class GetAddress : System.Web.UI.Page
    {
        CityManager CityManager = new CityManager();
        DistrictManager DistrictManager = new DistrictManager();
        LineManager LineManager = new LineManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            var cityId = Request["CityId"];
            var districtId = Request["DistrictId"];
            if (cityId != null)
            {
                var districts = DistrictManager.GetDistricts().Where(a => a.CityId == int.Parse(cityId))
                    .Select(a=>new District() { Id = a.Id, CityId = a.CityId, Name = a.Name })
                    .ToList()
                    ;
                Response.Write(JsonConvert.SerializeObject(districts));
            }else if (districtId!=null)
            {
                var lines = LineManager.GetLines().Where(a => a.DistrictId == int.Parse(districtId))
                    .Select(a => new Line() { Id = a.Id, DistrictId = a.DistrictId, Name = a.Name })
                    .ToList()
                    ;
                Response.Write(JsonConvert.SerializeObject(lines));
            }
            else
            {
                Response.Write("OK");
            }
        }
    }
}