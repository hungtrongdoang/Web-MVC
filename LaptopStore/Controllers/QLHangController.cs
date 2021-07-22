using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
namespace LaptopStore.Controllers
{
    public class QLHangController : Controller
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

        public ActionResult HANG()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                var hang = from h in data.HANGs select h;
                return View(hang);
            }
        }

        public ActionResult Details(int id)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                HANG hang = data.HANGs.SingleOrDefault(n => n.MaHang == id);
                //data.CHITIETLAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                ViewBag.MaHang = hang.MaHang;
                if (hang == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View();
            }
        }
        [HttpGet]
        public ActionResult Create()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG");
                return View();
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(HANG hang, HttpPostedFileBase fileupload)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG");
                if (fileupload == null)
                {
                    ViewBag.Thongbao = "Vui lòng chọn  ảnh cho sản phẩm";
                    return View();
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var fileName = Path.GetFileName(fileupload.FileName);
                        var path = Path.Combine(Server.MapPath("~/logo"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        }
                        else
                        {
                            fileupload.SaveAs(path);
                        }
                        data.HANGs.InsertOnSubmit(hang);
                        data.SubmitChanges();
                        
                    }
                }
                return RedirectToAction("HANG","QLHang");
            }
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                var hang = from h in data.HANGs where h.MaHang == id select h;
                return View(hang.Single());
            }
        }

        [HttpPost, ActionName("Edit")]
        public ActionResult Update(int id)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                HANG hang = data.HANGs.SingleOrDefault(h => h.MaHang == id);
                UpdateModel(hang);
                data.SubmitChanges();
                return RedirectToAction("HANG","QLHang");
            }
        }

        [HttpGet]
        public ActionResult XoaHang(int id)
        {
            HANG hang = data.HANGs.SingleOrDefault(h => h.MaHang == id);
            //ViewBag.MaHang = hang.MaHang;
            //if (hang == null)
            //{
            //    Response.StatusCode = 404;
            //    return null;
            //}
            return View(hang);
        }

        [HttpPost, ActionName("XoaHang")]
        public ActionResult XacnhanXoaHang(int id)
        {
            HANG hang = data.HANGs.SingleOrDefault(h => h.MaHang == id);     
            data.HANGs.DeleteOnSubmit(hang);
            data.SubmitChanges();
            return RedirectToAction("HANG","QLHang");
        }
    }
}