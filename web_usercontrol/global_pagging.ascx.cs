using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usercontrol_global_pagging : System.Web.UI.UserControl
{
        private int _MaxPage;
        public int MaxPage
        {
            get
            {
                return MaxPage;
            }
            set
            {
                _MaxPage = value;
            }
        }
        private int _CurrentPage;
        public int CurrentPage
        {
            get
            {
                return CurrentPage;
            }
            set
            {
                _CurrentPage = value;
            }
        }
        private static string _Url;
        public string pagingUrl
        {
            get
            {
                return pagingUrl;
            }
            set
            {
                _Url = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_CurrentPage == _MaxPage)
            {
                btnNext.Enabled = false;
                btnLast.Enabled = false;
            }

            if (_CurrentPage > _MaxPage)
            {
                if (_MaxPage > 1)
                {
                    string url = _Url + "?page=" + (_MaxPage);
                    Response.Redirect(url);
                }
            }
            if (_CurrentPage == 1)
            {
                btnFirst.Enabled = false;
                btnPrevious.Enabled = false;
            }

            if (_MaxPage == 0 || _MaxPage == 1)
            {
                pagingContainer.Visible = false;
            }
            if (!IsPostBack)
            {
                txtCurentPage.Text = _CurrentPage.ToString();
            }
            lblMaxPage.InnerText = "of " + _MaxPage.ToString();
        }

        protected void btnLast_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(_Url + "?page=" + _MaxPage);
        }
        protected void btnNext_ServerClick(object sender, EventArgs e)
        {

            string url = _Url + "?page=" + (_CurrentPage + 1);
            Response.Redirect(url);

        }
        protected void btnFirst_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(_Url + "?page=" + 1);
        }
        protected void btnPrevious_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(_Url + "?page=" + (_CurrentPage - 1));
        }
        protected void txtCurentPage_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtCurentPage.Text) > 0 && Convert.ToInt32(txtCurentPage.Text) <= _MaxPage)
            {
                Response.Redirect(_Url + "?page=" + txtCurentPage.Text);
            }
            else
            {
                Response.Redirect(_Url + "?page=" + (_CurrentPage));
            }
        }
}