using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaptopStore.Models;

namespace LaptopStore.Controllers
{
    public class LaptopStoreController : Controller
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();
        // GET: LaptopStore
        public ActionResult Index()
        {
            var laptopmoi = LayLaptopmoi(6);
            return View(laptopmoi);
        }

        private List<LAPTOP> LayLaptopmoi(int count)
        {
            return data.LAPTOPs.OrderByDescending(a => a.MaLAPTOP).Take(count).ToList();
        }
        public ActionResult Hang()
        {
            var hang = from cd in data.HANGs select cd;
            return PartialView(hang);
        }
        public ActionResult NhuCau()
        {
            var nhucau = from cd in data.NHUCAUs select cd;
            return PartialView(nhucau);
        }
        public ActionResult SPtheohang(int id)
        {
            var laptop = from s in data.LAPTOPs where s.MaHang == id select s;
            return View(laptop);
        }
        public ActionResult SPtheonhucau(int id)
        {
            var laptop = from s in data.LAPTOPs where s.MaNhucau == id select s;
            return View(laptop);
        }
        public ActionResult Details(int id)
        {
            var laptop = from s in data.LAPTOPs
                       where s.MaLAPTOP == id
                       select s;
            return View(laptop.Single());
        }
    }
}