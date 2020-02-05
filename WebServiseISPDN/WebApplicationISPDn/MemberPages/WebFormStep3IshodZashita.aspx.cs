using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;

namespace WebApplicationISPDn
{
    public partial class _Default : System.Web.UI.Page
    {

        // кнопка для расчетов исходной защищенности
        protected void ButtonIshodZaschita_Click(object sender, EventArgs e)
        {
            int index = RadioButtonListTerritory.SelectedIndex;
            if ((RadioButtonListTerritory.SelectedIndex == -1) || (RadioButtonListObschieSety.SelectedIndex == -1) ||
            (RadioButtonListLegalOperation.SelectedIndex == -1) || (RadioButtonListRazgrDostup.SelectedIndex == -1) ||
            (RadioButtonListSoedinInBD.SelectedIndex == -1) || (RadioButtonListBezlich.SelectedIndex == -1) ||
            (RadioButtonListObiem.SelectedIndex == -1))
            {
                LabelErrorIshodHarakteristik.Text = "Не указана одна из характеристик для исходной защищенности";
            }
            else
            {
               
            
            //*** удаление записей с связной таблице исходной защищенности
            string conn = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = conn;
            sds.DeleteParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDnIshodZachita.Rows[0].Cells[1].Text));
            sds.DeleteCommand = "DELETE FROM MnogieHarakteristikiIshod WHERE (ISPDnOperatorID = @ParamISPDnID)";
            sds.Delete();
            sds.Dispose();

            /* РАСЧИТЫВАЕМ ИСХОДНУЮ ЗАЩИЩЕННОСТЬ
             * ****************************************************/
            Boolean[,] ModelArray = new Boolean[22, 3];
                    // по территориальному размещению
                    ModelArray[0, 2] = RadioButtonListTerritory.Items[0].Selected;   //распределенная ИСПДн, которая охватывает несколько областей, краев, округов или государство в целом;
                    ModelArray[1, 2] = RadioButtonListTerritory.Items[1].Selected;   //городская ИСПДн, охватывающая не более одного населенного пункта [города, поселка];
                    ModelArray[2, 1] = RadioButtonListTerritory.Items[2].Selected;  //корпоративная распределенная ИСПДн, охватывающая многие подразделения одной организации;
                    ModelArray[3, 1] = RadioButtonListTerritory.Items[3].Selected;  //окальная [кампусная] ИСПДн, развернутая в пределах нескольких близко расположенных зданий;
                    ModelArray[4, 0] = RadioButtonListTerritory.Items[4].Selected;  //локальная ИСПДн, развернутая в пределах одного здания

                    // по наличию соединений с сетями общего пользования
                    ModelArray[5, 2] = RadioButtonListObschieSety.Items[0].Selected; //ИСПДн, имеющая многоточечный выход в сеть общего пользования;
                    ModelArray[6, 1] = RadioButtonListObschieSety.Items[1].Selected;  //ИСПДн, имеющая одноточечный выход в сеть общего пользования;
                    ModelArray[7, 0] = RadioButtonListObschieSety.Items[2].Selected;  //ИСПДн, физически отделенная от сети общего пользования

                    // По легальным операциям
                    ModelArray[8, 0] = RadioButtonListLegalOperation.Items[0].Selected; // чтение, поиск;
                    ModelArray[9, 1] = RadioButtonListLegalOperation.Items[1].Selected;  //запись, удаление, сортировка;
                    ModelArray[10, 2] = RadioButtonListLegalOperation.Items[2].Selected;  //модификация, передача

                    // По разграничению доступа
                    ModelArray[11, 1] = RadioButtonListRazgrDostup.Items[0].Selected; //ИСПДн, к которой имеют доступ определенные переченем сотрудники организации, являющейся владельцем ИСПДн, либо субъект ПДн;
                    ModelArray[12, 2] = RadioButtonListRazgrDostup.Items[1].Selected;   //ИСПДн, к которой имеют доступ все сотрудники организации, являющейся владельцем ИСПДн;
                    ModelArray[13, 2] = RadioButtonListRazgrDostup.Items[2].Selected;   //ИСПДн с открытым доступом

