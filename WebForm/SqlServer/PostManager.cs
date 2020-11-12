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
            post.PostedDate = DateTime.Now;
            var rs = appContext.Post.Add(post);
            appContext.SaveChanges();
            return rs;
        }
        public Post GetPostById(int id)
        {
            var post = appContext.Post.FirstOrDefault(a => a.Id == id);
            return post;
        }
        public List<Post> GetPostsByUserId(int userId)
        {
            var posts = appContext.Post.Where(a => a.UserId == userId);
            return posts.ToList();
        }

        public bool DeleteById(int id)
        {
            var post = appContext.Post.FirstOrDefault(a => a.Id == id);
            var dl = appContext.Post.Remove(post);
            appContext.SaveChanges();
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