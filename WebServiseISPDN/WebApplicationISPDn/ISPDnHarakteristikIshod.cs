//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplicationISPDn
{
    using System;
    using System.Collections.Generic;
    
    public partial class ISPDnHarakteristikIshod
    {
        public ISPDnHarakteristikIshod()
        {
            this.ISPDnOperator = new HashSet<ISPDnOperator>();
        }
    
        public int ISPDnHarakteristikIshodID { get; set; }
        public string ISPDnHarakteristikIshodName { get; set; }
        public Nullable<int> VidIshodHarakteristikID { get; set; }
    
        public virtual VidIshodHarakteristik VidIshodHarakteristik { get; set; }
        public virtual ICollection<ISPDnOperator> ISPDnOperator { get; set; }
    }
}
