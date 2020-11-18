using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class TestAjax : System.Web.UI.Page
    {
        CityManager CityManager = new CityManager();
        static DistrictManager DistrictManager = new DistrictManager();
        static LineManager LineManager = new LineManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static string GetDistrict(int cityId)
        {
            var districts = DistrictManager.GetDistricts().Where(a => a.CityId == cityId).Select(a => new District()
            {
                Id = a.Id,
                CityId = a.CityId,
                Name = a.Name
            });
            return JsonConvert.SerializeObject(districts);
        }
        [WebMethod]
        public static string GetLine(int districtId)
        {
            var lines = LineManager.GetLines().Where(a => a.DistrictId == districtId).Select(a => new Line()
            {
                Id = a.Id,
                DistrictId = a.DistrictId,
                Name = a.Name
            });
            return JsonConvert.SerializeObject(lines);
        }
    }
}