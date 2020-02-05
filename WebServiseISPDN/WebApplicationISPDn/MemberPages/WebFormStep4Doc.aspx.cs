using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Ionic.Zip;
using System.Text;
using System.Web.Security;

namespace WebApplicationISPDn.MemberPages
{
    public partial class WebFormStep4Doc : System.Web.UI.Page
    {
        /*При загрузке заполняем лист чекбокс*/
        protected void Page_Load(object sender, EventArgs e)
        {
            // просматриваем файлы из директории и показываем их для архивирования
            string pathSchabl = @"\MemberPages\Sabl\";
            string putFirst;
            putFirst = System.AppDomain.CurrentDomain.BaseDirectory;
            DirectoryInfo dir = new DirectoryInfo(putFirst + pathSchabl);

            foreach (var itemDir in dir.GetDirectories())
            {

                int i = 0;
                foreach (var item in itemDir.GetFiles())
                {
                    // вставляем Итемс и добовляем ему в значения настоящие имена файлов
                    CheckBoxListDocZip.Items.Insert(i, item.Name);
                    CheckBoxListDocZip.Items[i].Text = GetNameDocMethod(item.Name);
                    CheckBoxListDocZip.Items[i].Value = item.Name;
                    i += 1;
                }
                i = 0;
            }
        }

