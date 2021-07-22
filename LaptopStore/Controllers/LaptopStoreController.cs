using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaptopStore.Models;

using PagedList.Mvc;
using PagedList;

namespace LaptopStore.Controllers
{
    public class LaptopStoreController : Controller
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();
        // GET: LaptopStore
        public ActionResult Index(int ? page)
        {
            int pageSize = 5;
            int pageNum = (page ?? 1);
            var laptopmoi = LayLaptop();
            return View(laptopmoi.ToPagedList(pageNum,pageSize));
        }

        private List<LAPTOP> LayLaptop()
        {
            return data.LAPTOPs.OrderByDescending(a => a.MaLAPTOP).ToList();
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
        public ActionResult Thongso(int id)
        {
            var laptop = from s in data.LAPTOPs
                         where s.MaLAPTOP == id
                         select s; 
            return View(laptop.Single());
        }

        public ActionResult Search(string searchString)
        {

            var links = from l in data.LAPTOPs
                        select l;

            if (!String.IsNullOrEmpty(searchString))
            {
                links = links.Where(s => s.TenLAPTOP.Contains(searchString));
            }

            return View(links);
        }
        public ActionResult Dichvu()
        {
            return View();
        }
        public ActionResult Chinhsachbaohanh()
        {
            return View();
        }
        public ActionResult Chinhsachdoimoi()
        {
            return View();
        }
        public ActionResult Chinhsachvanchuyen()
        {
            return View();
        }
        public ActionResult Lienhe()
        {
            return View();
        }
    }

        
}