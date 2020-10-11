using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class CityManager
    {
        AppContext appContext = new AppContext();

        public List<City> GetCities()
        {
            return appContext.City.ToList();
        }
    }
}