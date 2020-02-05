using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace WebApplicationISPDn.MemberPages
{
    public partial class WebFormActualnost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string IsIS; // ИД ИСПДн
        int real = 0; // индекс реализации угрозы
        int opasn = 0; // индекс опасности угроды
        
        //кнопка расчета актуальности
        protected void ButtonActualUgroz_Click(object sender, EventArgs e)
        {
            IsIS = DetailsViewISPDnActual.Rows[0].Cells[1].Text;  // текущее айди ИСПДн
            // создали источник данных для удаления из связной таблицы актуальных угроз
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sdsActual = new SqlDataSource();
            sdsActual.ConnectionString = conn;
            sdsActual.DeleteCommand = "DELETE FROM MnogieUgrozaActual WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sdsActual.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, IsIS));
            sdsActual.Delete();
            sdsActual.Dispose();

            // далее расчитываем актуальность и добавляем в связные таблицы

            // после того как нашли ИД информационной системы, ищем ИД Угрозы и ее характеристики
            //*********************************************************************************************

            //*** создаем 3 таблицы для расчетов

            SqlConnection Connection = new SqlConnection(conn);
            SqlDataAdapter adapterUgroza = new SqlDataAdapter("SELECT NazvanieUgrozID, NazvanieUgrozName, VidUgrozID FROM NazvanieUgroz", Connection);
            SqlDataAdapter adapterMnogOpasn = new SqlDataAdapter("SELECT NazvanieUgrozID, ISPDnOperatorID, OpasnostUgrozID FROM MnogieOpasnUgrozIS", Connection);
            SqlDataAdapter adapterMnogRealiz = new SqlDataAdapter("SELECT RealizationUgrozID, ISPDnOperatorID, NazvanieUgrozID, KofRealization FROM MnogieRealizUgroz", Connection);
            DataTable datatableUgroza = new DataTable();
            DataTable datatableMnogOpasn = new DataTable();
            DataTable datatableMnogRealiz = new DataTable();

            adapterUgroza.Fill(datatableUgroza);
            adapterMnogOpasn.Fill(datatableMnogOpasn);
            adapterMnogRealiz.Fill(datatableMnogRealiz);
            Connection.Close();

            // создаем вставку записей
            SqlDataSource sdsMnogieActual = new SqlDataSource();
            sdsMnogieActual.ConnectionString = conn;
            sdsMnogieActual.InsertCommand = "INSERT INTO MnogieUgrozaActual(NazvanieUgrozID, ISPDnOperatorID, ActualnostID) VALUES (@ParamUgrozaID, @ParamISPDnID, @ParamActualID)";
            sdsMnogieActual.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, IsIS));
            sdsMnogieActual.InsertParameters.Add(new Parameter("ParamUgrozaID", TypeCode.Int32));
            sdsMnogieActual.InsertParameters.Add(new Parameter("ParamActualID", TypeCode.Int32));
            

            // Циклом проходим по всем угрозам и ловим айдишники

            foreach (DataRow dataRowUgroz in datatableUgroza.Rows)
            {
                string Ugroz = dataRowUgroz["NazvanieUgrozID"].ToString(); // айди угрозы из таблицы угроз

                // ловим возможность опасности для текущей угрозы
                foreach (DataRow dataRowOpasn in datatableMnogOpasn.Rows)
                {
                    string IdISo = dataRowOpasn["ISPDnOperatorID"].ToString(); // айди ИСПДн в Базе
                    string IdUgrozo = dataRowOpasn["NazvanieUgrozID"].ToString();
                    string IdOpasn = dataRowOpasn["OpasnostUgrozID"].ToString();
                    int convIdOpasn = Convert.ToInt32(IdOpasn);
                    if ((IsIS == IdISo) && (IdUgrozo == Ugroz)) // Если  айди ИСПДн в базее равно текущей айди ИСПДн, и Айди угрозы в базе = Айди угрозы в таблице
                    {
                        opasn = convIdOpasn;
                    }
                }

                // ловим возможность реализации для текущей угрозы
                foreach (DataRow dataRow in datatableMnogRealiz.Rows)
                {
                    string IdIS = dataRow["ISPDnOperatorID"].ToString();
                    string IdUgroz = dataRow["NazvanieUgrozID"].ToString();
                    string IdReal = dataRow["RealizationUgrozID"].ToString();
                    int convertIdReal = Convert.ToInt32(IdReal);
                    if ((IsIS == IdIS) && (IdUgroz == Ugroz))  // Если  айди ИСПДн в базее равно текущей айди ИСПДн, и Айди угрозы в базе = Айди угрозы в таблице
                    {
                        real = convertIdReal;
                    }
                }

                /* нашли параметры возможности реализации и параметр опасности
    теперь определяем актуальность и добовляем в таблицу актуальности */
                int mnogieActual = 0;
                string actual = real.ToString() + opasn.ToString();
                switch (actual)
                {
                    case "11": mnogieActual = 2;
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "12": mnogieActual = 2; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "13": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "21": mnogieActual = 2; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "22": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "23": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "31": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "32": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "33": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "41": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "42": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    case "43": mnogieActual = 1; 
                        sdsMnogieActual.InsertParameters["ParamUgrozaID"].DefaultValue = Ugroz;
                        sdsMnogieActual.InsertParameters["ParamActualID"].DefaultValue = mnogieActual.ToString();
                        sdsMnogieActual.Insert();
                        break;
                    default: GridViewActualnostUgroz.EmptyDataText = "Не определена актуальность некоторых угроз"; ;
                        break;
                }

            
                //*** завершение цикла угроз
            }

            SqlDataSourceActualUgroza.SelectParameters["ParamISPDnID"].DefaultValue = IsIS;
            SqlDataSourceActualUgroza.SelectParameters["ParamActual"].DefaultValue = "1";
            GridViewActualnostUgroz.DataBind();

                
            
            }

                //this.nazvanieUgrozTableAdapter.FillsysID(iSPDnBDDataSet.NazvanieUgroz, 1, IsIS);
            }
    }