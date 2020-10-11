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
    }
}