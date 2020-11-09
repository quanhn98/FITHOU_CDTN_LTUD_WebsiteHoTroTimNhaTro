using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.Models;
using WebForm.SqlServer;

namespace WebForm.Views.Public
{
    public partial class NewPost : System.Web.UI.Page
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
            else if(sessionUserId==null)
            {
                sessionUserId = userLogon.Id;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserLogon();
                var provinces = ProvinceManager.GetProvinces();
                dlProvinceId.DataSource = provinces;
                dlProvinceId.DataTextField = "Name";
                dlProvinceId.DataValueField = "Id";
                dlProvinceId.DataBind();
                var subTitle = (Label)Master.FindControl("subTitles");
                if (subTitle != null) subTitle.Text = "Tạo tin mới";
            }
        }
        protected void btCreate_Click(object sender, EventArgs e)
        {
            CreatePost();
        }
        public void CreatePost()
        {
            GetMediaPaths();
            var post = new Post();
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
            if (dlLineId.SelectedValue != null && dlLineId.SelectedValue.Length>0) post.LineId = int.Parse(dlLineId.SelectedValue);
            if (dlDistrictId.SelectedValue != null && dlDistrictId.SelectedValue.Length>0 ) post.DistrictId = int.Parse(dlDistrictId.SelectedValue);
            if (dlCityId.SelectedValue != null && dlCityId.SelectedValue.Length>0) post.CityId = int.Parse(dlCityId.SelectedValue);
            if (dlProvinceId.SelectedValue != null && dlProvinceId.SelectedValue.Length>0 ) post.ProvinceId = int.Parse(dlProvinceId.SelectedValue);
            post.ImagePaths = ImagePaths;
            post.VideoPaths = VideoPaths;
            post.UserId = int.Parse(Session["UserId"].ToString());
            var result = PostManager.Add(post);
            if (result != null)
            {
                Response.Redirect("DetailPost.aspx?id="+result.Id+"");
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
                        fileInfo.Path = "/VideoUpload" + item.FileName;
                        item.SaveAs(Path.Combine(Server.MapPath("~/VideoUpload/"), item.FileName));
                        videoPaths.Add(fileInfo);
                    } else if (fileEx.Contains("jpg") || fileEx.Contains("png"))
                    {
                        fileInfo.EnumFileType = EnumFileType.Image;
                        fileInfo.Path = "/ImageUpload" + item.FileName;
                        item.SaveAs(Path.Combine(Server.MapPath("~/ImageUpload/"), item.FileName));
                        imagePaths.Add(fileInfo);
                    }
                }
            }
            ImagePaths = JsonConvert.SerializeObject(imagePaths);
            VideoPaths = JsonConvert.SerializeObject(videoPaths);
        }
        //protected void btSubmit_Click(object sender, EventArgs e)
        //{
        //    if (uploadFile.HasFile)
        //    {
        //        foreach (var item in uploadFile.PostedFiles)
        //        {
        //            var fileEx = Path.GetExtension(item.FileName).Substring(1);
        //            if (fileEx.Contains("mp4"))
        //            {
        //                item.SaveAs(System.IO.Path.Combine(Server.MapPath("~/VideoUpload/"), item.FileName));
        //                video.Attributes["src"] = "/VideoUpload/" + item.FileName;
        //            }
        //            else if (fileEx.Contains("jpg"))
        //            {
        //                item.SaveAs(System.IO.Path.Combine(Server.MapPath("~/ImageUpload/"), item.FileName));
        //                test.ImageUrl = "/ImageUpload/" + item.FileName;
        //            }
        //            //listofuploadedfiles.Text += String.Format("{0}<br />", item.FileName);
        //        }
        //    }
        //    //string imgName = uploadFile.FileName;
        //    ////sets the image path  
        //    //string imgPath = "App_Data/" + imgName;
        //    ////get the size in bytes that  

        //    //int imgSize = uploadFile.PostedFile.ContentLength;

        //    ////validates the posted file before saving  
        //    //if (uploadFile.PostedFile != null && uploadFile.PostedFile.FileName != "")
        //    //{
        //    //    // 10240 KB means 10MB, You can change the value based on your requirement  
        //    //    if (uploadFile.PostedFile.ContentLength > 10240)
        //    //    {
        //    //        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
        //    //    }
        //    //    else
        //    //    {
        //    //        //then save it to the Folder  
        //    //        uploadFile.SaveAs(Server.MapPath(imgPath));
        //    //        Image.ImageUrl = "~/" + imgPath;
        //    //        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image saved!')", true);
        //    //    }

        //    //}
        //}
    }
}