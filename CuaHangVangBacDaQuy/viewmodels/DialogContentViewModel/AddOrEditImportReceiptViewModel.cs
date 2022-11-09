﻿using CuaHangVangBacDaQuy.models;
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

namespace CuaHangVangBacDaQuy.viewmodels.DialogContentViewModel
{
    public class AddOrEditImportReceiptViewModel:BaseViewModel
    {
        #region
        // các biến cho view chính này

        private ObservableCollection<PhieuMua> _PhieuMuaList;
        public ObservableCollection<PhieuMua> PhieuMuaList
        {
            get => _PhieuMuaList;
            set
            {

                _PhieuMuaList = value;
                OnPropertyChanged();
            }
        }
       
        private readonly OpenDiaLog OpenThisDiaLog;  //tham chiếu để tắt bật dialog có view này
        private string _TitleView;
        public string TitleView { get =>_TitleView; set { _TitleView = value; OnPropertyChanged(); } }

        public ICommand SaveCommand { get; set; }
        public ICommand CancelCommand { get; set; }

        //Các biến cho việc chọn nhà cung cấp

        #region 

        private ObservableCollection<NhaCungCap> _SelectedSuppliersList;
        public ObservableCollection<NhaCungCap> SelectedSuppliersList
        {
            get => _SelectedSuppliersList;
            set { _SelectedSuppliersList = value; OnPropertyChanged(); }
        }


        private NhaCungCap _SelectedSupplier;
        public NhaCungCap SelectedSupplier
        {
            get
            {
                return _SelectedSupplier;
            }
            set
            {
                _SelectedSupplier = value;
                OnPropertyChanged();


                if (value != null && !SelectedSuppliersList.Contains(value))
                {
                    SelectedSuppliersList?.Clear();
                    SelectedSuppliersList.Add(value);

                }


            }
        }

        private AddOrEditSupplierViewModel _ContentAddSupplier;
        public AddOrEditSupplierViewModel ContentAddSupplier
        {
            get => _ContentAddSupplier;
            set
            {
                _ContentAddSupplier = value;
                OnPropertyChanged();

            }
        }



        private OpenDiaLog _IsOpenAddSupplierDialog;
        public OpenDiaLog IsOpenAddSupplierDialog
        {
            get { return _IsOpenAddSupplierDialog; }
            set { _IsOpenAddSupplierDialog = value; OnPropertyChanged(); }
        }

        public ICommand AddSupplierCommand { get; set; }
        public ICommand RemoveSelectedSupplierCommand { get; set; }

        #endregion


        //Các biến cho việc chọn sản phẩm

        #region 

        private ObservableCollection<ChiTietPhieuMua> _SelectedProductList;
        public ObservableCollection<ChiTietPhieuMua> SelectedProductList
        {
            get => _SelectedProductList;
            set
            {

                _SelectedProductList = value;
                OnPropertyChanged();
            }
        }

        private SanPham _SelectedProductItem;
        public SanPham SelectedProductItem
        {
            get
            {
                return _SelectedProductItem;
            }
            set
            {
                _SelectedProductItem = value;

                OnPropertyChanged();

                if (SelectedProductItem != null)
                {


                    if (SelectedProductList.Where(x => x.SanPham == SelectedProductItem).Count() == 0)
                    {
                        ChiTietPhieuMua productAdded = new ChiTietPhieuMua()
                        {
                            MaSP = SelectedProductItem.MaSP,
                            SanPham = SelectedProductItem,
                            SoLuong = 0
                        };

                        SelectedProductList.Add(productAdded);
                        SelectedProductItem = null;


                    }


                }


            }
        }



        private ChiTietPhieuMua _SelectedProductDataGrid;
        public ChiTietPhieuMua SelectedProductDataGrid
        {
            get
            {
                return _SelectedProductDataGrid;
            }
            set
            {
                _SelectedProductDataGrid = value;
                OnPropertyChanged();

            }
        }


        private OpenDiaLog _IsOpenAddProductDialog;
        public OpenDiaLog IsOpenAddProductDialog
        {
            get { return _IsOpenAddProductDialog; }
            set { _IsOpenAddProductDialog = value; OnPropertyChanged(); }
        }


        private AddOrEditProductViewModel _ContentAddProduct;
        public AddOrEditProductViewModel ContentAddProduct
        {
            get => _ContentAddProduct;
            set
            {
                _ContentAddProduct = value;
                OnPropertyChanged();

            }
        }


