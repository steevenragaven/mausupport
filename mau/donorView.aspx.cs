using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class donorView : System.Web.UI.Page
    {
        SqlConnection co = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }
        private void Bind()
        {
            string maincon = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            // Create Connection
            SqlConnection con = new SqlConnection(maincon);
            // Create Command
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "select * from dbo.REQUESTSUBMISSION WHERE ISACTIVE='TRUE'";
            scmd.Connection = con;
            // Create DataAdapter named dad (Refer to slide 7)
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            //Create DataSet/DataTable named dtMovies
            DataTable dt = new DataTable();
            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dt);
            }
            //Bind datatable to gridview
            MyRepeater.DataSource = dt;
            MyRepeater.DataBind();
        }

        

        protected void btnDonate_Click1(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32((sender as Button).CommandArgument);

            Response.Redirect($"donationDetail.aspx?id={ID}");
        }
    }
}
