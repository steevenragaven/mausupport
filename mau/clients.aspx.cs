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
    public partial class clients1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            // Retrieve form values

            string fullName = Request.Form["fullNameTextBox"]; ;
            string email = Request.Form[" emailTextBox"];
            string phoneNumber = Request.Form["phoneNumberTextBox"];
            string requestDetails = Request.Form["requestDetailsTextBox"];
            string deadline = Request.Form["deadline"];
            bool hasChildren = Request.Form["hasChildren"] == "yes";
            string relationshipStatus = Request.Form["relationshipStatus"];
            string mediaFilePath = null;  // Handle media file upload separately
            Console.WriteLine("Relationship Status: " + hasChildren);
            Console.WriteLine("Relationship Status: " + deadline);
            Console.WriteLine("Relationship Status: " + requestDetails);
            Console.WriteLine("Relationship Status: " + phoneNumber);
            // Insert into database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO HelpRequests (FullName, Email, PhoneNumber, RequestDetails, Deadline, HasChildren, RelationshipStatus, MediaFilePath) " +
                               "VALUES (@FullName, @Email, @PhoneNumber, @RequestDetails, @Deadline, @HasChildren, @RelationshipStatus, @MediaFilePath)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    command.Parameters.AddWithValue("@RequestDetails", requestDetails);
                    command.Parameters.AddWithValue("@Deadline", deadline);
                    command.Parameters.AddWithValue("@HasChildren", hasChildren);
                    command.Parameters.AddWithValue("@RelationshipStatus", relationshipStatus);
                    command.Parameters.AddWithValue("@MediaFilePath", mediaFilePath);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }


            // Redirect to reg.aspx after successful submission
            Response.Redirect("reg.aspx");
        }
    }
}
