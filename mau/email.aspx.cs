using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mau
{
    public partial class email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void confirmbtn_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string mail = txtEmail.Text;
            string pwd = txtpwd.Text;

            var strcon = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT * FROM dbo.USER_CREDENTIAL WHERE USERNAME = @username AND ISACTIVE='True' AND EMAIL = @mail AND DONOR='TRUE' AND PWD = @pwd", connection);

                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@mail", mail);
                command.Parameters.AddWithValue("@pwd", pwd);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    sendemail();
                    Response.Redirect("~/payment_success.aspx");
                }
                else
                {
                    lblmsg.Text = "Invalid entry detected";
                }
            }
        }
        private void sendemail()
        {
            SmtpSection smtpSection =
            (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "Donation Successful";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + txtUsername.Text + ", your donation was                  successful, thank you for helping the needy.");
                    //msgBody.Append(txtbody.Text.Trim());
                    msgBody.Append("<a href='https://" +
                    HttpContext.Current.Request.Url.Authority + "/uc/login.aspx'>Click here to login to MauSupport</ a > ");
                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new
                    NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);
                    Response.Write("Email Sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}