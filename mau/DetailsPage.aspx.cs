using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace mau
{
    public partial class DetailsPage : System.Web.UI.Page
    {
        // Declare variables at the class level
        private string title;
        private string description;
        private string category;
        private string name;
        private string targetDonation;
        private string deadline;
        private string urgency;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["title"] != null)
                {
                    // Retrieve the title from the query parameter
                    title = Server.UrlDecode(Request.QueryString["title"]);

                    // Use the title to fetch the details from the database or any other data source
                    string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Prepare the SQL query to fetch the details based on the title
                        string query = "SELECT [DESCRIPTIONS], [CATEGORY], [U_NAME], [TARGETDONATION], [DEADLINE], [URGENCY], [MEDIAFILEPATH] FROM [REQUESTSUBMISSION] WHERE [TITLE] = @Title";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@Title", title);

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    // Fetch the details from the reader
                                    description = reader["DESCRIPTIONS"].ToString();
                                    category = reader["CATEGORY"].ToString();
                                    name = reader["U_NAME"].ToString();
                                    targetDonation = reader["TARGETDONATION"].ToString();
                                    deadline = reader["DEADLINE"].ToString();
                                    urgency = reader["URGENCY"].ToString();

                                    // Set the details in the corresponding labels
                                    TitleLabel.Text = title;
                                    DescriptionLabel.Text = description;
                                    CategoryLabel.Text = category;
                                    NameLabel.Text = name;
                                    TargetDonationLabel.Text = targetDonation;
                                    DeadlineLabel.Text = deadline;
                                    UrgencyLabel.Text = urgency;

                                    // Fetch the image data from the reader
                                    object imageDataObj = reader["MEDIAFILEPATH"];
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
                        }
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
            string title = Server.UrlDecode(Request.QueryString["title"]);  // Assuming TitleLabel is the label displaying the title value

            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Search for the record in REQUESTSUBMISSION table based on the title
                string selectQuery = "SELECT * FROM REQUESTSUBMISSION WHERE TITLE = @Title";
                SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                selectCommand.Parameters.AddWithValue("@Title", title);
                SqlDataReader reader = selectCommand.ExecuteReader();

                if (reader.Read())
                {
                    // Get the column values from the reader
                    string description = reader["DESCRIPTIONS"].ToString();
                    string category = reader["CATEGORY"].ToString();
                    string uName = reader["U_NAME"].ToString();
                    string cID = reader["C_ID"].ToString();
                    decimal targetDonation = Convert.ToDecimal(reader["TARGETDONATION"]);
                    DateTime deadline = Convert.ToDateTime(reader["DEADLINE"]);
                    bool urgency = Convert.ToBoolean(reader["URGENCY"]);

                    // Insert the record into the help table
                    string insertQuery = "INSERT INTO help (TITLE, DESCRIPTIONS, CATEGORY, U_NAME, C_ID, TARGETDONATION, DEADLINE, URGENCY) " +
                                         "VALUES (@Title, @Descriptions, @Category, @UName, @CID, @TargetDonation, @Deadline, @Urgency)";
                    SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
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

                reader.Close();
            }
        }



        protected void RefuseButton_Click(object sender, EventArgs e)
        {
            // Handle the Refuse button click event
            // Perform the refusal logic here
        }
    }
}
