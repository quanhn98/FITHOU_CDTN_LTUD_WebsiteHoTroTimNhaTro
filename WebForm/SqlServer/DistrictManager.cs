using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class DistrictManager
    {
        AppContext appContext = new AppContext();

        public List<District> GetDistricts()
        {
            return appContext.District.ToList();
        }
    }
}