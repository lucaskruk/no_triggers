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
    
    public partial class habitacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public habitacion()
        {
            this.estadia = new HashSet<estadia>();
            this.reserva = new HashSet<reserva>();
        }
    
        public int id_habitacion { get; set; }
        public Nullable<int> habitacion_numero { get; set; }
        public Nullable<int> habitacion_piso { get; set; }
        public string habitacion_frente { get; set; }
        public Nullable<bool> habitacion_habilitada { get; set; }
        public Nullable<bool> habitacion_ocupada { get; set; }
        public Nullable<int> Id_tipo_habitacion { get; set; }
        public Nullable<int> Id_hotel { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<estadia> estadia { get; set; }
        public virtual hotel hotel { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<reserva> reserva { get; set; }
        public virtual tipoDeHabitacion tipoDeHabitacion { get; set; }
    }
}