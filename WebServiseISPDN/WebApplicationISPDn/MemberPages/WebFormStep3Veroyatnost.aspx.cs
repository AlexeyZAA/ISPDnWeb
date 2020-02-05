using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplicationISPDn.MemberPages
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void SqlDataSourceVidUgrozOpasn_Load(object sender, EventArgs e)
        {
            //string ispdnTip = DetailsViewISPDn.Rows[8].Cells[1].Text;
            //if (ispdnTip == "1")
            //{
            //    SqlDataSourceVidUgrozOpasn.SelectCommand = "SELECT NazvanieUgrozID, NazvanieUgrozName, VidUgrozID, [1], [2], [3], [4], upsize_ts FROM NazvanieUgroz WHERE (VidUgrozID = 1) OR (VidUgrozID = 2) OR (VidUgrozID = 3)";
            //}
            //    GridViewOpasnost.DataBind();
        }
        
        int urver; // переменная индекса вероятности в базе для вставки в связную таблицу
        int indexReal; // переменная индекса реализации
        protected void ButtonVeroyatnost_Click(object sender, EventArgs e)
        {

            string IshodZach;
            IshodZach = DetailsViewISPDn.Rows[6].Cells[1].Text; // переменная Айди исходной защищенности текущей ИС Y1 
            string IspdnID = DetailsViewISPDn.Rows[0].Cells[1].Text;
            
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sdsDelMnogieVer = new SqlDataSource();
            SqlDataSource sdsDelMnogieReal = new SqlDataSource();
            sdsDelMnogieVer.ConnectionString = conn;
            sdsDelMnogieReal.ConnectionString = conn;

            sdsDelMnogieVer.DeleteCommand = "DELETE FROM MnogieVerUgrozIS WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sdsDelMnogieReal.DeleteCommand = "DELETE FROM MnogieRealizUgroz WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sdsDelMnogieVer.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
            sdsDelMnogieReal.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
            sdsDelMnogieVer.Delete();
            sdsDelMnogieReal.Delete();

            sdsDelMnogieVer.InsertCommand = "INSERT INTO MnogieVerUgrozIS (NazvanieUgrozID, ISPDnOperatorID, VeroyatnostUgrozID) VALUES (@ParamUgrozaID,@ParamISPDnID,@ParamVeroyatnID)";
            sdsDelMnogieReal.InsertCommand = "INSERT INTO MnogieRealizUgroz (RealizationUgrozID, ISPDnOperatorID, NazvanieUgrozID, KofRealization) VALUES (@ParamRealUgrozID,@ParamISPDnID,@ParamNameUgrozID,@ParamKofReal)";
            sdsDelMnogieVer.InsertParameters.Add(new Parameter("ParamUgrozaID", TypeCode.Int32));
            sdsDelMnogieVer.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32));
            sdsDelMnogieVer.InsertParameters.Add(new Parameter("ParamVeroyatnID", TypeCode.Int32));

            sdsDelMnogieReal.InsertParameters.Add(new Parameter("ParamRealUgrozID", TypeCode.Int32));
            sdsDelMnogieReal.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32));
            sdsDelMnogieReal.InsertParameters.Add(new Parameter("ParamNameUgrozID", TypeCode.Int32));
            sdsDelMnogieReal.InsertParameters.Add(new Parameter("ParamKofReal", TypeCode.Double));



            double realiz; // переменная кооф реализации угрозы Y
            int IshZah = Convert.ToInt32(IshodZach);

            for (int i = 0; i < GridViewVeroyatnost.Rows.Count - 1; i++)
            {

                RadioButton radioVer1 = (RadioButton)GridViewVeroyatnost.Rows[i].FindControl("RadioButton1");
                RadioButton radioVer2 = (RadioButton)GridViewVeroyatnost.Rows[i].FindControl("RadioButton2");
                RadioButton radioVer3 = (RadioButton)GridViewVeroyatnost.Rows[i].FindControl("RadioButton3");
                RadioButton radioVer4 = (RadioButton)GridViewVeroyatnost.Rows[i].FindControl("RadioButton4");

                // если первая радио кнопка отмечена то маловероятная угроза
                    if (radioVer1.Checked == true)
                    {
                        int Y1;
                        Y1 = 0; // var исходной защищенности
                        urver = 1;
                        indexReal = 0;
                        realiz = 0;


                        if (IshZah == 1)
                        {
                            Y1 = 0;
                        }
                        else if (IshZah == 2)
                        {
                            Y1 = 5;
                        }
                        else if (IshZah == 3)
                        {
                            Y1 = 10;
                        }
                        realiz = (Y1 + 0.0) / 20; // расчет кооф реализуемости угрозы
                        if ((0 <= realiz) && (realiz <= 0.3))
                        {
                            indexReal = 1;
                        }
                        else if ((0.3 <= realiz) && (realiz <= 0.6))
                        {
                            indexReal = 2;
                        }
                        else if ((0.6 <= realiz) && (realiz <= 0.8))
                        {
                            indexReal = 3;
                        }
                        else if (realiz <= 0.0)
                        {
                            indexReal = 4;
                        }
                        // вставляем вероятность
                        sdsDelMnogieVer.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieVer.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieVer.InsertParameters["ParamVeroyatnID"].DefaultValue = urver.ToString();
                        sdsDelMnogieVer.Insert();
                        //вставляем возможность реализации
                        sdsDelMnogieReal.InsertParameters["ParamRealUgrozID"].DefaultValue = indexReal.ToString();
                        sdsDelMnogieReal.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieReal.InsertParameters["ParamNameUgrozID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieReal.InsertParameters["ParamKofReal"].DefaultValue = realiz.ToString(); // добовляем возможность реализации 
                        sdsDelMnogieReal.Insert();
                    }
                    else if (radioVer2.Checked == true)
                    {
                        int Y1;
                        Y1 = 0;
                        urver = 2;
                        indexReal = 0;
                        // Y2 = 2
                        if (IshZah == 1)
                        {
                            Y1 = 0;
                        }
                        else if (IshZah == 2)
                        {
                            Y1 = 5;
                        }
                        else if (IshZah == 3)
                        {
                            Y1 = 10;
                        }
                        realiz = (Y1 + 2.0) / 20; // расчет показателя возможномти реализации угроз

                        if ((0 <= realiz) && (realiz <= 0.3))
                        {
                            indexReal = 1;
                        }
                        else if ((0.3 <= realiz) && (realiz <= 0.6))
                        {
                            indexReal = 2;
                        }
                        else if ((0.6 <= realiz) && (realiz <= 0.8))
                        {
                            indexReal = 3;
                        }
                        else if (realiz <= 0.0)
                        {
                            indexReal = 4;
                        }

                        // вставляем вероятность
                        sdsDelMnogieVer.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieVer.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieVer.InsertParameters["ParamVeroyatnID"].DefaultValue = urver.ToString();
                        sdsDelMnogieVer.Insert();
                        //вставляем возможность реализации
                        sdsDelMnogieReal.InsertParameters["ParamRealUgrozID"].DefaultValue = indexReal.ToString();
                        sdsDelMnogieReal.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieReal.InsertParameters["ParamNameUgrozID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieReal.InsertParameters["ParamKofReal"].DefaultValue = realiz.ToString(); // добовляем возможность реализации 
                        sdsDelMnogieReal.Insert();
                    }
                    else if (radioVer3.Checked == true)
                    {
                        int Y1;
                        Y1 = 0;
                        urver = 3;
                        indexReal = 0;
                        // Y2 = 5
                        if (IshZah == 1)
                        {
                            Y1 = 0;
                        }
                        else if (IshZah == 2)
                        {
                            Y1 = 5;
                        }
                        else if (IshZah == 3)
                        {
                            Y1 = 10;
                        }
                        realiz = (Y1 + 5.0) / 20; // расчет показателя возможномти реализации угроз

                        if ((0 <= realiz) && (realiz <= 0.3))
                        {
                            indexReal = 1;
                        }
                        else if ((0.3 <= realiz) && (realiz <= 0.6))
                        {
                            indexReal = 2;
                        }
                        else if ((0.6 <= realiz) && (realiz <= 0.8))
                        {
                            indexReal = 3;
                        }
                        else if (realiz <= 0.0)
                        {
                            indexReal = 4;
                        }

                        // вставляем вероятность
                        sdsDelMnogieVer.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieVer.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieVer.InsertParameters["ParamVeroyatnID"].DefaultValue = urver.ToString();
                        sdsDelMnogieVer.Insert();
                        //вставляем возможность реализации
                        sdsDelMnogieReal.InsertParameters["ParamRealUgrozID"].DefaultValue = indexReal.ToString();
                        sdsDelMnogieReal.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieReal.InsertParameters["ParamNameUgrozID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieReal.InsertParameters["ParamKofReal"].DefaultValue = realiz.ToString(); // добовляем возможность реализации 
                        sdsDelMnogieReal.Insert();
                    }
                    else if (radioVer4.Checked == true)
                    {
                        int Y1;
                        Y1 = 0;
                        urver = 4;
                        //indexReal = 0;
                        // Y2 = 10
                        if (IshZah == 1)
                        {
                            Y1 = 0;
                        }
                        else if (IshZah == 2)
                        {
                            Y1 = 5;
                        }
                        else if (IshZah == 3)
                        {
                            Y1 = 10;
                        }

                        realiz = (Y1 + 10.0) / 20; // расчет показателя возможномти реализации угроз

                        if ((0 <= realiz) && (realiz <= 0.3))
                        {
                            indexReal = 1;
                        }
                        else if ((0.3 <= realiz) && (realiz <= 0.6))
                        {
                            indexReal = 2;
                        }
                        else if ((0.6 <= realiz) && (realiz <= 0.8))
                        {
                            indexReal = 3;
                        }
                        else if (realiz <= 0.0)
                        {
                            indexReal = 4;
                        }

                        // вставляем вероятность
                        sdsDelMnogieVer.InsertParameters["ParamUgrozaID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieVer.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieVer.InsertParameters["ParamVeroyatnID"].DefaultValue = urver.ToString();
                        sdsDelMnogieVer.Insert();
                        //вставляем возможность реализации
                        sdsDelMnogieReal.InsertParameters["ParamRealUgrozID"].DefaultValue = indexReal.ToString();
                        sdsDelMnogieReal.InsertParameters["ParamISPDnID"].DefaultValue = IspdnID;
                        sdsDelMnogieReal.InsertParameters["ParamNameUgrozID"].DefaultValue = (i + 1).ToString();
                        sdsDelMnogieReal.InsertParameters["ParamKofReal"].DefaultValue = realiz.ToString(); // добовляем возможность реализации 
                        sdsDelMnogieReal.Insert();
                    }
                }
            sdsDelMnogieVer.Dispose();
            sdsDelMnogieReal.Dispose();
            }
        }
}
