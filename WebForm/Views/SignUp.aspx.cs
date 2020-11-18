using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class SignUp : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Abandon();
            //var userNameCookieValue = Request.Cookies["UserName"];
            //if (userNameCookieValue != null)
            //{
            //    Response.Cookies["UserName"].Value = null;
            //}
            if (!IsPostBack)
            {
                var userNameCookieValue = Request.Cookies["UserName"];
                var userNameSessionValue = (string)Session["UserName"];
                var cookieCheck = (userNameCookieValue != null && !string.IsNullOrEmpty(userNameCookieValue.Value));
                var sessionCheck = !string.IsNullOrEmpty(userNameSessionValue);
                if (cookieCheck || sessionCheck)
                {
                    if (Session["UserId"]!=null)
                    {
                        var userIdSessionValue = (int)Session["UserId"];
                        Response.Redirect("Profile?id=" + userIdSessionValue);
                    }
                    else
                    {
                        Response.Redirect("index2");
                    }
                    //Session.Abandon();
                    //if (userNameCookieValue != null)
                    //{
                    //    Request.Cookies.Remove("UserName");
                    //}
                    //HtmlGenericControl hlSignInContainerRef = Master.FindControl("hlSignInContainer") as HtmlGenericControl;
                    //hlSignInContainerRef.Visible = true;
                    //HtmlGenericControl hlProfileContainerRef = Master.FindControl("hlProfileContainer") as HtmlGenericControl;
                    //hlProfileContainerRef.Visible = false;
                    //HtmlGenericControl btnSignOutContainerRef = Master.FindControl("btnSignOutContainer") as HtmlGenericControl;
                    //btnSignOutContainerRef.Visible = false;
                    //hlSignInContainer.Visible = false;
                    //hlProfileContainer.Visible = true;
                    //hlProfile.Text = cookieCheck ? userNameCookieValue.Value : (string)userNameSessionValue;
                    //btnSignOutContainer.Visible = true;
                    //hlNewPostContainer.Visible = true;
                }
            }
        }

        //protected override void OnPreRender(EventArgs e)
        //{
        //    Session.Abandon();
        //    var userNameCookieValue = Request.Cookies["UserName"];
        //    if (userNameCookieValue != null)
        //    {
        //        Response.Cookies["UserName"].Value = null;
        //    }
        //    HtmlGenericControl hlSignInContainerRef = Master.FindControl("hlSignInContainer") as HtmlGenericControl;
        //    hlSignInContainerRef.Visible = true;
        //    HtmlGenericControl hlProfileContainerRef = Master.FindControl("hlProfileContainer") as HtmlGenericControl;
        //    hlProfileContainerRef.Visible = false;
        //    HtmlGenericControl btnSignOutContainerRef = Master.FindControl("btnSignOutContainer") as HtmlGenericControl;
        //    btnSignOutContainerRef.Visible = false;
        //    base.OnPreRender(e);
        //}

        protected void btSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                var user = new User()
                {
                    UserName = tbUserName.Text,
                    Password = tbPassword.Text,
                    PhoneNumber = tbPhoneNumber.Text,
                    FullName = tbFullName.Text
                };
                var addRs = UserManager.SignUp(user);
                if (addRs.Data != null)
                {
                    Session["UserName"] = user.UserName;
                    Session["UserId"] = user.Id;
                    Response.Redirect("Index2", false);
                }
                else
                {
                    notice.InnerText = addRs.Message;
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException?.InnerException?.Message != null)
                {
                    notice.InnerText = "Error : " + ex.InnerException?.InnerException?.Message;
                }
                else
                {
                    notice.InnerText = "Error : " + ex.Message;
                }
            }
        }
    }
}