using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplicationISPDn
{
    public partial class _Default : System.Web.UI.Page
    {
 
        protected void DetailsViewOrganization_Load(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            string userIDorganization = user.ProviderUserKey.ToString();

            if (user != null)
            {
                SqlDataSourceOrganization.SelectParameters["ParamUserID"].DefaultValue = userIDorganization;
                SqlDataSourceOrganization.InsertParameters["UserID"].DefaultValue = userIDorganization;
                
                if (DetailsViewOrganization.Rows.Count == 0)
                {
                    DetailsViewOrganization.ChangeMode(DetailsViewMode.Insert);
                }
            }
            
        }

        protected void DetailsViewOrganization_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            MembershipUser userDel = Membership.GetUser();
            string userID = userDel.ProviderUserKey.ToString();
            SqlDataSourceOrganization.DeleteParameters["original_UserID"].DefaultValue = userID;
        }

        protected void DetailsViewOrganization_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            MembershipUser userUpdate = Membership.GetUser();
            string userID = userUpdate.ProviderUserKey.ToString();
            SqlDataSourceOrganization.UpdateParameters["UserID"].DefaultValue = userID;
            SqlDataSourceOrganization.UpdateParameters["original_UserID"].DefaultValue = userID;
        }

        protected void DetailsViewOrganization_Unload(object sender, EventArgs e)
        {
            string SessionOrganizationID = this.DetailsViewOrganization.Rows[0].Cells[1].Text;
            Context.Session["OrganizationID"] = SessionOrganizationID; // передаем в сессию айдишник организации

        }

    }
}

