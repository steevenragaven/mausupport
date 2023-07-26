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
    public partial class regPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resetBtn_Click(object sender, EventArgs e)
        {
            string mail = txtmail.Text;
            var strcon = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            var sql1 = "UPDATE dbo.USER_CREDENTIAL SET PWD=@password WHERE EMAIL=@MAIL";
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT EMAIL FROM dbo.USERS WHERE EMAIL=@MAIL", connection);
                cmd.Parameters.AddWithValue("@MAIL", mail);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    using (var cmd1 = new SqlCommand(sql1, connection))
                    {
                        cmd1.Parameters.AddWithValue("@password", txtpassword.Text.Trim());
                    }
                    Response.Redirect("log.aspx");
                }
                else
                {
                    lblError.Text = "Invalid Email, please try again";
                }
                connection.Close();
            }
        }
    }
}