using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserLogon();
                var userId = Session["UserId"];
                if (userId != null)
                {
                    var user = UserManager.GetUsers().Any(a=>a.Id==int.Parse(userId.ToString()));
                    if (user)
                    {

                    }
                    else
                    {
                        Response.Redirect("Error");
                    }
                }
                else
                {
                    Response.Redirect("Error");
                }
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
            else if (sessionUserId == null)
            {
                sessionUserId = userLogon.Id;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var userNameSessionValue = Session["UserName"];
            //var idSessionValue = Session["UserId"];
            var user = UserManager.GetUserByName(userNameSessionValue.ToString());
            if (!string.IsNullOrEmpty(tbFullName.Text))
            {
                user.FullName = tbFullName.Text;
            }
            if (!string.IsNullOrEmpty(tbPhoneNumber.Text))
            {
                user.PhoneNumber = tbPhoneNumber.Text;
            }
            var update = UserManager.Update(user);
            if (update.Succeeded)
            {
                Response.Redirect("Profile?id=" + user.Id);
            }
            else
            {
                notice.InnerText = update.Message;
            }
        }
    }
}