        /*Метод получения имени файла в русской транскрипции*/
        private static string GetNameDocMethod(string nameDoc)
        {
            string nameRusDoc = "";
            switch (nameDoc)
            {
                case "sUvedomlenie2-22.rtf": nameRusDoc = "Письмо ч. 2 ст. 22";
                    break;
                case "sUvedomleniePortal.rtf": nameRusDoc = "Уведомление на портал";
                    break;
                case "sUvedomleniePost.rtf": nameRusDoc = "Удаление Пд из ИСПДн";
                    break;
                case "sAktUstanovkiSZI.rtf": nameRusDoc = "Акт установки средств защиты";
                    break;
                case "sKoncepciaInfBezopasnosti.rtf": nameRusDoc = "Концепция Инф безопасности";
                    break;
                case "sKontrolZona.rtf": nameRusDoc = "Контролируемая зона";
                    break;
                case "sMatritsaDostupa.rtf": nameRusDoc = "Матрица доступа к ИСПДн";
                    break;
                case "sPolitikaInformBezopasnPD.rtf": nameRusDoc = "Политика информ безопасности";
                    break;
                case "sProektNaBezopasnostPD.rtf": nameRusDoc = "Проект безопасности ПД";
                    break;
                case "sTehnicheskiPasportISPDn.rtf": nameRusDoc = "Тех паспорт ИСПДн";
                    break;
                case "sTehnicheskiPasportObjectaInf.rtf": nameRusDoc = "Тех паспорт Объекта";
                    break;
                case "sTehZadaniePD.rtf": nameRusDoc = "Тех задание ИСПДн";
                    break;
                case "sTopologiISPDn.rtf": nameRusDoc = "Топология ИСПДн";
                    break;
                case "sZakluchenieOvozmognostiEkspluatacii.rtf": nameRusDoc = "Заключение о возможности эксплуатации";
                    break;
                case "sSoglasieNaObrabotkuOtziv.rtf": nameRusDoc = "Отзыв Согласия на обработку";
                    break;
                case "sPrikaziObiazatelstvoKonfidencial.rtf": nameRusDoc = "Приказ конфиденциальности";
                    break;
                case "sPrikazMeropriyatiPoZashite.rtf": nameRusDoc = "Приказ на мероприятия по защите";
                    break;
                case "sPrikazNaznachenieOtvetstvenZaBezopasnost.rtf": nameRusDoc = "Приказ на ответственного за безопасность";
                    break;
                case "sPrikazNaznacheniyaAdminaBezopasnosty.rtf": nameRusDoc = "Приказ на администратора безопасности";
                    break;
                case "sPrikazObElektronnomGurnale.rtf": nameRusDoc = "Приказ об электронном журнале";
                    break;
                case "sPrikazOtvetstvenZaObrabotku.rtf": nameRusDoc = "Приказ ответственного за обработку";
                    break;
                case "sPrikazVidileniePomesheniKonfidencial.rtf": nameRusDoc = "Приказ на выделение помещения для Конф Информации";
                    break;
                case "sPrikazVidilenPomesheniObrabotkiPD.rtf": nameRusDoc = "Приказ на выделение помещения для ПД";
                    break;
                case "sAktUnichtozheniyaPDn.rtf": nameRusDoc = "Акт уничтожения ПД";
                    break;
                case "sPologenieOrazgranicheniiPravDostupa.rtf": nameRusDoc = "Положение о разграничении прав доступа";
                    break;
                case "sPolozhenieObabotkaPDnObshee.rtf": nameRusDoc = "Положение о персональных данных";
                    break;
                case "sPolozhenieZashchiteKI.rtf": nameRusDoc = "Положение о защите конф информации";
                    break;
                case "sPoriadokRezervKopir.rtf": nameRusDoc = "Порядок резервного копирования";
                    break;
                case "sRukovodstvoAdministratoraISPDn.rtf": nameRusDoc = "Руководство администратора ИСПДн";
                    break;
                case "sRukovodstvoPolzovatelyaISPDn.rtf": nameRusDoc = "Руководство пользователя ИСПДн";
                    break;
                case "sUdaleniePDizISPDn.rtf": nameRusDoc = "Удаление Пд из ИСПДн";
                    break;
                case "sPlanMeropriyatiPoZashite.rtf": nameRusDoc = "План мероприятий по защите";
                    break;
                case "sPlanVnutrennikhProverokZachitaPD.rtf": nameRusDoc = "План внутренних проверок защиты Инфы";
                    break;
                case "sPerechenASystem.rtf": nameRusDoc = "Перечень ИСПДн";
                    break;
                case "sPerechenKonfidencialPDn.rtf": nameRusDoc = "Перечень конфиденциальных ПД";
                    break;
                case "sPerechenSredstvZashit.rtf": nameRusDoc = "Перечень средств защиты";
                    break;
                case "sPerehenLicDopushenServeriArhiv.rtf": nameRusDoc = "Перечень лиз допущенных к серверу и архиву";
                    break;
                case "sModelNaruschitel.rtf": nameRusDoc = "Модель нарушителя";
                    break;
                case "sModelUgrozARMnoInet.rtf": nameRusDoc = "Модель угроз АРМ без подключениея к ИНЕТ";
                    break;
                case "sModelUgrozARMyesInet.rtf": nameRusDoc = "Модель угроз АРМ с подключением к ИНЕТ";
                    break;
                case "sModelUgrozLVSnoInet.rtf": nameRusDoc = "Модель угроз ИСПДн ЛВС без Инет";
                    break;
                case "sInstrukciyaRezervirovaniia.rtf": nameRusDoc = "Инструкция Резервирования инфы";
                    break;
                case "sModelUgrozLVSyesInet.rtf": nameRusDoc = "Модель угроз ИСПДн в ЛВС с Инет";
                    break;
                case "sModelUgrozRasprednoInet.rtf": nameRusDoc = "Модель угроз ИСПДн не подключенных к Инет";
                    break;
                case "sModelUgrozRaspredyesInet.rtf": nameRusDoc = "Модель угроз ИСПДн подключенных к Инет";
                    break;
                case "sAktKlassISPDn.rtf": nameRusDoc = "Акт классификации ИСПДн";
                    break;
                case "sPrikazKlassISPDn.rtf": nameRusDoc = "Приказ на классификацию ИСПДн";
                    break;
                case "sInstrukciaPolzovateleyLVS.rtf": nameRusDoc = "Инструкция пользователей ЛВС";
                    break;
                case "sInstrukciyaAdmina.rtf": nameRusDoc = "Инструкция  админа";
                    break;
                case "sInstruktionAntivirusParol.rtf": nameRusDoc = "Инструкция по антивирусному паролю";
                    break;
                case "sInstruktsiyaUchetaNosteley.rtf": nameRusDoc = "Инструкция по учету материальных носителей";
                    break;
                case "sGurnalRazovogoPropuska.rtf": nameRusDoc = "Журнал разового пропуска";
                    break;
                case "sGurnalRegistrZaprosovSubject.rtf": nameRusDoc = "Журнал запросов субъектов ПД";
                    break;
                case "sGurnalUchetaKluthevihNositeley.rtf": nameRusDoc = "Журнал учета ключевых носителей";
                    break;
                case "sGurnalUchetaKriptosredstv.rtf": nameRusDoc = "Журнал учета криптосредств";
                    break;
                case "sGurnalUchetaNositeley.rtf": nameRusDoc = "Журнал учета носителей";
                    break;
                case "sGurnalUchetaParoley.rtf": nameRusDoc = "Журнал учета паролей";
                    break;
                case "sGurnalUchetaProverokStolb.rtf": nameRusDoc = "Журнал проверок Столб";
                    break;
                case "sGurnalUchetaProverokTable.rtf": nameRusDoc = "Журнал проверок табл";
                    break;
                case "sGurnalUchetaSredstvZachit.rtf": nameRusDoc = "Журнал учета средств защиты";
                    break;
                case "sMinimizationZatratNaZashitu.rtf": nameRusDoc = "Минимизация затрат";
                    break;
                case "sOtchetPoAuditu.rtf": nameRusDoc = "Отчет по Аудиту";
                    break;
                case "sPrikazNaznachenieOtvetstvenZaTehnZahituKripto.rtf": nameRusDoc = "Приказ на ответственных по тех защите";
                    break;
                default: nameRusDoc = "";
                    break;
            }
            return nameRusDoc;
        }

