using Seafood_Website.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Seafood_Website.Controllers
{
    public class HomeController : Controller
    {
        SeaFoodsEntities1 cxt = new SeaFoodsEntities1();

        public ActionResult Index()
        {
            List<Productdetail> productdetails = cxt.Productdetails.ToList();

            return View(productdetails);
        }

    }
}