using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve data from the database
                DataTable dt = GetDataFromDatabase();

                RequestGridView.DataSource = dt;
                RequestGridView.DataBind();
            }
        }

        protected void RequestGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the data for the row
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                string title = rowView["TITLE"].ToString();

                // Add a hyperlink to the row
                HyperLink titleLink = new HyperLink();
                titleLink.Text = title;
                titleLink.NavigateUrl = "DetailsPage.aspx?title=" + Server.UrlEncode(title); // Pass the title as a query parameter
                e.Row.Cells[0].Controls.Add(titleLink);
            }
        }

        private DataTable GetDataFromDatabase()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            string query = "SELECT TITLE, DESCRIPTIONS, CATEGORY, U_NAME, TARGETDONATION, DEADLINE, URGENCY FROM REQUESTSUBMISSION";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    return dt;
                }
            }
        }
    }
}
