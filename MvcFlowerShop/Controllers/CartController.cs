using MvcFlowerShop.Models;
using MvcFlowerShop.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcFlowerShop.Controllers
{
    public class CartController : Controller
    {
        private IProductRepository productRepository = new ProductRepository();

        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult Buy(int id)
        {
            if (Session["cart"] == null)
            {
                List<Item> cart = new List<Item>();
                cart.Add(new Models.Item()
                {
                    Product = productRepository.Find(id),
                    Quantity = 1
                });
                Session["cart"] = cart;
            }
            else
            {
                List<Item> cart = (List<Item>)Session["cart"];
                int index = isExists(id);
                if (index == -1)
                {
                    cart.Add(new Item()
                    {
                        Product = productRepository.Find(id),
                        Quantity = 1
                    });
                }
                else
                {
                    cart[index].Quantity = cart[index].Quantity + 1;
                }             
                Session["cart"] = cart;
            }
            return View("Index");
        }

        private int isExists(int id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if(cart[i].Product.Id == id)
                {
                    return i;
                }
            }
            return -1;
        }

        public ActionResult Delete(int id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            cart.RemoveAt(id);
            Session["cart"] = cart;
            return View("Index");
        }
    }
}