using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Seafood_Website.Models;

namespace Seafood_Website.Controllers
{
    public class CartController : Controller
    {
        SeaFoodsEntities1 ctx = new SeaFoodsEntities1();
        // GET: Cart
        public ActionResult Cart()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DeleteProduct(int id)
        {
            Productdetail productdetail_db = ctx.Productdetails.Where(m => m.id == id).SingleOrDefault();
            ctx.Productdetails.Remove(productdetail_db);
            ctx.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}