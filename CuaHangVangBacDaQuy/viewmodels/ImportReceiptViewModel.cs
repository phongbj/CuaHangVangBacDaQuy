﻿using CuaHangVangBacDaQuy.models;
using CuaHangVangBacDaQuy.viewmodels.Converter;
using CuaHangVangBacDaQuy.viewmodels.DialogContentViewModel;
using CuaHangVangBacDaQuy.views;
using CuaHangVangBacDaQuy.views.userControlDialog;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace CuaHangVangBacDaQuy.viewmodels
{
    public class ImportReceiptViewModel : BaseViewModel
    {

        //Các biến cho thao tác trên view này
        #region các biến cho phiếu mua hàng 


        private ObservableCollection<PhieuMua> _ImportReceiptsList;
        public ObservableCollection<PhieuMua> ImportReceiptsList
        {
            get => _ImportReceiptsList;
            set
            {
                _ImportReceiptsList = value;
                OnPropertyChanged();
            }
        }

        private PhieuMua _SelectedImportReceipt;
        public PhieuMua SelectedImportReceipt
        {
            get => _SelectedImportReceipt;
            set
            {
                _SelectedImportReceipt = value;
                OnPropertyChanged();
               
            }
        }
        private string _contentSearch;
        public string ContentSearch
        {
            get { return _contentSearch; }
            set
            {
                _contentSearch = value;
                OnPropertyChanged();
                if (ContentSearch == null)
                    _contentSearch = "";
            }
        }
        private string _selectedSearchType;
        public string SelectedSearchType { get { return _selectedSearchType; } set { _selectedSearchType = value; OnPropertyChanged(); } }

        private List<string> _searchTypes;
        public List<string> SearchTypes { get { return _searchTypes; } set { _searchTypes = value; OnPropertyChanged(); } }


        private AddOrEditImportReceiptUC _addOrEditImportReceiptUC;
        public AddOrEditImportReceiptUC addOrEditImportReceiptUC { get => _addOrEditImportReceiptUC; set { _addOrEditImportReceiptUC = value; OnPropertyChanged(); } }

        private AddOrEditImportReceiptViewModel _ContentAddOrEditImportReceipt;
        public AddOrEditImportReceiptViewModel ContentAddOrEditImportReceipt
        {
            get => _ContentAddOrEditImportReceipt;
            set  {
                _ContentAddOrEditImportReceipt = value;
                OnPropertyChanged();
            }
        }


        private OpenDiaLog _IsOpenMakeReceiptDialog;
        public OpenDiaLog IsOpenMakeReceiptDialog
        {
            get { return _IsOpenMakeReceiptDialog; }
            set { _IsOpenMakeReceiptDialog = value; OnPropertyChanged(); }
        }



        public ICommand AddImportReceiptCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand SearchCommand { get; set; }
        #endregion

        public ImportReceiptViewModel()
        {

            
           IsOpenMakeReceiptDialog = new OpenDiaLog() { IsOpen = false };
            ImportReceiptsList = new ObservableCollection<PhieuMua>(DataProvider.Ins.DB.PhieuMuas);
            AddImportReceiptCommand = new RelayCommand<ImportReceiptView>((p) => true, p => ActionDiaLog("Add"));
            SearchTypes = new List<string> { "Mã phiếu", "Nhà cung cấp", };
            SelectedSearchType = SearchTypes[1];
            EditCommand = new RelayCommand<DataGridTemplateColumn>((p) => true, p => ActionDiaLog("Edit"));
            DeleteCommand = new RelayCommand<DataGridTemplateColumn>((p) => true, p => DeleteImportReceipt());
            SearchCommand = new RelayCommand<DataGridTemplateColumn>(p => true, p => Search());

        }

        private void ActionDiaLog(string caseDiaLog)
        {
            IsOpenMakeReceiptDialog.IsOpen = true;
            switch (caseDiaLog)
            {
                case "Add":
                    AddNewImportReceipt();
                    break;

                case "Edit":
                    EditImportReceipt();
                    break;
            }
        }

        private void AddNewImportReceipt()
        {
            ContentAddOrEditImportReceipt = new AddOrEditImportReceiptViewModel("Đơn nhập hàng mới", ref _IsOpenMakeReceiptDialog, ref _ImportReceiptsList);
            
        }

        private void EditImportReceipt()
        {
            ContentAddOrEditImportReceipt = new AddOrEditImportReceiptViewModel("Chỉnh sửa đơn mua hàng", ref _IsOpenMakeReceiptDialog, ref _ImportReceiptsList, ref _SelectedImportReceipt);
            
        }
        public bool isTest;
        public void DeleteImportReceipt()
        {
            

            if(IsOpenMakeReceiptDialog != null)
            {
                if (!isTest) {
                    if (MessageBox.Show("Bạn có chắc chắc muốn xóa phiếu mua " + SelectedImportReceipt.MaPhieu + " không?", "", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.No)
                    {
                        return;
                    }
                }
                
            }
            ObservableCollection<ChiTietPhieuMua> deleteChiTietPhieuMuas = new ObservableCollection<ChiTietPhieuMua>(DataProvider.Ins.DB.ChiTietPhieuMuas.Where(x=> x.MaPhieu == SelectedImportReceipt.MaPhieu));
            foreach (ChiTietPhieuMua ctphieu in deleteChiTietPhieuMuas)
            {
               
                if(ctphieu.SoLuong > CaculateInventoryConverter.CaculateInventory(ctphieu.SanPham.MaSP))
                {
                    MessageBox.Show("Không thể xóa phiếu mua");
                    return;
                }
            }

            foreach (ChiTietPhieuMua ctphieu in deleteChiTietPhieuMuas)
            {
                DataProvider.Ins.DB.ChiTietPhieuMuas.Remove(ctphieu);
                DataProvider.Ins.DB.SaveChanges();
            }
            DataProvider.Ins.DB.PhieuMuas.Remove(SelectedImportReceipt);
            DataProvider.Ins.DB.SaveChanges();
            ImportReceiptsList.Remove(SelectedImportReceipt);
            //Thread.Sleep(1000);
            //ImportReceiptsList = new ObservableCollection<PhieuMua>(DataProvider.Ins.DB.PhieuMuas);
        }

        public bool CheckInventory()
        {

            return true;
        }
        public void Search()
        {
            switch (SelectedSearchType)
            {
                case "Mã phiếu":
                    ImportReceiptsList = new ObservableCollection<PhieuMua>(
                        DataProvider.Ins.DB.PhieuMuas.Where(
                            x => x.MaPhieu.ToString().Contains(ContentSearch)));
                    break;
                case "Nhà cung cấp":
                    ImportReceiptsList = new ObservableCollection<PhieuMua>(
                         DataProvider.Ins.DB.PhieuMuas.Where(
                             x => x.NhaCungCap.TenNCC.ToString().Contains(ContentSearch)));
                    break;
                default:
                    break;
            }
        }


    }
}
