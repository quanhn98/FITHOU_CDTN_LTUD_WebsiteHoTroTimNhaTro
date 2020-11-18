using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm.Views.Public
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var message = Request.QueryString["message"];
                if(message!=null && !string.IsNullOrEmpty(message))
                {
                    mesageShow.InnerText = message;
                }
            }
        }
    }
}