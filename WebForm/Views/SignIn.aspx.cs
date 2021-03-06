﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class Login : System.Web.UI.Page
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
                if(cookieCheck || sessionCheck)
                {
                    Session.Abandon();
                    if (userNameCookieValue != null)
                    {
                        Request.Cookies.Remove("UserName");
                    }
                }
            }
            notice.InnerText = "";
        }

        protected void btSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                var user = new User()
                {
                    UserName = tbUserName.Text,
                    Password = tbPassword.Text
                };
                var addRs = UserManager.SignIn(user);
                if (addRs.Succeeded)
                {
                    Session["UserName"] = user.UserName;
                    Session["UserId"] = user.Id;
                    HttpCookie httpCookie = new HttpCookie("UserName");
                    httpCookie.Value = addRs.Data.UserName.ToString();
                    if (cbRememberMe.Checked)
                    {
                        httpCookie.Expires = DateTime.Now.AddDays(1);
                    }
                    Response.Cookies.Add(httpCookie);
                    Response.Redirect("Index2");
                }
                else
                {
                    notice.InnerText = "Sai tên đăng nhập hoặc mật khẩu";
                }
            }
            catch (Exception ex)
            {
                notice.InnerText = "Error : "+ex.Message;
            }
        }
    }
}