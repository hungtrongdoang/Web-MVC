using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaptopStore.Models
{
    public class Giohang
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();


        public int iMaLaptop { set; get; }

        public string sTenLaptop { set; get; }

        public string sAnh { set; get; }

        public double dDonggia { set; get; }

        public int iSoluong { set; get; }

        public double dThanhtien
        {
            get { return iSoluong * dDonggia; }
        }

        public Giohang(int MaLaptop)
        {
            iMaLaptop = MaLaptop;
            LAPTOP laptop = data.LAPTOPs.Single(n => n.MaLAPTOP == iMaLaptop);
            sTenLaptop = laptop.TenLAPTOP;
            sAnh = laptop.Anh;
            dDonggia = double.Parse(laptop.Giaban.ToString());
            iSoluong = 1;

        }


       


    }
}