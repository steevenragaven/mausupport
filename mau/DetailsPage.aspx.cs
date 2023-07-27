using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace mau
{
    public partial class DetailsPage : System.Web.UI.Page
    {
        private string title;
        private string description;
        private string category;
        private string name;
        private string targetDonation;
        private string deadline;
        private string urgency;

        private DataRow GetRequestSubmissionDetails(string title)
        {
            DataRow dataRow = null;
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Prepare the SQL query to fetch the details based on the title
                string query = "SELECT [DESCRIPTIONS], [CATEGORY], [U_NAME], [C_ID], [TARGETDONATION], [DEADLINE], [URGENCY], [MEDIAFILEPATH] FROM [REQUESTSUBMISSION] WHERE [TITLE] = @Title";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Title", title);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Convert the data reader to a DataRow
                            DataTable dataTable = new DataTable();
                            dataTable.Load(reader);
                            dataRow = dataTable.Rows[0];
                        }
                    }
                }
            }

            return dataRow;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["title"] != null)
                {
                    // Retrieve the title from the query parameter
                    title = Server.UrlDecode(Request.QueryString["title"]);

                    // Get the request submission details based on the title
                    DataRow dataRow = GetRequestSubmissionDetails(title);

                    if (dataRow != null)
                    {
                        // Fetch the details from the DataRow
                        description = dataRow["DESCRIPTIONS"].ToString();
                        category = dataRow["CATEGORY"].ToString();
                        name = dataRow["U_NAME"].ToString();
                        targetDonation = dataRow["TARGETDONATION"].ToString();
                        deadline = dataRow["DEADLINE"].ToString();
                        urgency = dataRow["URGENCY"].ToString();

                        // Set the details in the corresponding labels
                        TitleLabel.Text = title;
                        DescriptionLabel.Text = description;
                        CategoryLabel.Text = category;
                        NameLabel.Text = name;
                        TargetDonationLabel.Text = targetDonation;
                        DeadlineLabel.Text = deadline;
                        UrgencyLabel.Text = urgency;

                        // Fetch the image data from the DataRow
                        object imageDataObj = dataRow["MEDIAFILEPATH"];
                        byte[] imageData = imageDataObj != DBNull.Value ? (byte[])imageDataObj : null;

                        // Check if the image data is available
                        if (imageData != null && imageData.Length > 0)
                        {
                            // Convert the byte array to a Base64 string
                            string base64Image = Convert.ToBase64String(imageData);

                            // Set the ImageUrl property with the Base64 string
                            ImageControl.ImageUrl = "data:image/jpeg;base64," + base64Image;
                        }
                        else
                        {
                            // Set a default image if no image data is available
                            ImageControl.ImageUrl = "path/to/default/image.jpg";
                        }
                    }
                    else
                    {
                        // Handle the case when no matching record is found in the database
                        // For example, display an error message or redirect to an error page
                        Response.Redirect("ErrorPage.aspx");
                    }
                }
                else
                {
                    // Handle the case when the title is not provided in the query parameter
                    // For example, display an error message or redirect to an error page
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }

        protected void AuthenticateButton_Click(object sender, EventArgs e)
        {
            string title = Server.UrlDecode(Request.QueryString["title"]);

            // Get the request submission details based on the title
            DataRow dataRow = GetRequestSubmissionDetails(title);

            if (dataRow != null)
            {
                // Get the column values from the DataRow
                string description = dataRow["DESCRIPTIONS"].ToString();
                string category = dataRow["CATEGORY"].ToString();
                string uName = dataRow["U_NAME"].ToString();
                string cID = dataRow["C_ID"].ToString();
                decimal targetDonation = Convert.ToDecimal(dataRow["TARGETDONATION"]);
                DateTime deadline = Convert.ToDateTime(dataRow["DEADLINE"]);
                bool urgency = Convert.ToBoolean(dataRow["URGENCY"]);

                // Insert the record into the help table
                string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQuery = "INSERT INTO help (TITLE, DESCRIPTIONS, CATEGORY, U_NAME, C_ID, TARGETDONATION, DEADLINE, URGENCY) " +
                                         "VALUES (@Title, @Descriptions, @Category, @UName, @CID, @TargetDonation, @Deadline, @Urgency)";
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@Title", title);
                        insertCommand.Parameters.AddWithValue("@Descriptions", description);
                        insertCommand.Parameters.AddWithValue("@Category", category);
                        insertCommand.Parameters.AddWithValue("@UName", uName);
                        insertCommand.Parameters.AddWithValue("@CID", cID);
                        insertCommand.Parameters.AddWithValue("@TargetDonation", targetDonation);
                        insertCommand.Parameters.AddWithValue("@Deadline", deadline);
                        insertCommand.Parameters.AddWithValue("@Urgency", urgency);
                        insertCommand.ExecuteNonQuery();
                    }
                    insertQuery = "INSERT INTO Notifications (Name, title, targetdonation) " +
                                         "VALUES ( @UName,@Title,@TargetDonation)";
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@UName", uName);
                        insertCommand.Parameters.AddWithValue("@Title", title);          
                        insertCommand.Parameters.AddWithValue("@TargetDonation", targetDonation);
   
                        insertCommand.ExecuteNonQuery();
                    }
                }

                // Redirect the user back to Webform1.aspx after successful insertion
                Response.Redirect("Webform1.aspx");
            }
            else
            {
                // Handle the case when no matching record is found in the database
                // For example, display an error message or redirect to an error page
                Response.Redirect("ErrorPage.aspx");
            }
        }

        protected void RefuseButton_Click(object sender, EventArgs e)
        {
            // Handle the Refuse button click event
            // Perform the refusal logic here
        }
    }
}