        private decimal? _TotalMoney;
        public decimal? TotalMoney
        {
            get => _TotalMoney;

            set
            {
                _TotalMoney = value;
                OnPropertyChanged();
            }
        }

        public ICommand AddProductCommand { get; set; }
        public ICommand RemoveSelectedProductCommand { get; set; }
        public ICommand CaculateTotalMoneyCommand { get; set; } // dùng để tính lại tổng tiền hóa đơn khi nhập số lượng sản phẩm


        #endregion





        #endregion

        //constructor cho việc tạo phiếu mua hàng mới 
        public AddOrEditImportReceiptViewModel()
        {
            InitializeValueToSelect();

        }

        public AddOrEditImportReceiptViewModel(string titleView, ref OpenDiaLog openDiaLog, ref ObservableCollection<PhieuMua> phieuMuaList)
        {
            InitializeValueToSelect();
            TitleView = titleView;
            OpenThisDiaLog = openDiaLog;
            PhieuMuaList = phieuMuaList;
            SaveCommand = new RelayCommand<AddOrEditImportReceiptUC>((p) => true, p =>AddNewImportReceipt());
            CancelCommand = new RelayCommand<AddOrEditImportReceiptUC>((p) => true, p => CheckCloseDiaLog());
           
           

        }
        // ///
        #region funtion for Select Supplier and product
        private void InitializeValueToSelect()
        {
            //for select supplier
            SelectedSuppliersList = new ObservableCollection<NhaCungCap>();
            IsOpenAddSupplierDialog = new OpenDiaLog() { IsOpen = false };
            AddSupplierCommand = new RelayCommand<MakeOrderViewModel>((p) => true, p => { OpenDialogAddSupplier(); });
            RemoveSelectedSupplierCommand = new RelayCommand<MakeOrderViewModel>((p) => true, p => { SelectedSuppliersList.Clear(); });

            //for select product
            SelectedProductList = new ObservableCollection<ChiTietPhieuMua>();
            IsOpenAddProductDialog = new OpenDiaLog() { IsOpen = false };
            AddProductCommand = new RelayCommand<MakeOrderViewModel>(p => true, p => { OpenDialogAddProduct(); });
            RemoveSelectedProductCommand = new RelayCommand<DataGridTemplateColumn>(p => true, p => RemoveSelectedProduct());
            CaculateTotalMoneyCommand = new RelayCommand<DataGridTemplateColumn>(p => true, p => CaculateTotalMoney());
        }

        public void OpenDialogAddSupplier()
        {

            ContentAddSupplier = new AddOrEditSupplierViewModel("Thêm nhà cung cấp mới", ref _IsOpenAddSupplierDialog, ref _SelectedSuppliersList);
            IsOpenAddSupplierDialog.IsOpen = true;
        }

        public void OpenDialogAddProduct()
        {

            ContentAddProduct = new AddOrEditProductViewModel("Thêm sản phẩm mới", ref _IsOpenAddProductDialog, ref _SelectedProductList);
            IsOpenAddProductDialog.IsOpen = true;
        }

        void CaculateTotalMoney()
        {
            //(bool)value ? parameter : Binding.DoNothin

            TotalMoney = (TotalMoney == null) ? 0 : SelectedProductList.Sum(p => p.SoLuong * p.SanPham.DonGia);

        }

        void RemoveSelectedProduct()
        {
            if (SelectedProductDataGrid != null)
            {
                SelectedProductList.Remove(SelectedProductDataGrid);
                CaculateTotalMoney();
            }

        }
        #endregion


        #region Funtion for creating or editing the Receipt


        private void AddNewImportReceipt()
        {
            if (!CheckValidFieldInDialog()) return;
            

        }

        private bool CheckValidFieldInDialog()
        {
            if(SelectedSuppliersList == null || SelectedSuppliersList.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn nhà cung cấp!", "", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            } 
            if(SelectedProductList != null || SelectedSuppliersList.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn sản phẩm nhập kho!", "", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }
            return true;
        }

        private void CheckCloseDiaLog()
        {

            if (MessageBox.Show("Những thay đổi của bạn sẽ không được lưu?", "",
                 MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {

                OpenThisDiaLog.IsOpen = false;

            }


        }
        #endregion



    }
}