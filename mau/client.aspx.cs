using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace mau
{
    public partial class client1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Retrieve form values
            string fullName = fullNameTextBox.Text;
            string email = emailTextBox.Text;
            string phoneNumber = phoneNumberTextBox.Text;
            string requestDetails = requestDetailsTextBox.Text;
            string deadline = this.deadline.Text;
            bool hasChildren = childrenYes.Checked;
            string relationshipStatus = this.relationshipStatus.Text;


            if (proofMedia.HasFile)
            {
                string fileName = Path.GetFileName(proofMedia.FileName);
                string extension = Path.GetExtension(proofMedia.FileName);


                byte[] imageBytes = proofMedia.FileBytes;


                // Insert into database
                string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO REQUESTSUBMISSION (TITLE, DESCRIPTIONS, CATEGORY, U_NAME, C_ID, TARGETDONATION, DEADLINE, URGENCY, ISACTIVE, MEDIAFILEPATH) " +
                                   "VALUES (@Title, @Descriptions, @Category, @UName, @CID, @TargetDonation, @Deadline, @Urgency, @IsActive, @MediaFilePath)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Title", fullName);
                        command.Parameters.AddWithValue("@Descriptions", requestDetails);
                        command.Parameters.AddWithValue("@Category", relationshipStatus);
                        command.Parameters.AddWithValue("@UName", email);
                        command.Parameters.AddWithValue("@CID", phoneNumber);
                        command.Parameters.AddWithValue("@TargetDonation", 0); // Set the appropriate value for TargetDonation
                        command.Parameters.AddWithValue("@Deadline", deadline);
                        command.Parameters.AddWithValue("@Urgency", hasChildren);
                        command.Parameters.AddWithValue("@IsActive", true);
                        command.Parameters.AddWithValue("@MediaFilePath", imageBytes);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                // Redirect or display success message
                // ...
            }
        }

    }
}