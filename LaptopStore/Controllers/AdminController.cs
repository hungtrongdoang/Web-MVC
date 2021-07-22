using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaptopStore.Models;
using PagedList;
using PagedList.Mvc;


namespace LaptopStore.Controllers
{
    public class AdminController : Controller
    {
        dbQLLaptopStoreDataContext data = new dbQLLaptopStoreDataContext();
        // GET: Admin
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

        public ActionResult Laptop(int? page)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                int pageNum = (page ?? 1);
                int pagesize = 8;
                return View(data.LAPTOPs.ToList().OrderBy(n => n.MaLAPTOP).ToPagedList(pageNum, pagesize));
            }
        }


        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                Admin ad = data.Admins.SingleOrDefault(n => n.UserAdmin == tendn && n.PassAdmin == matkhau);
                if (ad != null)
                {
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        [HttpGet]
        public ActionResult ThemLaptop()
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG");
                ViewBag.MaNhuCau = new SelectList(data.NHUCAUs.ToList().OrderBy(n => n.TenNhucau), "MaNhuCau", "TenNhuCau");
                return View();
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemLaptop(LAPTOP laptop, HttpPostedFileBase fileupload)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG");
                ViewBag.MaHang = new SelectList(data.NHUCAUs.ToList().OrderBy(n => n.TenNhucau), "MaNhuCau", "TenNhuCau");
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
                        var path = Path.Combine(Server.MapPath("~/SAN_PHAM"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                        }
                        else
                        {
                            fileupload.SaveAs(path);
                        }
                        laptop.Anh = fileName;
                        data.LAPTOPs.InsertOnSubmit(laptop);
                        data.SubmitChanges();
                    }
                    return RedirectToAction("Laptop");
                }
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
                LAPTOP laptop = data.LAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                //data.CHITIETLAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                ViewBag.MaLAPTOP = laptop.MaLAPTOP;
                if (laptop == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(laptop);
            }
        }

        [HttpGet]
        public ActionResult XoaLaptop(int id)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                LAPTOP laptop = data.LAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                ViewBag.MaLAPTOP = laptop.MaLAPTOP;
                if (laptop == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                return View(laptop);
            }
        }

        [HttpPost, ActionName("XoaLaptop")]
        public ActionResult XacnhanXoa(int id)
        {
            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                LAPTOP laptop = data.LAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                ViewBag.MaLAPTOP = laptop.MaLAPTOP;
                var dondathang = from CHITIETDONHANG in data.CHITIETDONHANGs
                                 where CHITIETDONHANG.MaLAPTOP == id
                                 select CHITIETDONHANG;
                foreach (var item in dondathang)
                {
                    data.CHITIETDONHANGs.DeleteOnSubmit(item);
                }
                data.LAPTOPs.DeleteOnSubmit(laptop);
                data.SubmitChanges();
                return RedirectToAction("Laptop");
            }
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            LAPTOP laptop = data.LAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
            ViewBag.MaLAPTOP = laptop.MaLAPTOP;
            if (laptop == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG", laptop.MaHang);
            ViewBag.MaNhuCau = new SelectList(data.NHUCAUs.ToList().OrderBy(n => n.TenNhucau), "MaNhuCau", "TenNhucau", laptop.MaNhucau);
            return View(laptop);
        }

        [HttpPost, ActionName("Edit")]
        [ValidateInput(false)]
        public ActionResult Update(int id, HttpPostedFileBase fileupload)
        {
            //ViewBag.MaHang = new SelectList(data.HANGs.ToList().OrderBy(n => n.TenHANG), "MaHang", "TenHANG");
            //ViewBag.MaNhuCau = new SelectList(data.NHUCAUs.ToList().OrderBy(n => n.TenNhucau), "MaNhuCau", "TenNhucau");
            //if (fileupload == null)
            //{
            //    ViewBag.Thongbao = "Vui lòng chọn ảnh cho sản phẩm";
            //    return View();
            //}
            //else
            //{
            //    if (ModelState.IsValid)
            //    {
            //        var fileName = Path.GetFileName(fileupload.FileName);
            //        var path = Path.Combine(Server.MapPath("~/SAN_PHAM"), fileName);
            //        if (System.IO.File.Exists(path))
            //        {
            //            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
            //        }
            //        else
            //        {
            //            fileupload.SaveAs(path);
            //        }
            //        laptop.Anh = fileName;                    
            //        UpdateModel(laptop);
            //        data.SubmitChanges();
            //    }
            //    return RedirectToAction("Laptop");
            //}

            if (Session["Taikhoanadmin"] == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                //if (fileupload == null)
                //{
                //    ViewBag.Thongbao = "Vui lòng chọn ảnh cho sản phẩm";
                //    return View();
                //}
                //else
                //{
                //    if (ModelState.IsValid)
                //    {
                //        var fileName = Path.GetFileName(fileupload.FileName);
                //        var path = Path.Combine(Server.MapPath("~/SAN_PHAM/"), fileName);
                //        if (System.IO.File.Exists(path))
                //        {
                //            ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                //        }
                //        else
                //        {
                //            fileupload.SaveAs(path);
                //        }
                //        laptop.Anh = fileName;
                //        UpdateModel(laptop);
                //        data.SubmitChanges();
                //    }

                LAPTOP laptop = data.LAPTOPs.SingleOrDefault(n => n.MaLAPTOP == id);
                UpdateModel(laptop);
                data.SubmitChanges();
                return RedirectToAction("Laptop");
            }
           
        }

        }

    }
