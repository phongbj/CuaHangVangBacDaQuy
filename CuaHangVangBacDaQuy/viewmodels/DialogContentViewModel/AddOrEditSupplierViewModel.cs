﻿using CuaHangVangBacDaQuy.models;
using CuaHangVangBacDaQuy.views.userControl;
using CuaHangVangBacDaQuy.views.userControlDialog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Media3D;

namespace CuaHangVangBacDaQuy.viewmodels.DialogContentViewModel
{
    public class AddOrEditSupplierViewModel : BaseViewModel
    {
        private readonly ObservableCollection<NhaCungCap> SuppliersList;

        private NhaCungCap _EditedSupplier;
        public NhaCungCap EditedSupplier
        {
            get => _EditedSupplier;

            set
            {
                _EditedSupplier = value;
                OnPropertyChanged();

                if (EditedSupplier != null)
                {

                    SupplierName = EditedSupplier.TenNCC;
                    SupplierAddress = EditedSupplier.DiaChi;
                    SupplierPhoneNumber = EditedSupplier.SoDT;


                }
            }
        }

        private readonly OpenDiaLog openDiaLog;

        private string _TitleView;
        public string TitleView { get => _TitleView; set { _TitleView = value; OnPropertyChanged(); } }


        private string _SupplierName;
        public string SupplierName
        {
            get => _SupplierName;
            set
            {
                _SupplierName = value; OnPropertyChanged();
            }
        }



        private string _SupplierAddress;
        public string SupplierAddress
        {
            get => _SupplierAddress;
            set
            {
                _SupplierAddress = value; OnPropertyChanged();
            }

        }


        private string _SupplierPhoneNumber;
        public string SupplierPhoneNumber { get => _SupplierPhoneNumber; set { _SupplierPhoneNumber = value; OnPropertyChanged(); } }

        public int supplierCode;

        public ICommand SaveCommand { get; set; }
        public ICommand CancelCommand { get; set; }




        public AddOrEditSupplierViewModel()
        {


        }

        //constructor used for add new supplier 
        public AddOrEditSupplierViewModel(string titleView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<NhaCungCap> suppliersList)
        {


            TitleView = titleView;
            openDiaLog = isOpenDialog;
            SuppliersList = suppliersList;
            CancelCommand = new RelayCommand<AddOrEditSupplierUC>((p) => true, p => CheckCloseDiaLog());
            SaveCommand = new RelayCommand<AddOrEditSupplierUC>((p) => true, p => ActionAddSupplier());



        }


        //constructor used for edit supplier
        public AddOrEditSupplierViewModel(string tilteView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<NhaCungCap> suppliersList, ref NhaCungCap editedSupplier)
        {
            TitleView = tilteView;
            openDiaLog = isOpenDialog;
            SuppliersList = suppliersList;
            EditedSupplier = editedSupplier;
            CancelCommand = new RelayCommand<AddOrEditSupplierUC>((p) => true, p => CheckCloseDiaLog());
            SaveCommand = new RelayCommand<AddOrEditSupplierUC>((p) => true, p => ActionEditSupplier());

        }



        //constructor used for add new supplier in make pushchase oder view

