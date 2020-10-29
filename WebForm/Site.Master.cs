using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm
{
    public partial class SiteMaster : MasterPage
    {
        UserManager UserManager = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //var m = HttpContext.Current.Session.SessionID;
            //var y = Request.Cookies["ASP.NET_SessionId"];
            //Request.Cookies.Remove("ASP.NET_SessionId");
             if (!IsPostBack)
            {
                hlProfile.Visible = false;
                btSignOut.Visible = false;
                hlSignIn.Visible = true;
                var userNameCookieValue = Request.Cookies["UserName"];
                var userNameSessionValue = Session["UserName"];
                var cookieCheck = (userNameCookieValue != null && !string.IsNullOrEmpty(userNameCookieValue.Value));
                var sessionCheck = !string.IsNullOrEmpty(userNameSessionValue as string);
                if (cookieCheck || sessionCheck)
                {
                    var userLogon = UserManager.GetUserByName(userNameCookieValue.Value);
                    if (userLogon == null)
                    {
                        return;
                    }
                    hlSignIn.Visible = false;
                    hlProfile.Visible = true;
                    hlProfile.Text = cookieCheck ? userNameCookieValue.Value : (string)userNameSessionValue;
                    if (!sessionCheck)
                    {
                        Session["UserName"] = userNameCookieValue.Value;
                        Session["UserId"] = userLogon.Id;
                    }
                    btSignOut.Visible = true;
                    hlNewPost.Visible = true;
                }
            }
        }

        protected void btSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            var userNameCookieValue = Request.Cookies["UserName"];
            if (userNameCookieValue != null)
            {
                Response.Cookies["UserName"].Value = null;
                Response.Redirect("SignIn");
            }
        }
    }
}