                    //По наличию соединения с другими базами ИСПДн
                    ModelArray[14, 2] = RadioButtonListSoedinInBD.Items[0].Selected;  //интегрированная ИСПДн [организация использует несколько баз ПДн ИСПДн, при этом организация не является владельцем всех используемых баз ПДн];
                    ModelArray[15, 0] = RadioButtonListSoedinInBD.Items[1].Selected;  //ИСПДн, в которой используется одна база ПДн, принадлежащая организации – владельцу данной ИСПДн


                    //По уровню обобщения [обезличивания] ПДн
                    ModelArray[16, 0] = RadioButtonListBezlich.Items[0].Selected;  //ИСПДн, в которой предоставляемые пользователю данные являются обезличенными [на уровне организации, отрасли, области, региона и т.д.];
                    ModelArray[17, 1] = RadioButtonListBezlich.Items[1].Selected;  //ИСПДн, в которой данные обезличиваются только при передаче в другие организации и не обезличены при предоставлении пользователю в организации;
                    ModelArray[18, 2] = RadioButtonListBezlich.Items[2].Selected;  //ИСПДн, в которой предоставляемые пользователю данные не являются обезличенными [т.е. присутствует информация, позволяющая идентифицировать субъекта ПДн]

                    // по объему ПДн, которые предостовляются другим
                    ModelArray[19, 2] = RadioButtonListObiem.Items[0].Selected;  //ИСПДн, предоставляющая всю базу данных с ПДн;
                    ModelArray[20, 1] = RadioButtonListObiem.Items[1].Selected;  //ИСПДн, предоставляющая часть ПДн;
                    ModelArray[21, 0] = RadioButtonListObiem.Items[2].Selected; //ИСПДн, не предоставляющая никакой информации.