        //public AddSupplierViewModel(string tilteView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<NhaCungCap> suppliersList, ref ObservableCollection<NhaCungCap> selectedSuppliersList)
        //{
        //    TitleView = tilteView;
        //    openDiaLog = isOpenDialog;
        //    SuppliersList = suppliersList;
        //    SelectedSuppliersList = selectedSuppliersList;
        //    CancelCommand = new RelayCommand<AddSupplierUC>((p) => true, p => CheckCloseDiaLog());
        //    SaveCommand = new RelayCommand<AddSupplierUC>((p) => checkEmptyFieldDialog(), p => ActionAddSupplier());
        //}




       
        public bool CheckValidSupplier()
        {

            if (string.IsNullOrWhiteSpace(SupplierName) || string.IsNullOrWhiteSpace(SupplierAddress) || string.IsNullOrWhiteSpace(SupplierPhoneNumber))
            {
                if (openDiaLog != null) MessageBox.Show("Các thông tin không được trống");
                return false;
            }
            if (!CheckField.CheckPhone(SupplierPhoneNumber))
            {
                if (SuppliersList != null)
                {
                    if (openDiaLog != null)     MessageBox.Show("Vui lòng nhập đúng định dạng số điện thoại!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);

                }
                return false;
            }
            if (EditedSupplier == null)
            {
                if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.TenNCC == SupplierName).Count() > 0)
                {
                    if (openDiaLog != null) MessageBox.Show("Tên nhà cung cấp không được trùng");
                    return false;
                }
                if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.SoDT == SupplierPhoneNumber).Count() > 0)
                {
                    if (openDiaLog != null) MessageBox.Show("Số điện thoại không được trùng");
                    return false;
                }
            }
            else
            {
                if (SupplierName != EditedSupplier.TenNCC)
                {
                    if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.TenNCC == SupplierName).Count() > 0)
                    {
                        if (openDiaLog != null)
                            MessageBox.Show("Tên nhà cung cấp không được trùng");
                        return false;
                    }
                }
                if (SupplierPhoneNumber != EditedSupplier.SoDT)
                {

                    if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.SoDT == SupplierPhoneNumber).Count() > 0)
                    {
                        if (openDiaLog != null)
                            MessageBox.Show("Số điện thoại không được trùng");
                        return false;
                    }
                }


            }
            return true;
        }

        public void ActionAddSupplier()
        {
            if (!CheckValidSupplier()) return;

            var newSup = new NhaCungCap()
            {
                TenNCC = SupplierName,
                DiaChi = SupplierAddress,
                SoDT = SupplierPhoneNumber,

            };

            DataProvider.Ins.DB.NhaCungCaps.Add(newSup);
            DataProvider.Ins.DB.SaveChanges();

            if (openDiaLog != null)
            {
                MessageBox.Show("Nhà cung cấp " + newSup.TenNCC + " được thêm thành công");
                SuppliersList.Add(newSup);
                openDiaLog.IsOpen = false;
            }
            supplierCode = DataProvider.Ins.DB.NhaCungCaps.Where(x => x.TenNCC == SupplierName).FirstOrDefault().MaNCC;


        }

        public void ActionEditSupplier()
        {
            if (!CheckValidSupplier()) return;


            var supplier = DataProvider.Ins.DB.NhaCungCaps.Where(x => x.MaNCC == EditedSupplier.MaNCC).SingleOrDefault();
            supplier.TenNCC = SupplierName;
            supplier.DiaChi = SupplierAddress;
            supplier.SoDT = SupplierPhoneNumber;
            DataProvider.Ins.DB.SaveChanges();
            if (openDiaLog != null)
            {
                MessageBox.Show("Nhà cung cấp " + supplier.TenNCC + " được sửa thành công");
                openDiaLog.IsOpen = false;
            }
        }

        bool ValidCustomerCheck()
        {

            if (EditedSupplier == null)
            {
                if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.TenNCC == SupplierName).Count() > 0)
                {
                    if (openDiaLog != null) MessageBox.Show("Tên nhà cung cấp không được trùng");
                    return false;
                }
                if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.SoDT == SupplierPhoneNumber).Count() > 0)
                {
                    if (openDiaLog != null) MessageBox.Show("Số điện thoại không được trùng");
                    return false;
                }
            }
            else
            {
                if (SupplierName != EditedSupplier.TenNCC)
                {
                    if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.TenNCC == SupplierName).Count() > 0)
                    {
                        if (openDiaLog != null)
                            MessageBox.Show("Tên nhà cung cấp không được trùng");
                        return false;
                    }
                }
                if (SupplierPhoneNumber != EditedSupplier.SoDT)
                {

                    if (DataProvider.Ins.DB.NhaCungCaps.Where(x => x.SoDT == SupplierPhoneNumber).Count() > 0)
                    {
                        if (openDiaLog != null)
                            MessageBox.Show("Số điện thoại không được trùng");
                        return false;
                    }
                }


            }
            return true;

            //return ((EditedProduct == null && DataProvider.Ins.DB.SanPhams.Where(x => x.TenSP == ProductName).Count() == 0) || ()) && ProductPrice > 0;

        }


        private void CheckCloseDiaLog()
        {

            if (MessageBox.Show("Những thay đổi của bạn sẽ không được lưu?", "",
                 MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {

                openDiaLog.IsOpen = false;

            }


        }
    }
}
