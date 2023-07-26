using mau;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rvdob.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
                rvdob.MinimumValue = DateTime.Now.AddYears(-45).ToShortDateString();
                rvdob.Type = ValidationDataType.Date;

            }

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            var strcon = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (var connection = new SqlConnection(strcon))
            {
                connection.Open();

                var sql1 = "INSERT INTO dbo.USERS(C_FIRST, C_LAST, NIC, PHONENUMBER, DOB, EMAIL, ISACTIVE, CLIENT, DONOR)VALUES(@firstname, @lastname, @nic, @phone, @dob, @mail, @ISACTIVE, @CLIENT, @DONOR)";
                var sql2 = "INSERT INTO dbo.USER_CREDENTIAL(USERNAME, PWD, ISACTIVE, CLIENT, DONOR, EMAIL)VALUES(@username, @Password, @ISACTIVE, @CLIENT, @DONOR, @mail)";

                using (var cmd = new SqlCommand(sql1, connection))
                {
                    cmd.Parameters.AddWithValue("@firstname", txtfname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lastname", txtlname.Text.Trim());
                    cmd.Parameters.AddWithValue("@nic", txtNIC.Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", txtdob.Text.Trim());
                    cmd.Parameters.AddWithValue("@mail", txtmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@ISACTIVE", 1);
                    cmd.Parameters.AddWithValue("@CLIENT", 0);  // Default value
                    cmd.Parameters.AddWithValue("@DONOR", 0);   // Default value
                    if (Client.Checked)
                    {
                        cmd.Parameters["@CLIENT"].Value = 1;
                    }
                    else
                    {
                        cmd.Parameters["@DONOR"].Value = 1;
                    }
                    cmd.ExecuteNonQuery();

                }
                using (var cmd1 = new SqlCommand(sql2, connection))
                {
                    cmd1.Parameters.AddWithValue("@username", txtusername.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());
                    cmd1.Parameters.AddWithValue("@mail", txtmail.Text.Trim());
                    cmd1.Parameters.AddWithValue("@ISACTIVE", 1);
                    cmd1.Parameters.AddWithValue("@CLIENT", 0);  // Default value
                    cmd1.Parameters.AddWithValue("@DONOR", 0);   // Default value
                    if (Client.Checked)
                    {
                        cmd1.Parameters["@CLIENT"].Value = 1;

                    }
                    else 
                    {
                        cmd1.Parameters["@DONOR"].Value = 1;
                    }
                    cmd1.ExecuteNonQuery();
                }
                connection.Close();
            }
            Response.Redirect("logInaspx.aspx");
        }
    }
}