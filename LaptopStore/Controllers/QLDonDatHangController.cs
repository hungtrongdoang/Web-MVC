using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaptopStore.Models;
namespace LaptopStore.Controllers
{
    public class QLDonDatHangController : Controller
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();
        // GET: QLDonDatHang
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
        public ActionResult DON()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                var hang = from h in data.DONDATHANGs select h;
                return View(hang);
            }
        }
        [HttpGet]
        public ActionResult XoaDon(int id)
        {
            DONDATHANG hang = data.DONDATHANGs.SingleOrDefault(h => h.MaDonHang == id);
            //ViewBag.MaHang = hang.MaHang;
            //if (hang == null)
            //{
            //    Response.StatusCode = 404;
            //    return null;
            //}
            return View(hang);
        }

        [HttpPost, ActionName("XoaDon")]
        public ActionResult XacnhanXoaDon(int id)
        {
            DONDATHANG hang = data.DONDATHANGs.SingleOrDefault(h => h.MaDonHang == id);
            data.DONDATHANGs.DeleteOnSubmit(hang);
            data.SubmitChanges();
            return RedirectToAction("DON", "QLDonDatHang");
        }
    }
}