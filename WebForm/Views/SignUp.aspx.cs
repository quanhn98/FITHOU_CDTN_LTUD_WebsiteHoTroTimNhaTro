﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class SignUp : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var userNameCookieValue = Request.Cookies["UserName"];
                var userNameSessionValue = (string)Session["UserName"];
                //var userIdSessionValue = (int)Session[userIdSession];
                var cookieCheck = (userNameCookieValue != null && string.IsNullOrEmpty(userNameCookieValue.Value));
                var sessionCheck = !string.IsNullOrEmpty(userNameSessionValue);
                if (cookieCheck || sessionCheck)
                {
                    Session.Abandon();
                    if (userNameCookieValue != null)
                    {
                        Request.Cookies.Remove("UserName");
                    }
                }
            }
        }

        protected void btSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                var user = new User()
                {
                    UserName = tbUserName.Text,
                    Password = tbPassword.Text,
                    PhoneNumber = tbPhoneNumber.Text
                };
                var addRs = UserManager.SignUp(user);
                if (addRs != null)
                {
                    Session["UserName"] = user.UserName;
                    Session["UserId"] = user.Id;
                    Response.Redirect("Index2");
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