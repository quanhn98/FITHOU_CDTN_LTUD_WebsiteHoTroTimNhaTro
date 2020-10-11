using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class Index : Page
    {
        UserManager UserManager = new UserManager();
        ProvinceManager ProvinceManager = new ProvinceManager();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}