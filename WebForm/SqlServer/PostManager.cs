using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using WebForm.Models;

namespace WebForm.SqlServer
{
    public class PostManager
    {
        AppContext appContext = new AppContext();
        UserManager UserManager = new UserManager();
        public List<Post> GetPosts()
        {
            var posts = appContext.Post.ToList();
            if (posts.Count > 0)
            {
                foreach (var item in posts)
                {
                    if (!string.IsNullOrEmpty(item.ImagePaths))
                    {
                        var medias = JsonConvert.DeserializeObject<List<MediaInfo>>(item.ImagePaths);
                        if (medias.Count > 0)
                        {
                            item.Thumbnail = medias.FirstOrDefault().Path;
                        }
                    }
                }
            }
            return posts;
        }
        public Post Add(Post post)
        {
            var user = UserManager.GetUsers().FirstOrDefault(a => a.Id == post.UserId);
            if (user == null)
            {
                return null;
            }
            post.PostedDate = DateTime.Now;
            post.CountView = 0;
            var rs = appContext.Post.Add(post);
            appContext.SaveChanges();
            if (rs != null)
            {
                UserManager.AddTotalPost(user);
            }
            return rs;
        }
        public Post GetPostById(int id)
        {
            var post = appContext.Post.FirstOrDefault(a => a.Id == id);
            return post;
        }
        public List<Post> GetPostsByUserId(int userId)
        {
            var posts = appContext.Post.Where(a => a.UserId == userId).ToList();
            if (posts.Count > 0)
            {
                foreach (var item in posts)
                {
                    if (!string.IsNullOrEmpty(item.ImagePaths))
                    {
                        var medias = JsonConvert.DeserializeObject<List<MediaInfo>>(item.ImagePaths);
                        if (medias.Count > 0)
                        {
                            item.Thumbnail = medias.FirstOrDefault().Path;
                        }
                    }
                }
            }
            return posts;
        }

        public bool DeleteById(int id)
        {
            var post = appContext.Post.FirstOrDefault(a => a.Id == id);
            if (post == null)
            {
                return false;
            }
            var user = UserManager.GetUsers().FirstOrDefault(a => a.Id == post.UserId);
            if (user == null)
            {
                return false;
            }
            var dl = appContext.Post.Remove(post);
            appContext.SaveChanges();
            if (dl != null)
            {
                UserManager.RemoveTotalPost(user);
            }
            return true;
        }

        public bool Update(Post post)
        {
            appContext.Entry(post).State = EntityState.Modified;
            appContext.SaveChanges();
            return true;
        }
    }
}