using Seafood_Website.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Seafood_Website.Controllers
{
    public class CollectionsController : Controller
    {
        SeaFoodsEntities1 ctx = new SeaFoodsEntities1();

        // GET: Collections
        public ActionResult Search(int id)
        {
            //2.query
            List<Productdetail> productdetails = ctx.Productdetails.Where(p => p.categoryID == id).ToList();


            return View(productdetails);
        }


        public ActionResult Productdetail(int id) 
        {
            Productdetail details = ctx.Productdetails.Where(p => p.id == id).SingleOrDefault();

            //List<Productdetail> productdetails = ctx.Productdetails.Take(4).ToList();

            ItemDetailModel model = new ItemDetailModel()
            {
                PDetail = details,
                Quantily = 1,
            };

            //ViewBag.detail = details;

            return View(model);
        }



        [HttpPost]
        public ActionResult AddtoCart(ItemDetailModel model)
        {
            //check if the client has the session 
            var sessionID = HttpContext.Session.SessionID;
            ViewBag.SessionID = sessionID;

            ShoppingCart cart = (ShoppingCart) HttpContext.Session["shoppingcart"];

            if (cart == null) 
            {
                //cart == null, the product will be added to the cart
                cart = new ShoppingCart();
                cart.AddtoCart(model); // push product to cart
                HttpContext.Session.Add("shoppingcart",cart); // save on session
            }
            else
            {
                //if have product in cart don't NULL
                cart.AddtoCart(model);
                HttpContext.Session.Add("shoppingcart", cart); // save on session
            }

            //send list cart in the View
           List<ItemDetailModel> items = cart.getAllItems();
            //ViewBag.Shopping = items;

            ViewBag.Total = cart.getTotal();

            ViewBag.QL = cart.getQuatily();

            return View("Cart",items);
        }


    }
}