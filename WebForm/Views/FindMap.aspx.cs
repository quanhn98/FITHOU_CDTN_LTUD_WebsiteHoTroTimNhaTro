using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForm.Models;
using WebForm.SqlServer;

namespace WebForm.Views
{
    public partial class FindMap : System.Web.UI.Page
    {
        PostManager PostManager = new PostManager();
        CityManager CityManager = new CityManager();
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 2;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataIntoRepeater();
            if (!IsPostBack)
            {
                RenderFilter();
            }
        }
        public void RenderFilter()
        {
            var cities = CityManager.GetCities();
            search_city.DataTextField = "Name";
            search_city.DataValueField = "Id";
            search_city.DataSource = cities;
            search_city.DataBind();
            search_city.Items.Insert(0, new ListItem("---Thành phố---", ""));
        }

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        private void BindDataIntoRepeater()
        {
            var posts = GetPosts();
            _pgsource.DataSource = posts;
            _pgsource.AllowPaging = true;
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _pgsource.PageCount;
            lblpage.Text = "Trang " + (CurrentPage + 1) + " của " + _pgsource.PageCount;
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;

            rptResult.DataSource = _pgsource;
            rptResult.DataBind();
            HandlePaging();
            GetCoordinates(_pgsource);
        }

        public void GetCoordinates(PagedDataSource postsG)
        {
            var posts = postsG.Cast<Post>();
            var listC = new List<PostCoordinate>();
            foreach (var item in posts)
            {
                if (item.CoordinatesX != null && item.CoordinatesY != null)
                {
                    var c = new PostCoordinate();
                    c.Id = item.Id;
                    c.CoordinatesX = item.CoordinatesX;
                    c.CoordinatesY = item.CoordinatesY;
                    listC.Add(c);
                }
            }
            data.Value = JsonConvert.SerializeObject(listC);
        }
        public List<Post> GetPosts()
        {
            string filterText = iptFilterText.Value;
            var posts = PostManager.GetPosts().Where(a => a.Closed == false)
                .Where(a => (string.IsNullOrEmpty(filterText)) || a.Title.Contains(filterText))
                ;
            if (search_city.SelectedItem != null && search_city.SelectedValue != null && !string.IsNullOrEmpty(search_city.SelectedValue))
            {
                var cityId = int.Parse(search_city.SelectedValue);
                posts = posts.Where(a => a.CityId == cityId);
            }
            if (search_district.SelectedItem != null && search_district.SelectedValue != null && !string.IsNullOrEmpty(search_district.SelectedValue))
            {
                var cityId = int.Parse(search_district.SelectedValue);
                posts = posts.Where(a => a.CityId == cityId);
            }
            if (search_line.SelectedItem != null && search_line.SelectedValue != null && !string.IsNullOrEmpty(search_line.SelectedValue))
            {
                var cityId = int.Parse(search_line.SelectedValue);
                posts = posts.Where(a => a.CityId == cityId);
            }
            if (search_price.SelectedItem != null && search_price.SelectedValue != null && !string.IsNullOrEmpty(search_price.SelectedValue))
            {
                var price = int.Parse(search_price.SelectedValue);
                switch (price)
                {
                    case 1:
                        {
                            posts = posts.Where(a => a.Price >= 0 && a.Price < 1);
                        }
                        break;
                    case 2:
                        {
                            posts = posts.Where(a => a.Price >= 1 && a.Price <= 2);
                        }
                        break;
                    case 3:
                        {
                            posts = posts.Where(a => a.Price > 2 && a.Price <= 3);
                        }
                        break;
                    case 4:
                        {
                            posts = posts.Where(a => a.Price > 3 && a.Price <= 4);
                        }
                        break;
                }
            }
            if (search_acr.SelectedItem != null && search_acr.SelectedValue != null && !string.IsNullOrEmpty(search_acr.SelectedValue))
            {
                var acr = int.Parse(search_acr.SelectedValue);
                switch (acr)
                {
                    case 1:
                        {
                            posts = posts.Where(a => a.Acreage >= 0 && a.Acreage < 20);
                        }
                        break;
                    case 2:
                        {
                            posts = posts.Where(a => a.Acreage >= 20 && a.Acreage <= 30);
                        }
                        break;
                    case 3:
                        {
                            posts = posts.Where(a => a.Acreage > 30 && a.Acreage < 40);
                        }
                        break;
                }
            }
            return posts.OrderByDescending(a => a.PostedDate).ToList();
        }
        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        protected void lbFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindDataIntoRepeater();
        }
        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            BindDataIntoRepeater();
        }
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void submitFind_Click(object sender, EventArgs e)
        {
            //BindDataIntoRepeater();

        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.FromName("#ffba00");
        }
    }
}