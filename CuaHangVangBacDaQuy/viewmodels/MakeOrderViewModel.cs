﻿using CuaHangVangBacDaQuy.models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;


namespace CuaHangVangBacDaQuy.viewmodels
{
    public class MakeOrderViewModel: BaseViewModel
    {
        #region

        private ObservableCollection<KhachHang> _CustomerList;
        public ObservableCollection<KhachHang> CustomerList
        {
            get => _CustomerList;
            set { _CustomerList = value; OnPropertyChanged(); }
        }

        private bool _IsOpenAddCustomerDialog;
        public bool IsOpenAddCustomerDialog
        {
            get { return _IsOpenAddCustomerDialog; }
            set { _IsOpenAddCustomerDialog = value; OnPropertyChanged(); }
        }

        
        private string _TitleDiaLog;
        public string TitleDiaLog
        {
            get { return _TitleDiaLog; }
            set { _TitleDiaLog = value; OnPropertyChanged(); }
        }



        private string _CustomerName;
        public string CustomerName
        {
            get => _CustomerName;
            set
            {
                _CustomerName = value; OnPropertyChanged();
            }
        }

        //private string _FirstName;
        //public string FirstName { get => _FirstName; set { _FirstName = value; OnPropertyChanged(); } }

        //private string _LastName;
        //public string LastName { get => _LastName; set { _LastName = value; OnPropertyChanged(); } }



        private string _Gender;
        public string Gender
        {
            get => _Gender;
            set
            {
                _Gender = value; OnPropertyChanged();
            }
            
        }


        private string _Address;
        public string Address { get => _Address; set { _Address = value; OnPropertyChanged(); } }

        private string _PhoneNumber;
        public string PhoneNumber { get => _PhoneNumber; set { _PhoneNumber = value; OnPropertyChanged(); } }
     
        private KhachHang _SelectedItem;
        public KhachHang SelectedItem
        {
            get => _SelectedItem;
            set
            {

                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    CustomerName = SelectedItem.TenKH;
                    Gender = SelectedItem.GioiTinh;
                    Address = SelectedItem.DiaChi;
                    PhoneNumber = SelectedItem.SoDT;

                }

            }
        }


        public ICommand SaveAddCommand { get; set; }
       // public ICommand EditCommand { get; set; }
        public ICommand AddCustomerCommand { get; set; }

        private ObservableCollection<String> _testList;
        public ObservableCollection<String> testList { get => _testList; set { _testList = value; OnPropertyChanged(); } }

        #endregion

        public MakeOrderViewModel()
        {

            CustomerList = new ObservableCollection<KhachHang>(DataProvider.Ins.DB.KhachHangs);
            testList = new ObservableCollection<string>(new string[] { "123", "321", "1256", "4343", "1567" });
            AddCustomerCommand = new RelayCommand<MakeOrderViewModel>((p) => true, p => { MessageBox.Show(CustomerList.Count().ToString()); TitleDiaLog = "Thêm khách hàng"; SelectedItem = new KhachHang(); IsOpenAddCustomerDialog = true; });

          
            SaveAddCommand = new RelayCommand<MakeOrderViewModel>((p) =>
            {


                if (!checkData()) return false;
                var phone = DataProvider.Ins.DB.KhachHangs.Where(x => x.SoDT == PhoneNumber);
                return true;
            }, p => { actionAddCustomer();  });

            //EditCommand = new RelayCommand<DataGridTemplateColumn>((p) => true, p => {

            //    TitleDiaLog = "Sửa đổi thông tin khách hàng";
            //    IsOpenAddCustomerDialog = true;

            //});

        }

        public void actionAddCustomer()
        {

            var newCus = new KhachHang()
            {
                TenKH = CustomerName,
                GioiTinh = Gender,
                DiaChi = Address,
                SoDT = PhoneNumber,
                NgayDK = System.DateTime.Today

            };
            DataProvider.Ins.DB.KhachHangs.Add(newCus);
            DataProvider.Ins.DB.SaveChanges();
            IsOpenAddCustomerDialog = false;

        }


        bool checkData()
        {
            if (string.IsNullOrEmpty(CustomerName) || string.IsNullOrEmpty(Gender) || string.IsNullOrEmpty(Address) || string.IsNullOrEmpty(PhoneNumber))
            {
                return false;
            }
            return true;
        }


    }
}
