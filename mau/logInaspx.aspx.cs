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
    public partial class logInaspx : System.Web.UI.Page
    {
        UserCredentials userCredentials = new UserCredentials();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Replace the connection string with your own database connection string
            var strcon = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM dbo.USER_CREDENTIAL WHERE USERNAME = @username AND ISACTIVE='True' AND PWD = @password", connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    bool isClient = (bool)reader["CLIENT"];
                    bool isDonor = (bool)reader["DONOR"];

                    // User is authenticated
                    Session["Username"] = txtUsername.Text;
                    Session["U_ID"] = userCredentials.U_ID;

                    // Redirect to the appropriate page based on the role
                    if (isClient)
                    {
                        Response.Redirect("client.aspx");
                    }
                    else if (isDonor)
                    {
                        Response.Redirect("donor.aspx");
                    }
                    else
                    {
                        // Handle other roles or scenarios as needed
                        Response.Redirect("homepage.aspx");
                    }
                }
                else
                {
                    // Authentication failed, Show an error message
                    lblError.Text = "Invalid username or password";
                }
                connection.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}
