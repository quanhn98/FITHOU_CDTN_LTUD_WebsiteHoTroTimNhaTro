using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class ProvinceManager
    {
        AppContext appContext = new AppContext();

        public List<Province> GetProvinces()
        {
            return appContext.Province.ToList();
        }
    }
}