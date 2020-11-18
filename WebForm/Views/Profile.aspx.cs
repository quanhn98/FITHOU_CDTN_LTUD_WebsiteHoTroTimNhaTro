using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class Profile : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();
        PostManager PostManager = new PostManager();
        public void CheckUserLogon()
        {
            var sessionUserName = Session["UserName"];
            var sessionUserId = Session["UserId"];
            if (sessionUserName == null)
            {
                Response.Redirect("SignIn");
                return;
            }
            var userLogon = UserManager.GetUserByName(sessionUserName.ToString());
            if (userLogon == null)
            {
                Response.Redirect("SignIn");
                return;
            }
            else if (sessionUserId == null)
            {
                sessionUserId = userLogon.Id;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserLogon();
                var sessionUserName = Session["UserName"];
                var sessionUserId = Session["UserId"];
                var userId = Request.QueryString["Id"];
                if (userId != null)
                {
                    var user = UserManager.GetUsers().Any(a => a.Id == int.Parse(userId.ToString()));
                    if (user)
                    {
                        RenderInfo(int.Parse(userId.ToString()));
                    }
                    else
                    {
                        Response.Redirect("Error");
                    }
                }else if (sessionUserId!=null)
                {
                    RenderInfo(int.Parse(sessionUserId.ToString()));
                }
                else
                {
                    Response.Redirect("Error");
                }
            }
        }

        public void RenderInfo(int id)
        {
            var user = UserManager.GetUsers().FirstOrDefault(a => a.Id == id);
            if (user == null)
            {
                Response.Redirect("Error");
            }
            if(user.Id != int.Parse(Session["UserId"].ToString()))
            {
                settingContainer.Visible = false;
            }
            else
            {
                settingContainer.Visible = true;
                updateProfile.HRef = "UpdateProfile.aspx?id=" + user.Id;
                changePass.HRef = "ChangePassword.aspx?id=" + user.Id;
            }
            fullName.InnerText = user.FullName;
            userName.InnerText = user.UserName;
            totalPost.InnerText = user.TotalPost.ToString();
            regDate.InnerText = user.RegistrationDate.Value.ToString("hh:mm dd/MM/yyyy");
            phoneNumber.InnerText = user.PhoneNumber;
            RenderListPost(id);
            RenderListPostClosed(id);
        }
        public void RenderListPost(int id)
        {
            var posts = PostManager.GetPostsByUserId(id).Where(a => !a.Closed);
            Repeater1.DataSource = posts;
            Repeater1.DataBind();
        }
        public void RenderListPostClosed(int id)
        {
            var posts = PostManager.GetPostsByUserId(id).Where(a => a.Closed);
            Repeater2.DataSource = posts;
            Repeater2.DataBind();
        }
    }
}