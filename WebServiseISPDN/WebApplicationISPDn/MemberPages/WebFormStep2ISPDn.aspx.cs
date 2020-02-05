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

namespace WebApplicationISPDn
{
    public partial class _Default : System.Web.UI.Page
    {
        // определение параметров для загрузки ИСПДн и зависящих от нее элементов страницы
        protected void DetailsViewISPDn_Load(object sender, EventArgs e)
        {

            //***********************************************
            SqlDataSourceISPDn.SelectParameters["OrgOperatorID"].DefaultValue = Context.Session["OrganizationID"].ToString();
            SqlDataSourceISPDn.InsertParameters["ISPDnKategoryID"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnObemID"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnKlassID"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnIshodZashitaID"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnTipSpecialID"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnTipModeli"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["ISPDnTipModeli"].DefaultValue = null;
            SqlDataSourceISPDn.InsertParameters["OrgOperatorID"].DefaultValue = Context.Session["OrganizationID"].ToString();
            
            // если записей нет то откроется шаблон вставки
            if (DetailsViewISPDn.Rows.Count == 0)
            {
                DetailsViewISPDn.ChangeMode(DetailsViewMode.Insert);
                PanelSubjectNoYes.Visible = false;
                PanelPDNoYes.Visible = false;
            }
            else
            {
                PanelSubjectNoYes.Visible = true;
                PanelPDNoYes.Visible = true;
            }
        }
        // кнопка показа всех субъектов
        protected void ButtonVisibleListSubjAll_Click(object sender, EventArgs e)
        {
            if (PanelHideSubj.Visible == false)
            {
                PanelHideSubj.Visible = true;
            }
            else
            {
                PanelHideSubj.Visible = false;
            }
        }
        // кнопка добавления выбранных субъектов в ИСПДн
        protected void ButtonSubjISPDnUp_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieSubjISPDn.DeleteParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieSubjISPDn.Delete();
            for (int i = 0; i < ListViewSubjAll.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewSubjAll.Items[i];
                CheckBox w = (CheckBox)item.FindControl("KategorySubjSelectCheckBox");
                
                if (w.Checked == true)
                {
                    Label LabsubjID = (Label)item.FindControl("KategorySubjIDLabel");
                    if ((DetailsViewISPDn.Rows[0].Cells[1].Text != "") && (LabsubjID.Text != ""))
                    {
                    SqlDataSourceMnogieSubjISPDn.InsertParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieSubjISPDn.InsertParameters["KategorySubjID"].DefaultValue = LabsubjID.Text;

                        SqlDataSourceMnogieSubjISPDn.Insert();
                    }
                }
                GridViewSubjISPDn.DataBind();
            }
        }
        // передача параметра Селект в источник при загрузки Субъектов ПД для данной ИСПДн
        protected void SqlDataSourceSubjISPDn_Load(object sender, EventArgs e)
        {
            if (DetailsViewISPDn.Rows.Count != 0)
            {
                SqlDataSourceSubjISPDn.SelectParameters["ParamIdISPDn"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            }
        }
        // передача параметра Селект в источник субъектов для Грид вью
        protected void SqlDataSourcePD_Load(object sender, EventArgs e)
        {
            if (DetailsViewISPDn.Rows.Count != 0)
            {
                SqlDataSourcePD.SelectParameters["ParamISPDnID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            }
        }
        // скрытие панели всех персональных данных
        protected void ButtonAllPD_Click(object sender, EventArgs e)
        {
            if (PanelISPDnPD.Visible == false)
            {
                PanelISPDnPD.Visible = true;
            }
            else
            {
                PanelISPDnPD.Visible = false;
            }
        }
        // передача параметра Селект в источник при загрузки всех Субъектов ПД
        protected void ListViewSubjAll_Load(object sender, EventArgs e)
        {
            SqlDataSourceSubjAll.InsertParameters["OrgOperatorID"].DefaultValue = Context.Session["OrganizationID"].ToString();
        }
        // всавка отмеченных персональных данных из общего дополнительного списка
        protected void ButtonPdAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieISPDnPD.DeleteParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieISPDnPD.Delete();
            for (int i = 0; i < ListViewISPDnPD.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewISPDnPD.Items[i];
                CheckBox w = (CheckBox)item.FindControl("KategoryPdDopSelectCheckBox");
                if (w.Checked == true)
                {
                    Label LabPdDopID = (Label)item.FindControl("KategoryPdDopIDLabel");
                    SqlDataSourceMnogieISPDnPD.InsertParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieISPDnPD.InsertParameters["KategoryPdDopID"].DefaultValue = LabPdDopID.Text;
                    SqlDataSourceMnogieISPDnPD.Insert();
                    GridViewISPDnPD.DataBind();
                }
            }
        }
        // пока пустой метод
        protected void CheckBoxListOsnova_Load(object sender, EventArgs e)
        {
            //string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            //SqlConnection Connection = new SqlConnection(conn);
            //SqlDataAdapter adapterMnogiePD = new SqlDataAdapter("SELECT MnogieISPDnKategoryPD.* FROM MnogieISPDnKategoryPD", Connection);
            //DataTable datatableMnogiePD = new DataTable();
            //adapterMnogiePD.Fill(datatableMnogiePD);
            //int tblMnogiePDcount = datatableMnogiePD.Rows.Count;
            //Connection.Close();
            //CheckBoxListOsnova.DataBind();

            //for (int i = 0; i < CheckBoxListOsnova.Items.Count; i++)
            //{
            //    for (int j = 0; j < tblMnogiePDcount; j++)
            //    {
            //        string valueISPDn = datatableMnogiePD.Rows[j][0].ToString();
            //        string valuePd = datatableMnogiePD.Rows[j][1].ToString();

            //        if ((valueISPDn == DetailsViewISPDn.Rows[0].Cells[1].Text) && (valuePd == i.ToString()))//CheckBoxListOsnova.Items[j].Value.ToString())) //  
            //        {
            //          CheckBoxListOsnova.Items[i-1].Selected = true;
            //        }
            //    }

            //}
            //datatableMnogiePD.Dispose();

        }
        // Кнопка добавления отмеченных ПД
        protected void ButtonChekPD_Click(object sender, EventArgs e)
        {
            //*** Методы добавления основных персональных данных в связную таблицу МногиеИСПДнПД
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = conn;
            sds.DeleteParameters.Add(new Parameter("ISPDnOperatorID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
            sds.DeleteCommand = "DELETE FROM MnogieISPDnKategoryPD WHERE (ISPDnOperatorID = @ISPDnOperatorID)";
            sds.Delete();
            sds.InsertParameters.Add(new Parameter("ISPDnOperatorID", TypeCode.Int32));
            sds.InsertParameters.Add(new Parameter("KategoryPdID", TypeCode.Int32));
            sds.InsertCommand = "INSERT INTO [MnogieISPDnKategoryPD] ([ISPDnOperatorID], [KategoryPdID]) VALUES (@ISPDnOperatorID, @KategoryPdID)";
            
            for (int i = 0; i < CheckBoxListOsnova.Items.Count; i++)
            {
                if (CheckBoxListOsnova.Items[i].Selected == true)
                {
                    sds.InsertParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    sds.InsertParameters["KategoryPdID"].DefaultValue = (i + 1).ToString();
                    sds.Insert();
                }
            }
            sds.Dispose();

            //*** Методы добавления специальных персональных данных в связную таблицу МногиеИСПДнСпецПД
            SqlDataSource sdsspecPD = new SqlDataSource();
            sdsspecPD.ConnectionString = conn;
            sdsspecPD.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
            sdsspecPD.DeleteCommand = "DELETE FROM MnogieKategoryPdSpecISPDn WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sdsspecPD.Delete();
            sdsspecPD.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32));
            sdsspecPD.InsertParameters.Add(new Parameter("ParamPDSpecID", TypeCode.Int32));
            sdsspecPD.InsertCommand = "INSERT INTO [MnogieKategoryPdSpecISPDn] ([ISPDnOperatorID], [KategoryPdSpecID]) VALUES (@ParamISPDnID,@ParamPDSpecID)";

            for (int i = 0; i < CheckBoxListSpecPD.Items.Count; i++)
            {
                if (CheckBoxListSpecPD.Items[i].Selected == true)
                {
                    sdsspecPD.InsertParameters["ParamISPDnID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    sdsspecPD.InsertParameters["ParamPDSpecID"].DefaultValue = (i + 1).ToString();
                    sdsspecPD.Insert();
                }
            }
            sdsspecPD.Dispose();
        }
        // Кнопка отмечающая чекбоксы ПД
        protected void ButtonPDcheckVid_Click(object sender, EventArgs e)
        {
            
            // делаем выборку добавленных ПД и отмечаем чекбоксами Основных ПД из связной таблицы МногиеОсновнКатегории
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection Connection = new SqlConnection(conn);
            // запрос для основных категорий
            SqlDataAdapter adapterMnogiePD = new SqlDataAdapter("SELECT MnogieISPDnKategoryPD.* FROM MnogieISPDnKategoryPD", Connection);
            // запрос для специальных категорий
            SqlDataAdapter adapterMnogiePDSpec = new SqlDataAdapter("SELECT MnogieKategoryPdSpecISPDn.* FROM MnogieKategoryPdSpecISPDn", Connection);
            
            // таблицы для основных и специальных категорий
            DataTable datatableMnogiePD = new DataTable();
            DataTable datatableMnogiePDSpec = new DataTable();
            
            adapterMnogiePD.Fill(datatableMnogiePD);
            adapterMnogiePDSpec.Fill(datatableMnogiePDSpec);

            int tblMnogiePDcount = datatableMnogiePD.Rows.Count;
            int tblMnogiePDSpeccount = datatableMnogiePDSpec.Rows.Count;
            
            Connection.Close();
            
            // **** отмечаем существующие ПД основные ********
            CheckBoxListOsnova.ClearSelection();
            for (int i = 0; i <= CheckBoxListOsnova.Items.Count; i++)
            {
                for (int j = 0; j < tblMnogiePDcount; j++)
                {
                    string valueISPDn = datatableMnogiePD.Rows[j][0].ToString();
                    string valuePd = datatableMnogiePD.Rows[j][1].ToString();

                    if ((valueISPDn == DetailsViewISPDn.Rows[0].Cells[1].Text) && (valuePd == i.ToString()))//CheckBoxListOsnova.Items[j].Value.ToString())) //  
                    {
                        CheckBoxListOsnova.Items[i-1].Selected = true;
                    }
                }

            }
            datatableMnogiePD.Dispose();

            // **** отмечаем существующие ПД специальные ********
            CheckBoxListSpecPD.ClearSelection();
            for (int i = 0; i <= CheckBoxListSpecPD.Items.Count; i++)
            {
                for (int j = 0; j < tblMnogiePDSpeccount; j++)
                {
                    string valueISPDn = datatableMnogiePDSpec.Rows[j][0].ToString();
                    string valuePd = datatableMnogiePDSpec.Rows[j][1].ToString();

                    if ((valueISPDn == DetailsViewISPDn.Rows[0].Cells[1].Text) && (valuePd == i.ToString()))
                    {
                        CheckBoxListSpecPD.Items[i - 1].Selected = true;
                    }
                }

            }
            datatableMnogiePDSpec.Dispose();
            
        }
        // показать скрыть панель био данных
        protected void ButtonPDBioView_Click(object sender, EventArgs e)
        {
            if (PanelBioPD.Visible == false)
            {
                PanelBioPD.Visible = true;
            }
            else
            {
                PanelBioPD.Visible = false;
            }
        }
        // кнопка добавления Био данных из всего списка
        protected void ButtonBioPDAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieBioPD.DeleteParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieBioPD.Delete();
            for (int i = 0; i < ListViewBioPD.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewBioPD.Items[i];
                CheckBox w = (CheckBox)item.FindControl("KategoryPdBioSelectCheckBox");
                if (w.Checked == true)
                {
                    Label LabPdBioID = (Label)item.FindControl("KategoryPdBioIDLabel");
                    SqlDataSourceMnogieBioPD.InsertParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieBioPD.InsertParameters["KategoryPdBioID"].DefaultValue = LabPdBioID.Text;
                    SqlDataSourceMnogieBioPD.Insert();
                    GridViewPDBioISPDn.DataBind();
                }
            }
        }
        // передача параметра для селекта биометрических ПД
        protected void SqlDataSourcePDBioISPD_Load(object sender, EventArgs e)
        {
            if (DetailsViewISPDn.Rows.Count == 0)
            {
                GridViewPDBioISPDn.Visible = false;
            }
            else
            {
                GridViewPDBioISPDn.Visible = true;
                SqlDataSourcePDBioISPD.SelectParameters["ParamISPDnID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            }
        }
        // добавление выбранных категорий работников
        protected void ButtonRabotnikiAdd_Click(object sender, EventArgs e)
        {
            SqlDataSourceMnogieRabotnikiISPDn.DeleteParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            SqlDataSourceMnogieRabotnikiISPDn.Delete();
            for (int i = 0; i < ListViewRabotnikiISPDn.Items.Count; i++)
            {
                ListViewItem item = (ListViewItem)ListViewRabotnikiISPDn.Items[i];
                CheckBox w = (CheckBox)item.FindControl("RabotnikiOrgSelectCheckBox");
                if (w.Checked == true)
                {
                    Label LabRabotnikiID = (Label)item.FindControl("RabotnikiOrgIDLabel");
                    SqlDataSourceMnogieRabotnikiISPDn.InsertParameters["ISPDnOperatorID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
                    SqlDataSourceMnogieRabotnikiISPDn.InsertParameters["RabotnikiOrgID"].DefaultValue = LabRabotnikiID.Text;
                    SqlDataSourceMnogieRabotnikiISPDn.Insert();
                    GridViewRabotnikiISPDn.DataBind();
                }
            }
        }
        // показать скрыть выбираемых работников
        protected void ButtonRabotnikiView_Click(object sender, EventArgs e)
        {
            if (ListViewRabotnikiISPDn.Visible == false)
            {
                ListViewRabotnikiISPDn.Visible = true;
            }
            else
            {
                ListViewRabotnikiISPDn.Visible = false;
            }
        }
        // передача параметра для селекта работников имеющих доступ к данной ИСПДн
        protected void SqlDataSourceRabotnikiISPDn_Load(object sender, EventArgs e)
        {
            if (DetailsViewISPDn.Rows.Count == 0)
            {
                GridViewRabotnikiISPDn.Visible = false;
            }
            else
            {
                GridViewRabotnikiISPDn.Visible = true;
                SqlDataSourceRabotnikiISPDn.SelectParameters["ParamISPDnID"].DefaultValue = DetailsViewISPDn.Rows[0].Cells[1].Text;
            }
            
        }
        //Классификация ИСПДн
        int kategoryPD;
        int obiemPD;
        int KlassISPDn;
        protected void ButtonKlassISPDn_Click(object sender, EventArgs e)
        {

            for (int i = 0; i < RadioButtonListKategoryPD.Items.Count; i++)
            {
                if (RadioButtonListKategoryPD.Items[i].Selected == true)
                {
                    kategoryPD = i+1;
                    goto step;
                }
            }
            step:
            for (int i = 0; i < RadioButtonListObiemPD.Items.Count; i++)
            {
                if (RadioButtonListObiemPD.Items[i].Selected == true)
                {
                    obiemPD = i+1;
                    goto step1;
                }
            }
            step1:

            if ((kategoryPD == 0) || (obiemPD == 0))
            {
                LabelErrorKlass.Text = "* не выбрана одна из характеристик для классификации";
                return;
            }
            else if ((kategoryPD == 1) && (obiemPD == 1))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 1;
            }
            else if ((kategoryPD == 1) && (obiemPD == 2))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 1;
            }
            else if ((kategoryPD == 1) && (obiemPD == 3))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 1;
            }
            else if ((kategoryPD == 2) && (obiemPD == 1))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 1;
            }
            else if ((kategoryPD == 2) && (obiemPD == 2))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 2;
            }
            else if ((kategoryPD == 2) && (obiemPD == 3))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 3;
            }
            else if ((kategoryPD == 3) && (obiemPD == 1))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 2;
            }
            else if ((kategoryPD == 3) && (obiemPD == 2))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 3;
            }
            else if ((kategoryPD == 3) && (obiemPD == 3))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 3;
            }
            else if ((kategoryPD == 4) && (obiemPD == 1))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 4;
            }
            else if ((kategoryPD == 4) && (obiemPD == 2))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 4;
            }
            else if ((kategoryPD == 4) && (obiemPD == 3))
            {
                LabelErrorKlass.Text = "";
                KlassISPDn = 4;
            }

            //*** Методы обновления данных в таблице ИСПДн
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = conn;
            sds.UpdateParameters.Add(new Parameter("ParamKategoryPD", TypeCode.Int32, kategoryPD.ToString()));
            sds.UpdateParameters.Add(new Parameter("ParamObiemPD", TypeCode.Int32, obiemPD.ToString()));
            sds.UpdateParameters.Add(new Parameter("ParamKlassID", TypeCode.Int32, KlassISPDn.ToString()));
            sds.UpdateParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
            sds.UpdateCommand = "UPDATE ISPDnOperator SET ISPDnKategoryID = @ParamKategoryPD, ISPDnObemID = @ParamObiemPD, ISPDnKlassID = @ParamKlassID WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sds.Update();
            sds.Dispose();
        }
        // определение типа ИСПДн
        protected void ButtonTipModeli_Click(object sender, EventArgs e)
        {
            int tipModeli;
            for (int i = 0; i < RadioButtonListTipModeli.Items.Count; i++)
            {
                if (RadioButtonListTipModeli.Items[i].Selected == true)
                {
                    tipModeli = i + 1;
                   //*** Методы обновления данных в таблице ИСПДн
                    string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                    SqlDataSource sds = new SqlDataSource();
                    sds.ConnectionString = conn;
                    sds.UpdateParameters.Add(new Parameter("ParamTipModeli", TypeCode.Int32, tipModeli.ToString()));
                    sds.UpdateParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDn.Rows[0].Cells[1].Text));
                    sds.UpdateCommand = "UPDATE ISPDnOperator SET ISPDnTipModeli = @ParamTipModeli WHERE (ISPDnOperatorID = @ParamISPDnID)";
                    sds.Update();
                    sds.Dispose();
                    LabelErrorTipISPDn.Text = "";
                    return;
                }
                else
                {
                    LabelErrorTipISPDn.Text = "Нет параметров для определения типа Модели угроз ИСПДн";
                }
            }

        }
    }
}

