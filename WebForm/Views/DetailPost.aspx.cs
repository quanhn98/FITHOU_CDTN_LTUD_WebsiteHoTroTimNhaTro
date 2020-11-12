using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.Models;
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
                //CheckUserLogon();
                var postId = Request.QueryString["Id"];
                if (postId != null)
                {
                    var post = PostManager.GetPostById(int.Parse(postId));
                    if (post != null)
                    {
                        DetailTitle.InnerText = post.Title;
                        SetData(post);
                    }
                }
            }
        }

        public void SetData(Post post)
        {
            var user = UserManager.GetUsers().FirstOrDefault(a => a.Id == post.UserId);
            createdUser.InnerText = user.UserName;
            if (Session["UserId"]!=null && post.UserId.Equals(int.Parse(Session["UserId"].ToString())))
            {
                btnClose.Visible = true;
                btnDelete.Visible = true;
                btnEdit.Visible = true;
                btnOpen.Visible = true;
                if (post.Closed)
                {
                    btnClose.Visible = false;
                    btnOpen.Visible = true;
                }
                else
                {
                    btnOpen.Visible = false;
                }
            }
            postTitle.InnerText = post.Title;
            price.InnerText = post.Price + " triệu/tháng";
            address.InnerText = post.HouseAddress;
            description.InnerText = post.Description;
            acreage.InnerText = post.Acreage.ToString() + " m2";
            ePrice.InnerText = post.ElectricityPrice.ToString() + " vnd";
            eWater.InnerText = post.WaterPrice.ToString() + " vnd";
            maxMem.InnerText = post.MaxMember.ToString() + " người";
            withHost.InnerText = post.WithHost.ToString();
            selfC.InnerText = post.SelfContained.ToString();
            time.InnerText = post.PostedDate.ToString();
            coordinatesX.Text = post.CoordinatesX;
            coordinatesY.Text = post.CoordinatesY;
            PostId.Text = post.Id.ToString();
            if (post.Closed)
            {
                close.InnerText = "Đã đóng";
            }
            if (!string.IsNullOrEmpty(post.ImagePaths))
            {
                var images = JsonConvert.DeserializeObject<List<MediaInfo>>(post.ImagePaths);
                if (images.Count == 0)
                {
                    var noImage = new MediaInfo()
                    {
                        Path = "/Content/Images/no-image.jpg"
                    };
                    var m = new List<MediaInfo>();
                    m.Add(noImage);
                    Repeater1.DataSource = m;
                    Repeater1.DataBind();
                }
                else
                {
                    Repeater1.DataSource = images;
                    Repeater1.DataBind();
                }
            }
            else
            {
                var noImage = new MediaInfo()
                {
                    Path = "/Content/Images/no-image.jpg"
                };
                var m = new List<MediaInfo>();
                m.Add(noImage);
                Repeater1.DataSource = m;
                Repeater1.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                var delete = PostManager.DeleteById(int.Parse(PostId.Text));
                if (delete)
                {
                    Response.Redirect("Index2.aspx");
                }
                else
                {
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                var post = PostManager.GetPostById(int.Parse(PostId.Text));
                post.Closed = true;
                var update = PostManager.Update(post);
                if (update)
                {
                    Response.Redirect("DetailPost.aspx?id="+post.Id);
                }
                else
                {
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            try
            {
                var post = PostManager.GetPostById(int.Parse(PostId.Text));
                post.Closed = false;
                var update = PostManager.Update(post);
                if (update)
                {
                    Response.Redirect("DetailPost.aspx?id=" + post.Id);
                }
                else
                {
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPost.aspx?id="+PostId.Text);
        }
    }
}