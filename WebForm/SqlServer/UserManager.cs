using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebForm.SqlServer
{
    public class UserManager
    {
        AppContext appContext = new AppContext();

        public List<User> GetUsers()
        {
            return appContext.User.ToList();
        }
        public User GetUserByName(string userName)
        {
            var user = appContext.User.FirstOrDefault(a=>a.UserName==userName);
            return user;
        }
        public AppResultModel<User> SignIn(User user)
        {
            var model = appContext.User.FirstOrDefault(b => b.UserName == user.UserName && b.Password == user.Password);
            if (model != null)
            {
                return new AppResultModel<User>() { Data = model }.ResultSucceeded();
            }
            return AppResultModel<User>.Failed(null,"User not found");
        }
        public AppResultModel<User> SignUp(User user)
        {
            user.RegistrationDate = DateTimeOffset.Now;
            user.IsAdmin = false;
            var model = appContext.User.Add(user);
            var addRs = appContext.SaveChanges();
            if (addRs == 1)
            {
                return new AppResultModel<User>() { Data = model }.ResultSucceeded();
            }
            return AppResultModel<User>.Failed(null,"");
        }
    }
}