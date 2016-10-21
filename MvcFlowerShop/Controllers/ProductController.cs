using MvcFlowerShop.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcFlowerShop.Controllers
{
    public class ProductController : Controller
    {
        private ICategoryRepository categoryRepository = new CategoryRepository();

        public ActionResult Category(int id)
        {
            var category = categoryRepository.Find(id);
            ViewBag.category = category;
            ViewBag.products = category.Products.ToList();
            return View("Category");
        }

        public ActionResult Specials()
        {
            return View("Specials");
        }

        public ActionResult Details()
        {
            return View("Details");
        }
    }
}