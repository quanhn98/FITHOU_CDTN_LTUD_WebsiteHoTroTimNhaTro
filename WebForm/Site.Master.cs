using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm
{
    public partial class SiteMaster : MasterPage
    {
        string userNameConfig = ConfigurationManager.AppSettings["userNameConfig"];
        string userNameSession = ConfigurationManager.AppSettings["userNameSession"];
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                hlProfile.Visible = false;
                btSignOut.Visible = false;
                hlSignIn.Visible = true;
                var userNameCookieValue = Request.Cookies[userNameConfig];
                var userNameSessionValue = Session[userNameSession];
                var cookieCheck = (userNameCookieValue != null && !string.IsNullOrEmpty(userNameCookieValue.Value));
                var sessionCheck = !string.IsNullOrEmpty(userNameSessionValue as string);
                if(cookieCheck || sessionCheck)
                {
                    hlSignIn.Visible = false;
                    hlProfile.Visible = true;
                    hlProfile.Text = cookieCheck?userNameCookieValue.Value:(string)userNameSessionValue;
                    if (!sessionCheck)
                    {
                        Session[userNameConfig] = userNameCookieValue.Value;
                    }
                    btSignOut.Visible = true;
                }
            }
        }

        protected void btSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            var userNameCookieValue = Request.Cookies[userNameConfig];
            if (userNameCookieValue != null)
            {
                Response.Cookies[userNameConfig].Value = null;
                Response.Redirect("SignIn");
            }
        }
    }
}