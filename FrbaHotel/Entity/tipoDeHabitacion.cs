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
    
    public partial class tipoDeHabitacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tipoDeHabitacion()
        {
            this.habitacion = new HashSet<habitacion>();
        }
    
        public int id_tipo_habitacion { get; set; }
        public string tipo_habitacion_descripcion { get; set; }
        public Nullable<double> tipo_habitacion_porcentual { get; set; }
        public Nullable<int> tipo_habitacion_codigo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<habitacion> habitacion { get; set; }
    }
}