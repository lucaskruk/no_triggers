//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FrbaHotel.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class regimen
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public regimen()
        {
            this.regimen_por_hotel = new HashSet<regimen_por_hotel>();
            this.reserva = new HashSet<reserva>();
        }
    
        public int id_regimen { get; set; }
        public string regimen_descripcion { get; set; }
        public Nullable<double> regimen_precio { get; set; }
        public Nullable<bool> regimen_estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<regimen_por_hotel> regimen_por_hotel { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<reserva> reserva { get; set; }
    }
}