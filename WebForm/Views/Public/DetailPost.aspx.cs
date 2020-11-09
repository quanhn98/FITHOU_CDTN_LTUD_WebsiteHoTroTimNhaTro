using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class DetailPost : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();
        LineManager LineManager = new LineManager();
        DistrictManager DistrictManager = new DistrictManager();
        CityManager CityManager = new CityManager();
        ProvinceManager ProvinceManager = new ProvinceManager();
        public string ImagePaths { get; set; } = "";
        public string VideoPaths { get; set; } = "";
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
                var postId = Request.QueryString["Id"];
                if (postId != null)
                {
                    var post = PostManager.GetPostById(int.Parse(postId));
                    if (post != null)
                    {
                        DetailTitle.InnerText = post.Title;
                    }
                }
            }
        }
    }
}