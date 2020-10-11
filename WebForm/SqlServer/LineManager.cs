using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class LineManager
    {
        AppContext appContext = new AppContext();

        public List<Line> GetLines()
        {
            return appContext.Line.ToList();
        }
    }
}