using Seafood_Website.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Seafood_Website.Models;

namespace Seafood_Website.Controllers
{
    public class AdminController : Controller
    {
        SeaFoodsEntities1 cxt = new SeaFoodsEntities1();    
        // GET: Admin

        public ActionResult Index()
        {
            //List<Catgory> catgories = new List<Catgory>()
            //{
            //    new Catgory() {id = 1,name = "ca nuc",img = "canuc.jpg",price = "200,000vnd"},
            //    new Catgory() {id = 2,name = "ca ba sa",img = "canuc.jpg",price = "150,000vnd"},
            //    new Catgory() {id = 3,name = "cua hoang de",img = "chd.jpg",price = "1700,000vnd"},
            //    new Catgory() {id = 4,name = "muc khong lo",img = "mucto.jpg",price = "1000,000vnd"},
            //    new Catgory() {id = 5,name = "ca muc nho",img = "mucnho.jpg",price = "200,000vnd"},
            //};
            //strong type
            //ViewData[""] = catgories;

            List<Productdetail> productdetails = cxt.Productdetails.ToList();
            cxt.SaveChanges();

            return View(/*catgories*/productdetails);
        }

        [HttpGet]
        public ActionResult CreateProduct()
        {
            Productdetail productdetail = new Productdetail();
            return View(productdetail);
        }
        [HttpPost]
        public ActionResult CreateProduct(Productdetail productdetail)
        {
            if (ModelState.IsValid)
            {
                //insert into table productdetail
                cxt.Productdetails.Add(productdetail);

                cxt.SaveChanges(); //save to database

                return RedirectToAction("Index");
            }

            return View(productdetail);
        }

        [HttpGet]
        public ActionResult EditProduct(int id) //Edit product
        {
            Productdetail productdetail = cxt.Productdetails.Where(m => m.id == id).SingleOrDefault();

            return View(productdetail);
        }
        [HttpPost]
        public ActionResult EditProduct(Productdetail productdetail) //Edit product
        {
            if (ModelState.IsValid)
            {
                Productdetail productdetail_db = cxt.Productdetails.Where(m => m.id == productdetail.id).SingleOrDefault();

                productdetail_db.name = productdetail.name;

                productdetail_db.price = productdetail.price;

                productdetail_db.size = productdetail.size;

                productdetail_db.imgURL = productdetail.imgURL;

                productdetail_db.description = productdetail.description;

                cxt.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(productdetail);

        }

        [HttpGet]
        public ActionResult DeleteProduct(int id)
        {
            Productdetail productdetail_db = cxt.Productdetails.Where(m => m.id == id).SingleOrDefault();
            cxt.Productdetails.Remove(productdetail_db);
            cxt.SaveChanges();

            return RedirectToAction("Index");
        }


    }
}