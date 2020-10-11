using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.Views.Public
{
    public partial class Profile : System.Web.UI.Page
    {
        string userNameSession = ConfigurationManager.AppSettings["userNameSession"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var userNameSessionValue = (string)Session[userNameSession];
                if (string.IsNullOrEmpty(userNameSessionValue))
                {
                    Response.Redirect("~/Views/Public/SignIn");
                }
            }
        }


    }
}