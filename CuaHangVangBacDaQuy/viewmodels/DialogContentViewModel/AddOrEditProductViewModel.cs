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
using System.Windows.Input;

namespace CuaHangVangBacDaQuy.viewmodels.DialogContentViewModel
{
    public class AddOrEditProductViewModel : BaseViewModel
    {
        private readonly ObservableCollection<SanPham> ProductList;
        private readonly ObservableCollection<ChiTietPhieuMua> ProductAddedList;

        private ObservableCollection<LoaiSanPham> _TypeProductList;
        public ObservableCollection<LoaiSanPham> TypeProductList { get => _TypeProductList; set { _TypeProductList = value; OnPropertyChanged(); } }
        private ObservableCollection<DonVi> _UnitList;
        public ObservableCollection<DonVi> UnitList { get => _UnitList; set { _UnitList = value; OnPropertyChanged(); } }

        private LoaiSanPham _SelectedTypeProduct;
        public LoaiSanPham SelectedTypeProduct { get => _SelectedTypeProduct; set { _SelectedTypeProduct = value; OnPropertyChanged(); } }
        private DonVi _SelectedUnit;
        public DonVi SelectedUnit { get => _SelectedUnit; set { _SelectedUnit = value; OnPropertyChanged(); } }

        private SanPham _EditedProduct;
        public SanPham EditedProduct
        {
            get => _EditedProduct;

            set
            {
                _EditedProduct = value;
                OnPropertyChanged();

                if (EditedProduct != null)
                {
                    ProductName = value.TenSP;
                    ProductPrice = value.DonGia.ToString();
                    SelectedTypeProduct = value.LoaiSanPham;
                    SelectedUnit = value.DonVi;
                }
            }
        }

        private readonly OpenDiaLog openDiaLog;

        private string _TilteView;
        public string TilteView { get => _TilteView; set { _TilteView = value; OnPropertyChanged(); } }


        private string _ProductName;
        public string ProductName
        {
            get => _ProductName;
            set
            {
                _ProductName = value; OnPropertyChanged();
            }
        }


        private string _ProductPrice = "0";
        public string ProductPrice
        {
            get => _ProductPrice;
            set
            {
                _ProductPrice = value; OnPropertyChanged();
            }
        }

        public string ProductCode;

        public ICommand SaveCommand { get; set; }
        public ICommand CancelCommand { get; set; }


        public AddOrEditProductViewModel()
        {
            TypeProductList = new ObservableCollection<LoaiSanPham>(DataProvider.Ins.DB.LoaiSanPhams);
            UnitList = new ObservableCollection<DonVi>(DataProvider.Ins.DB.DonVis);
            ProductList = new ObservableCollection<SanPham>(DataProvider.Ins.DB.SanPhams);
        }

        //constructor dùng cho thêm sản phẩm mới từ màn hình quản lý sản phẩm
        public AddOrEditProductViewModel(string tilteView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<SanPham> productsList)
        {

            TypeProductList = new ObservableCollection<LoaiSanPham>(DataProvider.Ins.DB.LoaiSanPhams);
            UnitList = new ObservableCollection<DonVi>(DataProvider.Ins.DB.DonVis);
            TilteView = tilteView;
            openDiaLog = isOpenDialog;
            ProductList = productsList;
            CancelCommand = new RelayCommand<AddOrEditProductUC>((p) => true, p => CheckCloseDiaLog());
            SaveCommand = new RelayCommand<AddOrEditProductUC>((p) => true, p => ActionAddProduct());



        }

        //constructor dùng cho chỉnh sủa sản phẩm mới từ màn hình quản lý sản phẩm
        public AddOrEditProductViewModel(string tilteView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<SanPham> productsList, ref SanPham editedProduct)
        {
            TypeProductList = new ObservableCollection<LoaiSanPham>(DataProvider.Ins.DB.LoaiSanPhams);
            UnitList = new ObservableCollection<DonVi>(DataProvider.Ins.DB.DonVis);

            TilteView = tilteView;
            openDiaLog = isOpenDialog;
            ProductList = productsList;
            EditedProduct = editedProduct;

            CancelCommand = new RelayCommand<AddOrEditCustomerUC>((p) => true, p => CheckCloseDiaLog());
            SaveCommand = new RelayCommand<AddOrEditCustomerUC>((p) => true, p => ActionEditProduct());

        }

