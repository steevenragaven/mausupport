using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            // Retrieve form values
            string fullName = Text1.Value;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO name (name) " +
                               "VALUES (@FullName)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FullName", fullName);
              

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}