﻿using CuaHangVangBacDaQuy.models;
using CuaHangVangBacDaQuy.viewmodels.DialogContentViewModel;
using CuaHangVangBacDaQuy.views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Markup;



namespace CuaHangVangBacDaQuy.viewmodels
{
    public class ProductViewModel : BaseViewModel
    {
        #region Params
        private ObservableCollection<SanPham> _ProducstList;
        public ObservableCollection<SanPham> ProductsList { get => _ProducstList; set { _ProducstList = value; OnPropertyChanged(); } }
       
       
        private SanPham _SelectedProduct;
        public SanPham SelectedProduct
        {
            get => _SelectedProduct;
            set
            {
                _SelectedProduct = value;
                OnPropertyChanged();
  
            }
        }
     

        #region SearchBar
        private List<string> _searchTypes;
        public List<string> SearchTypes { get { return _searchTypes; } set { _searchTypes = value; OnPropertyChanged(); } }
        private string _selectedSearchType;
        public string SelectedSearchType { get { return _selectedSearchType; } set { _selectedSearchType = value; OnPropertyChanged(); } }

        private string _contentSearch;
        public string ContentSearch
        {
            get { return _contentSearch; }
            set
            {
                _contentSearch = value;
                OnPropertyChanged();
                //if (ContentSearch == "")
                //    Load(false);
            }
        }

        private OpenDiaLog _IsOpenProductDialog;
        public OpenDiaLog IsOpenProductDialog
        {
            get { return _IsOpenProductDialog; }
            set { _IsOpenProductDialog = value; OnPropertyChanged(); }
        }

        private AddProductViewModel _ContentAddProuduct;
        public AddProductViewModel ContentAddProduct
        {
            get => _ContentAddProuduct;
            set
            {
                _ContentAddProuduct = value;
                OnPropertyChanged();

            }
        }

        #endregion

        #endregion

        #region Commands
        public ICommand LoadedCommand { get; set; }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
   
        public ICommand DeleteCommand { get; set; }
        
        public ICommand SearchCommand { get; set; }
        #endregion

        public ProductViewModel()
        {
            IsOpenProductDialog = new OpenDiaLog() { IsOpen = false };
            SearchTypes = new List<string> { "Mã sản phẩm", "Tên sản phẩm", };
            SelectedSearchType = SearchTypes[1];
            ProductsList = new ObservableCollection<SanPham>(DataProvider.Ins.DB.SanPhams);
            LoadedCommand = new RelayCommand<ProductView>(p => true, p => Loaded(p));          
            AddCommand = new RelayCommand<CustomerView>((p) => true, p => ActionDiaLog("Add"));
            EditCommand = new RelayCommand<DataGridTemplateColumn>((p) => true, p => ActionDiaLog("Edit"));
            DeleteCommand = new RelayCommand<DataGridTemplateColumn>(p => true, p => DeleteProduct());
            SearchCommand = new RelayCommand<DataGridTemplateColumn>(p => true, p => Search());
        }

        private void Search()
        {
            switch (SelectedSearchType)
            {
                case "Mã sản phẩm":
                    ProductsList = new ObservableCollection<SanPham>(
                        DataProvider.Ins.DB.SanPhams.Where(
                            x => x.MaSP.ToString().Contains(ContentSearch)));
                    break;
                case "Tên sản phẩm":
                    ProductsList = new ObservableCollection<SanPham>(
                         DataProvider.Ins.DB.SanPhams.Where(
                             x => x.TenSP.ToString().Contains(ContentSearch)));
                    break;
                default:
                    break;
            }
        }

        public void Loaded(ProductView weddingHallUC)
        {

        }

        private void ActionDiaLog(string caseDiaLog)
        {
            IsOpenProductDialog.IsOpen = true;
            switch (caseDiaLog)
            {
                case "Add":
                    AddnewProduct();
                    break;

                case "Edit":
                    EditProduct();
                    break;
            }
        }

        public void AddnewProduct()
        {

            ContentAddProduct = new AddProductViewModel("Thêm sản phẩm mới", ref _IsOpenProductDialog, ref _ProducstList);
        }
        public void EditProduct()
        {
            ContentAddProduct = new AddProductViewModel("Chỉnh sửa thông tin sản phẩm", ref _IsOpenProductDialog, ref _ProducstList, ref _SelectedProduct);
        }
        public void DeleteProduct()
        {
            DataProvider.Ins.DB.SanPhams.Attach(SelectedProduct);
            DataProvider.Ins.DB.SanPhams.Remove(SelectedProduct);
            DataProvider.Ins.DB.SaveChanges();
            ProductsList = new ObservableCollection<SanPham>(DataProvider.Ins.DB.SanPhams);
        }
       
    }

}
