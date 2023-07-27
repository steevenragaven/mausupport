using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class donationDetail : System.Web.UI.Page
    {
        private string maincon = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getProductDetails();
            }
        }

        private void getProductDetails()
        {

            // Create Connection
            SqlConnection con = new SqlConnection(maincon);
            // Create Command
            SqlCommand scmd = new SqlCommand();

            int qs = Convert.ToInt32(Request.QueryString["ID"]);

            scmd.CommandText = "SELECT * FROM dbo.REQUESTSUBMISSION WHERE ID = " + qs;
            scmd.Connection = con;


            // Create DataAdapter 
            SqlDataAdapter da = new SqlDataAdapter(scmd);

            //Create DataSet/DataTable 
            DataTable dt = new DataTable();

            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dt);
            }

            //Bind datatable to gridview
            DetailsView1.DataSource = dt;
            DetailsView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int qs = Convert.ToInt32(Request.QueryString["ID"]);
            using (var connection = new SqlConnection(maincon))
            {
                connection.Open();
                var sql1 = "INSERT INTO dbo.DONATION_DETAIL(donation_id, donation_amt)VALUES(@donID,)";

                using (var cmd = new SqlCommand(sql1, connection))
                {
                    cmd.Parameters.AddWithValue("@donID", qs.ToString().Trim());
                }
            }
            Response.Redirect("email.aspx");
        }
    }
}