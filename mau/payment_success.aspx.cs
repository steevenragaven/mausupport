using System;
using System.Collections.Generic;
using System.Configuration;
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
    public partial class payment_success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sendemail();
        }

        private void sendemail()
        {
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

            // Retrieve email and username from session variables
            string userEmail = Session["UserEmail"] as string;
            string userName = Session["UserName"] as string;

            // Check if email and username are available in the session
            if (string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(userName))
            {
                Response.Write("User email or username not found in the session.");
                return;
            }

            using (MailMessage m = new MailMessage(smtpSection.From, userEmail))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "Donation Receive";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + userName + ", your receive is successful, thank you for your donation.");
                    //msgBody.Append(txtbody.Text.Trim());
                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
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