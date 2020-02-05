using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplicationISPDn.MemberPages
{
    public partial class WebFormOpasnost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonOpasnost_Click(object sender, EventArgs e)
        {
            // ID ИСПДн
            string IspdnID = DetailsViewISPDnOpasn.Rows[0].Cells[1].Text;

            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sdsDelMnogieOpasn = new SqlDataSource();
            sdsDelMnogieOpasn.ConnectionString = conn;
            sdsDelMnogieOpasn.DeleteCommand = "DELETE FROM MnogieOpasnUgrozIS WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sdsDelMnogieOpasn.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, IspdnID));
            sdsDelMnogieOpasn.Delete();

            sdsDelMnogieOpasn.InsertCommand = "INSERT INTO MnogieOpasnUgrozIS (NazvanieUgrozID, ISPDnOperatorID, OpasnostUgrozID) VALUES (@ParamUgrozaID,@ParamISPDnID,@ParamOpasnID)";
            sdsDelMnogieOpasn.InsertParameters.Add(new Parameter("ParamUgrozaID", TypeCode.Int32));
            sdsDelMnogieOpasn.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32));
            sdsDelMnogieOpasn.InsertParameters.Add(new Parameter("ParamOpasnID", TypeCode.Int32));
            
            // незабыть диспозе для дата сорсе
            int ugroza;
            //ugroza = 0;

            for (int i = 0; i < GridViewUgrozaOpasn.Rows.Count - 1; i++)
            {

                RadioButton radioVer1 = (RadioButton)GridViewUgrozaOpasn.Rows[i].FindControl("RadioButton1");
                RadioButton radioVer2 = (RadioButton)GridViewUgrozaOpasn.Rows[i].FindControl("RadioButton2");
                RadioButton radioVer3 = (RadioButton)GridViewUgrozaOpasn.Rows[i].FindControl("RadioButton3");

                // если первая радио кнопка отмечена то маловероятная угроза
                if (radioVer1.Checked == true)
                {
                    ugroza = 1;
                    sdsDelMnogieOpasn.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                    sdsDelMnogieOpasn.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                    sdsDelMnogieOpasn.InsertParameters["ParamOpasnID"].DefaultValue = ugroza.ToString();
                    sdsDelMnogieOpasn.Insert();

                }
                else if (radioVer2.Checked == true)
                {
                    ugroza = 2;
                    sdsDelMnogieOpasn.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                    sdsDelMnogieOpasn.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                    sdsDelMnogieOpasn.InsertParameters["ParamOpasnID"].DefaultValue = ugroza.ToString();
                    sdsDelMnogieOpasn.Insert();
                }
                else if (radioVer3.Checked == true)
                {
                    ugroza = 3;
                    sdsDelMnogieOpasn.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                    sdsDelMnogieOpasn.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                    sdsDelMnogieOpasn.InsertParameters["ParamOpasnID"].DefaultValue = ugroza.ToString();
                    sdsDelMnogieOpasn.Insert();
                }
            }
            sdsDelMnogieOpasn.Dispose();
        }
    }
}