        /*При нажатии на кнопку работаем с файлами в каталогах, ищем читаем, меняем, сохраняем,  архивируем их и даем юзеру ссылку на архив*/
        protected void ButtonGetZip_Click(object sender, EventArgs e)
        {
            string pathSchabl = @"\MemberPages\Sabl\";
            string pathLoadArhiv = @"\MemberPages\LoadFiles\ArhivDoc\";
            string pathLoad = @"\MemberPages\LoadFiles\";
            string putFirst;
            putFirst = System.AppDomain.CurrentDomain.BaseDirectory;
            
            string fileName;
            string sourcePath; // файл откуда копируется
            string targetPath; // файл куда копируется
            DirectoryInfo dirFil = new DirectoryInfo(putFirst + pathSchabl);

              for (int j = 0; j < CheckBoxListDocZip.Items.Count; j++) // перибираем чеки
                {
                    if (CheckBoxListDocZip.Items[j].Selected == true) //если документ выбран
                    {
                        foreach (var itemDir in dirFil.GetDirectories()) // выбираем читаем все поддиректории
                        {
                            foreach (var itemFil in itemDir.GetFiles()) // сверяем во всех поддиректориях файлы с отмеченным
                                if (itemFil.ToString() == CheckBoxListDocZip.Items[j].Value) // если совпадает то строим до файла путь и работаем с ним
                                {
                                    string fileMetodReplace = itemFil.ToString(); // переменная для хранения значения названия файла для с целью подбора нужного метода замены текста
                                    sourcePath = putFirst + pathSchabl + itemDir; // путь к поддирикториям где лежат файлы
                                    fileName = itemFil.ToString();
                                    
                                    targetPath = putFirst + pathLoadArhiv; // куда временно перед архивированием сохранять файлы
                                    string sourceFile = System.IO.Path.Combine(sourcePath, fileName); // файл который нужна прочитать с полным путем
                                    string destFile = System.IO.Path.Combine(targetPath, fileName); // куда нужно копировать файл измененный
                                    // проверяем существование дириктории если ее нет то создаем
                                    if (!System.IO.Directory.Exists(targetPath))
                                    {
                                        System.IO.Directory.CreateDirectory(targetPath);
                                    }

                                    /**
                                     *  Тут нужно считать файл шаблона в переменну. rtfDoc 
                                     */
                                    string rtfDoc;
                                    using (StreamReader sr = new StreamReader((sourceFile), Encoding.GetEncoding("windows-1251")))
                                    {
                                        rtfDoc = sr.ReadToEnd();
                                    }

                                    /*
                                     * Блок замены данных в файле перед созданием нового
                                     * ********************************************************************************************
                                     */
                                    ClassReplaceMetod replaceDoc = new ClassReplaceMetod(); // экземпляр методов замены шаблонов
                                    ClassGetDataBD getDataSQL = new ClassGetDataBD(); // экземпляр методов получения данных из базы
                                    string test = "";
                                    switch (fileMetodReplace)
                                    {
                                        case "sUvedomlenie2-22.rtf":
                                            test = "";
                                            break;
                                        case "sUvedomleniePortal.rtf":
                                            test = "";
                                            break;
                                        case "sUvedomleniePost.rtf":
                                            test = "";
                                            break;
                                        case "sAktUstanovkiSZI.rtf":
                                            test = "";
                                            break;
                                        case "sKoncepciaInfBezopasnosti.rtf":
                                            test = "";
                                            break;
                                        case "sKontrolZona.rtf":
                                            test = "";
                                            break;
                                        case "sMatritsaDostupa.rtf":
                                            test = "";
                                            break;
                                        case "sPolitikaInformBezopasnPD.rtf":
                                            test = "";
                                            break;
                                        case "sProektNaBezopasnostPD.rtf": 
                                            test = "";
                                            break;
                                        case "sTehnicheskiPasportISPDn.rtf":
                                            test = "";
                                            break;
                                        case "sTehnicheskiPasportObjectaInf.rtf":
                                            test = "";
                                            break;
                                        case "sTehZadaniePD.rtf":
                                            test = "";
                                            break;
                                        case "sTopologiISPDn.rtf":
                                            test = "";
                                            break;
                                        case "sZakluchenieOvozmognostiEkspluatacii.rtf":
                                            test = "";
                                            break;
                                        case "sSoglasieNaObrabotkuOtziv.rtf":
                                            test = "";
                                            break;
                                        case "sPrikaziObiazatelstvoKonfidencial.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazMeropriyatiPoZashite.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazNaznachenieOtvetstvenZaBezopasnost.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazNaznacheniyaAdminaBezopasnosty.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazObElektronnomGurnale.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazOtvetstvenZaObrabotku.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazVidileniePomesheniKonfidencial.rtf": 
                                            test = "";
                                            break;
                                        case "sPrikazVidilenPomesheniObrabotkiPD.rtf": 
                                            test = "";
                                            break;
                                        case "sAktUnichtozheniyaPDn.rtf":
                                            test = "";
                                            break;
                                        case "sPologenieOrazgranicheniiPravDostupa.rtf": 
                                            test = "";
                                            break;
                                        case "sPolozhenieObabotkaPDnObshee.rtf":
                                            test = "";
                                            break;
                                        case "sPolozhenieZashchiteKI.rtf":
                                            test = "";
                                            break;
                                        case "sPoriadokRezervKopir.rtf":
                                            test = "";
                                            break;
                                        case "sRukovodstvoAdministratoraISPDn.rtf":
                                            test = "";
                                            break;
                                        case "sRukovodstvoPolzovatelyaISPDn.rtf": 
                                            test = "";
                                            break;
                                        case "sUdaleniePDizISPDn.rtf":
                                            test = "";
                                            break;
                                        case "sPlanMeropriyatiPoZashite.rtf":
                                            test = "";
                                            break;
                                        case "sPlanVnutrennikhProverokZachitaPD.rtf":
                                            test = "";
                                            break;
                                        case "sPerechenASystem.rtf":
                                            test = "";
                                            break;
                                        case "sPerechenKonfidencialPDn.rtf":
                                            test = "";
                                            break;
                                        case "sPerechenSredstvZashit.rtf":
                                            test = "";
                                            break;
                                        case "sPerehenLicDopushenServeriArhiv.rtf":
                                            test = "";
                                            break;
                                        case "sModelNaruschitel.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozARMnoInet.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozARMyesInet.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozLVSnoInet.rtf":
                                            test = "";
                                            break;
                                        case "sInstrukciyaRezervirovaniia.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozLVSyesInet.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozRasprednoInet.rtf":
                                            test = "";
                                            break;
                                        case "sModelUgrozRaspredyesInet.rtf":
                                            test = "";
                                            break;
                                        case "sAktKlassISPDn.rtf":
                                            string rukfio = DetailsViewOrganizDoc.Rows[4].Cells[1].Text;
                                            string operarorname = DetailsViewOrganizDoc.Rows[1].Cells[1].Text;;
                                            string operaradress = DetailsViewOrganizDoc.Rows[6].Cells[1].Text;;
                                            rtfDoc = replaceDoc.ReplaceDocAktKlassISPDnMetod(rtfDoc, rukfio, "1СССССС", operarorname, operaradress);
                                            break;
                                        case "sPrikazKlassISPDn.rtf":
                                            rtfDoc = replaceDoc.ReplaceDocPrikazKlassISPDnMetod(rtfDoc, "Иванов", "Директор");
                                            break;
                                        case "sInstrukciaPolzovateleyLVS.rtf":
                                            test = "";
                                            break;
                                        case "sInstrukciyaAdmina.rtf":
                                            test = "";
                                            break;
                                        case "sInstruktionAntivirusParol.rtf":
                                            test = "";
                                            break;
                                        case "sInstruktsiyaUchetaNosteley.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalRazovogoPropuska.rtf":
                                            rtfDoc = replaceDoc.ReplaceDocGurnalRazPropuskMetod(rtfDoc, "Петров", "Зам директора");                                         
                                            break;
                                        case "sGurnalRegistrZaprosovSubject.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaKluthevihNositeley.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaKriptosredstv.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaNositeley.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaParoley.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaProverokStolb.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaProverokTable.rtf":
                                            test = "";
                                            break;
                                        case "sGurnalUchetaSredstvZachit.rtf":
                                            test = "";
                                            break;
                                        case "sMinZatratNaZashitu.rtf":
                                            test = "";
                                            break;
                                        case "sOtchetPoAuditu.rtf":
                                            test = "";
                                            break;
                                        case "sPrikazNaznachenieOtvetstvenZaTehnZahituKripto.rtf":
                                            test = "";
                                            break;
                                        default: test = "";
                                            break;
                                    }

                                    /*
                                    * Конец блок замены данных в файле перед созданием нового
                                    * ********************************************************************************************
                                    */
                                    
                                    /**
                                     *  Тут нужно записать файл в новый Rtf  с тем же именем 
                                     */
                                    using (StreamWriter FS = new StreamWriter(destFile, true, System.Text.Encoding.GetEncoding(1251)))
                                    {
                                        FS.Write(rtfDoc); // сохранить даные из richTextBox1
                                        FS.Close();
                                    }
                                    rtfDoc = "";
                                }
                        }
                    }

                }

              if (!System.IO.Directory.Exists(putFirst + pathLoadArhiv))
              {
                  System.IO.Directory.CreateDirectory(putFirst + pathLoadArhiv);
              }
              DirectoryInfo dirFilArh = new DirectoryInfo(putFirst + pathLoadArhiv);
            if (dirFilArh.GetFiles().Length > 0)
            {
                using (ZipFile zip = new ZipFile()) // Создаем объект для работы с архивом
                {
                    zip.CompressionLevel = Ionic.Zlib.CompressionLevel.BestCompression; // Задаем максимальную степень сжатия
                    // конец раздела архивирования
                    zip.AddDirectory(putFirst + pathLoadArhiv); // Кладем в архив папку вместе с содежимым
                    //zip.AddFile(@"c:\PROEKT\WebServiseISPDN\WebApplicationISPDn\MemberPages\GotovDoc\AktKlassISPDn.doc"); // Кладем в архив одиночный файл
                    zip.Save(putFirst + pathLoad + "docsAudit.zip"); // Создаем архив  
                
                }
                
                CheckBoxListDocZip.Items.Clear();
                HyperLinkDocLoad.Text = "Ваша ссылка на архив документов";
                HyperLinkDocLoad.NavigateUrl = "~\\MemberPages\\LoadFiles\\docsAudit.zip";
                HyperLinkDocLoad.Visible = true;
                System.IO.Directory.Delete(putFirst + pathLoadArhiv, true);
            }
            else
            {
                CheckBoxListDocZip.Items.Clear();
                HyperLinkDocLoad.Text = "Вы не сформировали ни одного документа";
                HyperLinkDocLoad.NavigateUrl = "";
                HyperLinkDocLoad.Visible = true;
                HyperLinkDocLoad.Enabled = false;
            }
              
        }

        // загрузка Деталис виюв Организации
        protected void DetailsViewOrganizDoc_Load(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            string userIDorganization = user.ProviderUserKey.ToString();
            if (user != null)
            {
                SqlDataSourceOrganizationDoc.SelectParameters["ParamUserID"].DefaultValue = userIDorganization;
            }
        }

    }
}