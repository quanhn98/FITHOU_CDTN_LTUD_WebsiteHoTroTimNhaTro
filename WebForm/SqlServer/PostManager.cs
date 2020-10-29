using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class PostManager
    {
        AppContext appContext = new AppContext();

        public List<Post> GetPosts()
        {
            return appContext.Post.ToList();
        }
        public Post Add(Post post)
        {
            var rs = appContext.Post.Add(post);
            appContext.SaveChanges();
            return rs;
        }
        public List<Post> GetPostsByUserId(int userId)
        {
            var posts = appContext.Post.Where(a => a.UserId == userId);
            return posts.ToList();
        }
    }
}