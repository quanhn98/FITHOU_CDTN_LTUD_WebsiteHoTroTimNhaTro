using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class Index2 : System.Web.UI.Page
    {
        UserManager UserManager = new UserManager();
        ProvinceManager ProvinceManager = new ProvinceManager();
        CityManager CityManager = new CityManager();
        PostManager PostManager = new PostManager();
        DistrictManager DistrictManager = new DistrictManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RenderFilter();
                RenderPost();
            }
        }

        public void RenderFilter()
        {
            var cities = CityManager.GetCities();
            search_city.DataTextField = "Name";
            search_city.DataValueField = "Id";
            search_city.DataSource = cities;
            search_city.DataBind();
            search_city.Items.Insert(0, new ListItem("---Thành phố---","null"));
        }

        public void RenderPost()
        {
            var posts = PostManager.GetPosts().Where(a=>a.Closed==false).OrderByDescending(a=>a.PostedDate).ToList();
            Repeater1.DataSource = posts;
            Repeater1.DataBind();
            if (posts.Count > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < posts.Count; i++)
                    pages.Add((i + 1).ToString());
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                Repeater1.DataSource = posts;
                Repeater1.DataBind();
            }
        }

        protected void rptPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        [WebMethod]
        public static string GetData(string f, string s)
        {

            return "Test";
        }
    }
}