            /// добовляем данные в зависимости от условия
            SqlDataSource sdsIn = new SqlDataSource();
            sdsIn.ConnectionString = conn;
            sdsIn.InsertCommand = "INSERT INTO MnogieHarakteristikiIshod (ISPDnHarakteristikIshodID, ISPDnOperatorID) VALUES (@ParamHarakteristikIshod,@ParamISPDnID)";
            sdsIn.InsertParameters.Add(new Parameter("ParamHarakteristikIshod", TypeCode.Int32));
            sdsIn.InsertParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDnIshodZachita.Rows[0].Cells[1].Text));

            // Добавление записей в связные таблицы исходной защищенности
            if (ModelArray[5, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "1";
                sdsIn.Insert();
            }

            if (ModelArray[1, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "2";
                sdsIn.Insert();
            }
            if (ModelArray[2, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "3";
                sdsIn.Insert();
            }

            if (ModelArray[3, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "4";
                sdsIn.Insert();
            }
            if (ModelArray[4, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "5";
                sdsIn.Insert();
            }

            if (ModelArray[5, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "6";
                sdsIn.Insert();
            }

            if (ModelArray[6, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "7";
                sdsIn.Insert();
            }

            if (ModelArray[7, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "8";
                sdsIn.Insert();
            }

            if (ModelArray[8, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "9";
                sdsIn.Insert();
            }

            if (ModelArray[9, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "10";
                sdsIn.Insert();
            }

            if (ModelArray[10, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "11";
                sdsIn.Insert();
            }

            if (ModelArray[11, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "12";
                sdsIn.Insert();
            }

            if (ModelArray[12, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "13";
                sdsIn.Insert();
            }

            if (ModelArray[13, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "14";
                sdsIn.Insert();
            }

            if (ModelArray[14, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "15";
                sdsIn.Insert();
            }

            if (ModelArray[15, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "16";
                sdsIn.Insert();
            }

            if (ModelArray[16, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "17";
                sdsIn.Insert();
            }

            if (ModelArray[17, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "18";
                sdsIn.Insert();
            }

            if (ModelArray[18, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "19";
                sdsIn.Insert();
            }

            if (ModelArray[19, 2] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "20";
                sdsIn.Insert();
            }

            if (ModelArray[20, 1] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "21";
                sdsIn.Insert();
            }

            if (ModelArray[21, 0] == true)
            {
                sdsIn.InsertParameters["ParamHarakteristikIshod"].DefaultValue = "22";
                sdsIn.Insert();
            }

           sdsIn.Dispose();

                    int SumV; // переменная для сбоора количества положительных решений Выс уровень
                    int SumS;//' переменная для сбоора количества положительных решений Средний уровень
                    int SumN; //' переменная для сбоора количества положительных решений Низкий уровень
                    SumV = 0;
                    SumS = 0;
                    SumN = 0;

                    // СЧИТАЕМ ПОЛОЖИТ РЕШЕНИЯ ПО ВЫСОКОМУ УРОВНЮ
                    for (int v = 0; v < ModelArray.GetLength(0); v++)
                    {
                        if (ModelArray[v, 0] == true)
                        {
                            SumV = SumV + 1;

                        }
                    }

                    //СЧИТАЕМ ПОЛОЖИТ РЕШЕНИЯ ПО СРЕДНЕМУ УРОВНЮ
                    for (int s = 0; s < ModelArray.GetLength(0); s++)
                    {
                        if (ModelArray[s, 1] == true)
                        {
                            SumS = SumS + 1;
                        }
                    }

                    // СЧИТАЕМ ПОЛОЖИТ РЕШЕНИЯ ПО НИЗКОМУ УРОВНЮ
                    for (int n = 0; n < ModelArray.GetLength(0); n++)
                    {
                        if (ModelArray[n, 2] == true)
                        {
                            SumN = SumN + 1;
                        }
                    }

                    // КАКОЙ УРОВЕНЬ ЗАЩИЩЕНОСТИ ИМЕЕТ ИСПДН В ИТОГЕ

                    //int koofIshod; // коэфициэнт уровня защищенности         //'  коофициэнты исходной защищенности
                    double VurovenZachit = (7.0 * 70) / 100; //' высчитываем сколько характеристик будет состовлять 70 процентов от общего числа решений
                    // а если к отношение к числу положительных решений а не к орбщему то  VurovenZachit = 6 / 100 * 70 = 4,2 решения
                //UPDATE ISPDnOperator SET ISPDnIshodZashitaID = @ParamIshodZahita WHERE (ISPDnOperatorID = @ParamISPDnID)
                    SqlDataSource sdsUp = new SqlDataSource();
                    sdsUp.ConnectionString = conn;
                    sdsUp.UpdateCommand = "UPDATE ISPDnOperator SET ISPDnIshodZashitaID = @ParamIshodZahita WHERE (ISPDnOperatorID = @ParamISPDnID)";
                    sdsUp.UpdateParameters.Add(new Parameter("ParamIshodZahita", TypeCode.Int32));
                    sdsUp.UpdateParameters.Add(new Parameter("ParamISPDnID", TypeCode.Int32, DetailsViewISPDnIshodZachita.Rows[0].Cells[1].Text)); 

                //проверка условия на процент положит высокой защиты
                    if ((SumV >= VurovenZachit) && (SumN == 0))
                    {
                        sdsUp.UpdateParameters["ParamIshodZahita"].DefaultValue = "1";
                        sdsUp.Update();
                        LabelErrorIshodHarakteristik.Text = "ИСПДН имеет ВЫСОКИЙ уровень исходной защищености";
                    }
                    else if ((((SumV >= VurovenZachit) && (SumN == 0)) == false) && ((SumV + SumS) >= VurovenZachit))
                    {
                        sdsUp.UpdateParameters["ParamIshodZahita"].DefaultValue = "2";
                        sdsUp.Update();
                        LabelErrorIshodHarakteristik.Text = "ИСПДН имеет СРЕДНИЙ уровень исходной защищености";
                    }
                    else
                    {
                        sdsUp.UpdateParameters["ParamIshodZahita"].DefaultValue = "3";
                        sdsUp.Update();
                        LabelErrorIshodHarakteristik.Text = "ИСПДН имеет НИЗКИЙ уровень исходной защищености";
                    }
                    sdsUp.Dispose();
                } 
            }
        }
    }

