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
            var rs = appContext.District
                .ToList()
                ;
            return rs;
        }
    }
}