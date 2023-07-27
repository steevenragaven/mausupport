using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace mau
{
    public partial class Notications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch notifications from the database
                List<string> notifications = GetNotificationsFromDatabase();

                // Find the Literal control and bind the data
                Literal notificationsList = FindControlRecursive(Page, "notificationsList") as Literal;
                if (notificationsList != null)
                {
                    notificationsList.Text = string.Join("<br />", notifications);
                }
            }
        }

        // Method to get all notifications from the database
        private List<string> GetNotificationsFromDatabase()
        {
            List<string> notifications = new List<string>();

            string connectionString = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Prepare the SQL query to fetch all notifications from the [Notifications] table
                string query = "SELECT [Name], [title], [targetdonation] FROM [Notifications]";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Build the notification message from the retrieved data
                            string name = reader["Name"].ToString();
                            string title = reader["title"].ToString();
                            decimal targetDonation = Convert.ToDecimal(reader["targetdonation"]);

                            string notification = $"{name} your request: {title} of Target Donation: {targetDonation} has been approved";
                            notifications.Add(notification);
                        }
                    }
                }
            }

            return notifications;
        }

        // Helper method to recursively find a control within the page hierarchy
        private Control FindControlRecursive(Control root, string id)
        {
            if (root.ID == id)
            {
                return root;
            }

            foreach (Control control in root.Controls)
            {
                Control foundControl = FindControlRecursive(control, id);
                if (foundControl != null)
                {
                    return foundControl;
                }
            }

            return null;
        }
    }
}
