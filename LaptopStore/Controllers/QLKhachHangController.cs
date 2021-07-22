using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaptopStore.Models;
using System.IO;
namespace LaptopStore.Controllers
{
    public class QLKhachHangController : Controller
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();

        // GET: QLHang
        public ActionResult Index()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                return View();
            }
        }

        public ActionResult KHACHHANG()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                var khachhang = from h in data.KHACHHANGs select h;
                return View(khachhang);
            }
        }


       

       

       

        
    }
}
