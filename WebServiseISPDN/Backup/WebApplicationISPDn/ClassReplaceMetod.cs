using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationISPDn
{
    public class ClassReplaceMetod
    {
        /*
         *  Метод приказа классификации ИСПДн
         * */

        public string ReplaceDocPrikazKlassISPDnMetod(string docreplaсe, string rukfio, string rukdolgn)
        { 
            string param1;
            string param2;
            param1 = docreplaсe.Replace("rukovoditelfio", rukfio);
            param2 = param1.Replace("rukovoditeldolgn", rukdolgn);
            return param2;
        }

        /*
        *  Метод Акта классификации ИСПДн
         */

        public string ReplaceDocAktKlassISPDnMetod(string docreplaсe, string rukfio, string ispdnname, string operatorname, string operatoradress)
        { 
            string param1;
            string param2;
            string param3;
            string param4;
            param1 = docreplaсe.Replace("rukovoditelfio", rukfio);
            param2 = param1.Replace("ispdnname", ispdnname);
            param3 = param2.Replace("operatorname", operatorname);
            param4 = param3.Replace("operatoradress", operatoradress);
            return param4;
        }
       
        /*
         *  Метод для журнала разового пропуска
         * */
        public string ReplaceDocGurnalRazPropuskMetod(string docreplaсe, string rukfio, string rukdolgn)
        {
            string param1;
            string param2;
            param1 = docreplaсe.Replace("rukovoditelfio", rukfio);
            param2 = param1.Replace("rukovoditeldolgn", rukdolgn);
            return param2;
        }
    }
}