        //constructor dùng cho thêm sản phẩm mới từ màn hình tạo đơn mua hàng mới(danh sách sản phẩm là list các sản phẩm được chọn để tạo đơn trong datagridview )
        public AddOrEditProductViewModel(string tilteView, ref OpenDiaLog isOpenDialog, ref ObservableCollection<ChiTietPhieuMua> productsAddedList)
        {

            TypeProductList = new ObservableCollection<LoaiSanPham>(DataProvider.Ins.DB.LoaiSanPhams);
            UnitList = new ObservableCollection<DonVi>(DataProvider.Ins.DB.DonVis);
            TilteView = tilteView;
            openDiaLog = isOpenDialog;
            ProductAddedList = productsAddedList;
            CancelCommand = new RelayCommand<AddOrEditProductUC>((p) => true, p => CheckCloseDiaLog());
            SaveCommand = new RelayCommand<AddOrEditProductUC>((p) => true, p => ActionAddProduct());

        }


        public bool CheckValidProduct()
        {
            if (string.IsNullOrWhiteSpace(ProductName) || string.IsNullOrWhiteSpace(ProductPrice) || SelectedTypeProduct == null || SelectedUnit == null)
            {
                if (openDiaLog != null) MessageBox.Show("Các thông tin không được để trống");
                return false;
            }

            
            if (EditedProduct == null)
            {
                if (DataProvider.Ins.DB.SanPhams.Where(x => x.TenSP == ProductName).Count() > 0)
                {
                    if (openDiaLog != null) MessageBox.Show("Tên sản phẩm không được trùng");
                    return false;
                }
            }
            else
            {
                if(ProductName != EditedProduct.TenSP)
                {
                    if (DataProvider.Ins.DB.SanPhams.Where(x => x.TenSP == ProductName).Count() > 0)
                    {
                        if (openDiaLog != null) MessageBox.Show("Tên sản phẩm không được trùng");
                        return false;
                    }
                }
                
            }

            if (!decimal.TryParse(ProductPrice, out decimal check))
            {
                if (openDiaLog != null)
                {
                    MessageBox.Show("Đơn giá không hợp lệ");
                }
                return false;
            }
            if (check <= 0)
            {
                if (openDiaLog != null) MessageBox.Show("Đơn giá phải lớn hơn 0");
                return false;
            }
            return true;

        }

        public void ActionAddProduct()
        {
            if ( !CheckValidProduct()) return;

            if(string.IsNullOrEmpty(ProductCode)) ProductCode = Guid.NewGuid().ToString();
            var newProduct = new SanPham()
            {
                MaSP = ProductCode,
                TenSP = ProductName,
                DonGia = decimal.Parse(ProductPrice),
                MaLoaiSP = SelectedTypeProduct.MaLoaiSP,
                MaDV = SelectedUnit.MaDV,

            };

            DataProvider.Ins.DB.SanPhams.Add(newProduct);
            DataProvider.Ins.DB.SaveChanges();

            //nếu constuctor được khởi tạo từ view quản lý sản phẩm
            if (ProductList != null)
            {
                ProductList.Add(newProduct);
            }

            //nếu constuctor được khởi tạo từ view tạo đơn mua hàng
            if (ProductAddedList != null)
            {

                ChiTietPhieuMua productAdded = new ChiTietPhieuMua()
                {
                    MaSP = newProduct.MaSP,
                    SanPham = newProduct,
                    SoLuong = 0
                };
                ProductAddedList.Add(productAdded);
            }
            if (openDiaLog != null)
            {
                MessageBox.Show("Sản phẩm "+ newProduct.TenSP + " được thêm thành công");
                openDiaLog.IsOpen = false;
            }

        }


        public void ActionEditProduct()
        {
            if (!CheckValidProduct()) return;


            var editedProduct = DataProvider.Ins.DB.SanPhams.Where(x => x.MaSP == EditedProduct.MaSP).SingleOrDefault();
            editedProduct.TenSP = ProductName;
            editedProduct.DonGia = decimal.Parse(ProductPrice);
            editedProduct.MaLoaiSP = SelectedTypeProduct.MaLoaiSP;
            editedProduct.MaDV = SelectedUnit.MaDV;

            DataProvider.Ins.DB.SaveChanges();
            EditedProduct.TenSP = ProductName;
            EditedProduct.DonGia = decimal.Parse(ProductPrice);
            EditedProduct.LoaiSanPham = SelectedTypeProduct;
            EditedProduct.DonVi = SelectedUnit;

            if (openDiaLog != null)
            {
                MessageBox.Show("Sản phẩm " + EditedProduct.TenSP + " được sửa thành công");
                openDiaLog.IsOpen = false;
            }
        }



        private void CheckCloseDiaLog()
        {

            if (MessageBox.Show("Những thay đổi của bạn sẽ không được lưu?", "",
                 MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {

                openDiaLog.IsOpen = false;

            }
            // IsOpenDialog = false;


        }
    }
}
