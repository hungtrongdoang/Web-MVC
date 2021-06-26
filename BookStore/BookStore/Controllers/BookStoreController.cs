using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;

namespace BookStore.Controllers
{
    public class BookStoreController : Controller
    {

        dbQLBansachDataContext data = new dbQLBansachDataContext();



        private List<SACH> Laysachmoi (int count)
        {
            return data.SACHes.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }

        // GET: BookStore
        public ActionResult Index()
        {
            var sachmoi = Laysachmoi(5);
            return View(sachmoi);
        }

        public ActionResult ChuDe()
        {
            var chude = from cd in data.CHUDEs select cd;
            return PartialView(chude);
        }

        public ActionResult NhaXuatBan()
        {
            var nhaxuatban = from cd in data.NHAXUATBANs select cd;
            return PartialView(nhaxuatban);
        }

        public ActionResult SPtheochude (int id)
        {
            var sach = from s in data.SACHes where s.MaCD == id select s;
            return View(sach);
        }
        public ActionResult SPtheoNXB(int id)
        {
            var sach = from s in data.SACHes where s.MaNXB == id select s;
            return View(sach);
        }
        public ActionResult Details(int id)
        {
            var sach = from s in data.SACHes
                       where s.Masach == id
                       select s;
            return View(sach.Single());
        }
    }
}