//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CuaHangVangBacDaQuy.models
{
    using CuaHangVangBacDaQuy.viewmodels;
    using System;
    using System.Collections.Generic;
    
    public partial class NhaCungCap:BaseViewModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhaCungCap()
        {
            this.PhieuMuas = new HashSet<PhieuMua>();
        }
    
        public int MaNCC { get; set; }

        //private int _MaNCC { get; set; }
        //public int MaNCC { get => _MaNCC; set { _MaNCC = value; OnPropertyChanged(); } }
        private string _TenNCC { get; set; }
        public string TenNCC { get => _TenNCC; set { _TenNCC = value; OnPropertyChanged(); } }
        private string _DiaChi { get; set; }
        public string DiaChi { get => _DiaChi; set { _DiaChi = value; OnPropertyChanged(); } }

        private string _SoDT { get; set; }
        public string SoDT { get => _SoDT; set { _SoDT = value; OnPropertyChanged(); } }
       
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuMua> PhieuMuas { get; set; }
    }
}
