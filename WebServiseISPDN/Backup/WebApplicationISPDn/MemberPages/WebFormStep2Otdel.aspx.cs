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
    public partial class WebFormStep2Otdel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Загрузка и отображение данных по отделу
        protected void DetailsViewOtdel_Load(object sender, EventArgs e)
        {
            SqlDataSourceOtdel.SelectParameters["ParamOrgID"].DefaultValue = Context.Session["OrganizationID"].ToString();
            SqlDataSourceOtdel.InsertParameters["OrgOperatorID"].DefaultValue = Context.Session["OrganizationID"].ToString();
            // если записей нет то откроется шаблон вставки
            if (DetailsViewOtdel.Rows.Count == 0)
            {
                DetailsViewOtdel.ChangeMode(DetailsViewMode.Insert);
                PanelSubjYesNoOtdel.Visible = false;
                PanelPDNoYesOtdel.Visible = false;
            }
            else
            {
                PanelSubjYesNoOtdel.Visible = true;
                PanelPDNoYesOtdel.Visible = true;
            }
        }
        // передача параметра Селект в источник субъектов для Грид вью
        protected void SqlDataSourceSubjOtdel_Load(object sender, EventArgs e)
        {
            if (DetailsViewOtdel.Rows.Count != 0)
            {
                SqlDataSourceSubjOtdel.SelectParameters["ParamOtdelID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            }
        }
        // кнопка скрытия списка всех субъектов
        protected void ButtonSubjAllOtdel_Click(object sender, EventArgs e)
        {
            if (ListViewSubjOtdelAll.Visible == false)
            {
                ListViewSubjOtdelAll.Visible = true;
            }
            else
            {
                ListViewSubjOtdelAll.Visible = false;
            }
        }
        // кнопка добавления выбранных субъектов в отдел
        protected void ButtonSubjAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieSubjOtdel.DeleteParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieSubjOtdel.Delete();
            for (int i = 0; i < ListViewSubjOtdelAll.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewSubjOtdelAll.Items[i];
                CheckBox w = (CheckBox)item.FindControl("KategorySubjSelectCheckBox");

                if (w.Checked == true)
                {
                    Label LabsubjID = (Label)item.FindControl("KategorySubjIDLabel");
                    if ((DetailsViewOtdel.Rows[0].Cells[1].Text != "") && (LabsubjID.Text != ""))
                    {
                        SqlDataSourceMnogieSubjOtdel.InsertParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
                        SqlDataSourceMnogieSubjOtdel.InsertParameters["KategorySubjID"].DefaultValue = LabsubjID.Text;

                        SqlDataSourceMnogieSubjOtdel.Insert();
                    }
                }
                GridViewSubjOtdel.DataBind();
            }
        }
        // скрытие панели всех персональных данных
        protected void ButtonPDOtdelAll_Click(object sender, EventArgs e)
        {
            if (PanelOtdel.Visible == false)
            {
                PanelOtdel.Visible = true;
            }
            else
            {
                PanelOtdel.Visible = false;
            }
        }
        // Кнопка добавления отмеченных ПД
        protected void ButtonChekOtdelPD_Click(object sender, EventArgs e)
        {
            //*** Методы добавления основных персональных данных в связную таблицу МногиеИСПДнПД
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = conn;
            sds.DeleteCommand = "DELETE FROM MnogieKategoryPdOtdel WHERE (OtdelOrgID = @ParamOtdelID)";
            sds.DeleteParameters.Add(new Parameter("ParamOtdelID", TypeCode.Int32, DetailsViewOtdel.Rows[0].Cells[1].Text));
            sds.Delete();
            sds.InsertCommand = "INSERT INTO MnogieKategoryPdOtdel(OtdelOrgID, KategoryPdID) VALUES (@ParamOtdelID, @ParamPdID)";
            sds.InsertParameters.Add(new Parameter("ParamOtdelID", TypeCode.Int32));
            sds.InsertParameters.Add(new Parameter("ParamPdID", TypeCode.Int32));

            for (int i = 0; i < CheckBoxListOtdelOsnova.Items.Count; i++)
            {
                if (CheckBoxListOtdelOsnova.Items[i].Selected == true)
                {
                    sds.InsertParameters["ParamOtdelID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
                    sds.InsertParameters["ParamPdID"].DefaultValue = (i + 1).ToString();
                    sds.Insert();
                }
            }
            sds.Dispose();

            //*** Методы добавления специальных персональных данных в связную таблицу МногиеИСПДнСпецПД
            SqlDataSource sdsspecPD = new SqlDataSource();
            sdsspecPD.ConnectionString = conn;
            sdsspecPD.DeleteCommand = "DELETE FROM MnogieKategoriSpecOtdel WHERE (OtdelOrgID = @ParamOtdelID)";
            sdsspecPD.DeleteParameters.Add(new Parameter("ParamOtdelID", TypeCode.Int32, DetailsViewOtdel.Rows[0].Cells[1].Text));
            sdsspecPD.Delete();

            sdsspecPD.InsertCommand = "INSERT INTO MnogieKategoriSpecOtdel(OtdelOrgID, KategoryPdSpecID) VALUES (@ParamOtdelID, @ParamPdID)";
            sdsspecPD.InsertParameters.Add(new Parameter("ParamOtdelID", TypeCode.Int32));
            sdsspecPD.InsertParameters.Add(new Parameter("ParamPdID", TypeCode.Int32));


            for (int i = 0; i < CheckBoxListOtdelSpecPD.Items.Count; i++)
            {
                if (CheckBoxListOtdelSpecPD.Items[i].Selected == true)
                {
                    sdsspecPD.InsertParameters["ParamOtdelID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
                    sdsspecPD.InsertParameters["ParamPdID"].DefaultValue = (i + 1).ToString();
                    sdsspecPD.Insert();
                }
            }
            sdsspecPD.Dispose();
        }
        // Кнопка отмечающая чекбоксы ПД
        protected void ButtonOtdelPDcheckVid_Click(object sender, EventArgs e)
        {
            // делаем выборку добавленных ПД и отмечаем чекбоксами Основных ПД из связной таблицы МногиеОсновнКатегории
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection Connection = new SqlConnection(conn);
            // запрос для основных категорий
            SqlDataAdapter adapterMnogiePD = new SqlDataAdapter("SELECT OtdelOrgID, KategoryPdID FROM MnogieKategoryPdOtdel", Connection);
            // запрос для специальных категорий
            SqlDataAdapter adapterMnogiePDSpec = new SqlDataAdapter("SELECT MnogieKategoriSpecOtdel.* FROM MnogieKategoriSpecOtdel", Connection);

            // таблицы для основных и специальных категорий
            DataTable datatableMnogiePD = new DataTable();
            DataTable datatableMnogiePDSpec = new DataTable();

            adapterMnogiePD.Fill(datatableMnogiePD);
            adapterMnogiePDSpec.Fill(datatableMnogiePDSpec);

            int tblMnogiePDcount = datatableMnogiePD.Rows.Count;
            int tblMnogiePDSpeccount = datatableMnogiePDSpec.Rows.Count;

            Connection.Close();

            // **** отмечаем существующие ПД основные ********
            CheckBoxListOtdelOsnova.ClearSelection();
            for (int i = 0; i <= CheckBoxListOtdelOsnova.Items.Count; i++)
            {
                for (int j = 0; j < tblMnogiePDcount; j++)
                {
                    string valueISPDn = datatableMnogiePD.Rows[j][0].ToString();
                    string valuePd = datatableMnogiePD.Rows[j][1].ToString();

                    if ((valueISPDn == DetailsViewOtdel.Rows[0].Cells[1].Text) && (valuePd == i.ToString()))//CheckBoxListOsnova.Items[j].Value.ToString())) //  
                    {
                        CheckBoxListOtdelOsnova.Items[i - 1].Selected = true;
                    }
                }

            }
            datatableMnogiePD.Dispose();

            // **** отмечаем существующие ПД специальные ********
            CheckBoxListOtdelSpecPD.ClearSelection();
            for (int i = 0; i <= CheckBoxListOtdelSpecPD.Items.Count; i++)
            {
                for (int j = 0; j < tblMnogiePDSpeccount; j++)
                {
                    string valueISPDn = datatableMnogiePDSpec.Rows[j][0].ToString();
                    string valuePd = datatableMnogiePDSpec.Rows[j][1].ToString();

                    if ((valueISPDn == DetailsViewOtdel.Rows[0].Cells[1].Text) && (valuePd == i.ToString()))
                    {
                        CheckBoxListOtdelSpecPD.Items[i - 1].Selected = true;
                    }
                }

            }
            datatableMnogiePDSpec.Dispose();
            
        }
        // показать скрыть панель био данных
        protected void ButtonOtdelPDBioView_Click(object sender, EventArgs e)
        {
            if (PanelOtdelBioPD.Visible == false)
            {
                PanelOtdelBioPD.Visible = true;
            }
            else
            {
                PanelOtdelBioPD.Visible = false;
            }
        }
        // кнопка добавления Био данных из всего списка
        protected void ButtonOtdelBioPDAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieBioOtdelPD.DeleteParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieBioOtdelPD.Delete();
            for (int i = 0; i < ListViewOtdelBioPD.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewOtdelBioPD.Items[i];
                CheckBox w = (CheckBox)item.FindControl("KategoryPdBioSelectCheckBox");
                if (w.Checked == true)
                {
                    Label LabPdBioID = (Label)item.FindControl("KategoryPdBioIDLabel");
                    SqlDataSourceMnogieBioOtdelPD.InsertParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieBioOtdelPD.InsertParameters["KategoryPdBioID"].DefaultValue = LabPdBioID.Text;
                    SqlDataSourceMnogieBioOtdelPD.Insert();
                }
            }
            GridViewOtdelBioPD.DataBind();
        }
        // передача параметра Селект биометрических категорий при закрузке источника данных
        protected void SqlDataSourceOtdelBioPD_Load(object sender, EventArgs e)
        {
            if (DetailsViewOtdel.Rows.Count == 0)
            {
                GridViewOtdelBioPD.Visible = false;
            }
            else
            {
                GridViewOtdelBioPD.Visible = true;
                SqlDataSourceOtdelBioPD.SelectParameters["ParamOtdelID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            }
        }
        // показать скрыть выбираемых работников для отдела
        protected void ButtonOtdelRabotnikiView_Click(object sender, EventArgs e)
        {
            if (ListViewRabotnikiOtdel.Visible == false)
            {
                ListViewRabotnikiOtdel.Visible = true;
            }
            else
            {
                ListViewRabotnikiOtdel.Visible = false;
            }
        }
        // передача параметра для селекта работников имеющих доступ к ПД в данном отделе
        protected void SqlDataSourceOtdelRabotniki_Load(object sender, EventArgs e)
        {
            if (DetailsViewOtdel.Rows.Count == 0)
            {
                GridViewRabotnikiOtdel.Visible = false;
            }
            else
            {
                GridViewRabotnikiOtdel.Visible = true;
                SqlDataSourceOtdelRabotniki.SelectParameters["ParamOtdelID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            }
        }
        // добавление выбранных категорий работников
        protected void ButtonOtdelRabotnikiAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieOtdelRabotniki.DeleteParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieOtdelRabotniki.Delete();
            for (int i = 0; i < ListViewRabotnikiOtdel.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewRabotnikiOtdel.Items[i];
                CheckBox w = (CheckBox)item.FindControl("RabotnikiOrgSelectCheckBox");
                if (w.Checked == true)
                {
                    Label LabRabotnikiID = (Label)item.FindControl("RabotnikiOrgIDLabel");
                    SqlDataSourceMnogieOtdelRabotniki.InsertParameters["OtdelOrgID"].DefaultValue = DetailsViewOtdel.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieOtdelRabotniki.InsertParameters["RabotnikiOrgID"].DefaultValue = LabRabotnikiID.Text;
                    SqlDataSourceMnogieOtdelRabotniki.Insert();
                }
            }
            GridViewRabotnikiOtdel.DataBind();
        }
    }
}