using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.Models;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class EditPost : System.Web.UI.Page
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
                        postTitle.InnerText = "Sửa - "+post.Title;
                        PostId.Text = post.Id.ToString();
                        SetData(post);
                    }
                }
            }
        }
        public void SetData(Post post)
        {
            tbTitle.Text = post.Title;
            tbDes.InnerText = post.Description;
            tbPrice.Text = post.Price.ToString();
            tbAcreage.Text = post.Acreage.ToString();
            tbEprice.Text = post.ElectricityPrice.ToString();
            tbWprice.Text = post.WaterPrice.ToString();
            tbMaxmem.Text = post.MaxMember.ToString();
            cbWithHost.Checked = post.WithHost??false;
            cbSelfContained.Checked = post.SelfContained??false;
            tbAddress.Text = post.HouseAddress;
            tbCoordinatesX.Text = post.CoordinatesX;
            tbCoordinatesY.Text = post.CoordinatesY;
        }
        public void UpdatePost()
        {
            GetMediaPaths();
            var post = PostManager.GetPostById(int.Parse(PostId.Text));
            if (!string.IsNullOrEmpty(tbTitle.Text)) post.Title = tbTitle.Text;
            if (!string.IsNullOrEmpty(tbDes.InnerText)) post.Description = tbDes.InnerText;
            if (!string.IsNullOrWhiteSpace(tbPrice.Text)) post.Price = double.Parse(tbPrice.Text);
            if (!string.IsNullOrWhiteSpace(tbAcreage.Text)) post.Acreage = int.Parse(tbAcreage.Text);
            if (!string.IsNullOrWhiteSpace(tbEprice.Text)) post.ElectricityPrice = double.Parse(tbEprice.Text);
            if (!string.IsNullOrWhiteSpace(tbWprice.Text)) post.WaterPrice = double.Parse(tbWprice.Text);
            if (!string.IsNullOrWhiteSpace(tbMaxmem.Text)) post.MaxMember = int.Parse(tbMaxmem.Text);
            post.WithHost = cbWithHost.Checked;
            post.SelfContained = cbSelfContained.Checked;
            if (!string.IsNullOrEmpty(tbAddress.Text)) post.HouseAddress = tbAddress.Text;
            if (dlLineId.SelectedValue != null && dlLineId.SelectedValue.Length > 0) post.LineId = int.Parse(dlLineId.SelectedValue);
            if (dlDistrictId.SelectedValue != null && dlDistrictId.SelectedValue.Length > 0) post.DistrictId = int.Parse(dlDistrictId.SelectedValue);
            if (dlCityId.SelectedValue != null && dlCityId.SelectedValue.Length > 0) post.CityId = int.Parse(dlCityId.SelectedValue);
            if (!string.IsNullOrEmpty(tbCoordinatesX.Text)) post.CoordinatesX = tbCoordinatesX.Text;
            if (!string.IsNullOrEmpty(tbCoordinatesY.Text)) post.CoordinatesY = tbCoordinatesY.Text;
            if (ImagePaths.Length > 0)
            {
                post.ImagePaths = ImagePaths;
            }
            if (VideoPaths.Length > 0)
            {
                post.VideoPaths = VideoPaths;
            }
            post.UserId = int.Parse(Session["UserId"].ToString());
            var result = PostManager.Update(post);
            if (result)
            {
                Response.Redirect("DetailPost.aspx?id=" + post.Id + "");
            }
        }
        public void GetMediaPaths()
        {
            var imagePaths = new List<MediaInfo>();
            var videoPaths = new List<MediaInfo>();
            if (upMedia.HasFile)
            {
                foreach (var item in upMedia.PostedFiles)
                {
                    var fileInfo = new MediaInfo();
                    var fileEx = Path.GetExtension(item.FileName).Substring(1);
                    if (fileEx.Contains("mp4"))
                    {
                        fileInfo.EnumFileType = EnumFileType.Video;
                        fileInfo.Path = "/VideoUpload/" + item.FileName;
                        item.SaveAs(Path.Combine(Server.MapPath("~/VideoUpload/"), item.FileName));
                        videoPaths.Add(fileInfo);
                    }
                    else if (fileEx.Contains("jpg") || fileEx.Contains("png"))
                    {
                        fileInfo.EnumFileType = EnumFileType.Image;
                        fileInfo.Path = "/ImageUpload/" + item.FileName;
                        item.SaveAs(Path.Combine(Server.MapPath("~/ImageUpload/"), item.FileName));
                        imagePaths.Add(fileInfo);
                    }
                }
            }
            ImagePaths = JsonConvert.SerializeObject(imagePaths);
            VideoPaths = JsonConvert.SerializeObject(videoPaths);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdatePost();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailPost.aspx?id=" + PostId.Text);
        }
    }
}