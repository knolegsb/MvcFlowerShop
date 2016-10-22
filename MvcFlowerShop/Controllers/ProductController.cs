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
        private IProductRepository productRepository = new ProductRepository();

        public ActionResult Category(int id)
        {
            var category = categoryRepository.Find(id);
            ViewBag.category = category;
            ViewBag.products = category.Products.ToList();
            return View("Category");
        }

        public ActionResult Latest()
        {
            ViewBag.products = productRepository.LatestProducts();
            return View("Latest");
        }

        public ActionResult Specials()
        {
            ViewBag.products = productRepository.SpecialProducts();
            return View("Specials");
        }

        public ActionResult Details(int id)
        {
            ViewBag.product = productRepository.Find(id);
            ViewBag.relatedProducts = productRepository.RelatedProducts(productRepository.Find(id), 6);
            return View("Details");
        }
    }
}