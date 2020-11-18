using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data.Entity;
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
            var checkExist = appContext.User.Any(a => a.UserName == user.UserName);
            if (checkExist)
            {
                return AppResultModel<User>.Failed(null, "Tên đăng nhập đã tồn tại");
            }
            var model = appContext.User.Add(user);
            var addRs = appContext.SaveChanges();
            if (addRs == 1)
            {
                return new AppResultModel<User>() { Data = model }.ResultSucceeded();
            }
            return AppResultModel<User>.Failed(null,"");
        }
        public AppResultModel<User> Update(User user)
        {
            try
            {
                appContext.Entry(user).State = EntityState.Modified;
                appContext.SaveChanges();
                return new AppResultModel<User>() { Data = user, Succeeded = true }.ResultSucceeded();
            }
            catch (Exception ex)
            {
                return AppResultModel<User>.Failed(ex,ex.Message);
            }
        }
        public AppResultModel<User> AddTotalPost(User user)
        {
            try
            {
                user.TotalPost++;
                appContext.Entry(user).State = EntityState.Modified;
                appContext.SaveChanges();
                return new AppResultModel<User>() { Data = user, Succeeded = true }.ResultSucceeded();
            }
            catch (Exception ex)
            {
                return AppResultModel<User>.Failed(ex, ex.Message);
            }
        }
        public AppResultModel<User> RemoveTotalPost(User user)
        {
            try
            {
                user.TotalPost--;
                appContext.Entry(user).State = EntityState.Modified;
                appContext.SaveChanges();
                return new AppResultModel<User>() { Data = user, Succeeded = true }.ResultSucceeded();
            }
            catch (Exception ex)
            {
                return AppResultModel<User>.Failed(ex, ex.Message);
            }
        }
    }
}