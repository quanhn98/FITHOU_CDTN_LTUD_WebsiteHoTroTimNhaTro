using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.Models;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class Admin : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();
        PostManager PostManager = new PostManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CheckUserLogon();
                this.BindListView();
            }
        }
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
            else if (!userLogon.IsAdmin??false)
            {
                Response.Redirect("Error?Message=Chỉ dành cho quản trị viên");
                return;
            }
            else if (sessionUserId == null)
            {
                sessionUserId = userLogon.Id;
            }
        }
        private void BindListView()
        {
            var users = UserManager.GetUsers().Select(a => new UserStatis(a)).ToList();
            foreach (var item in users)
            {
                var postU = PostManager.GetPostsByUserId(item.Id);
                item.PostActive = postU.Where(a => !a.Closed).Count();
                item.PostClosed = postU.Where(a => a.Closed).Count();
            }

            var posts = PostManager.GetPosts().Select(a => new PostStatis(a)).ToList();
            foreach (var item in posts)
            {
                item.UserName = UserManager.GetUsers().FirstOrDefault(a => a.Id == item.UserId).UserName;
            }

            lvUser.DataSource = users;
            lvUser.DataBind();

            lvPost.DataSource = posts;
            lvPost.DataBind();
        }

        protected void lvUser_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvUser.FindControl("DataPagerUser") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }

        protected void lvPost_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvPost.FindControl("DataPagerPost") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }
    }
}