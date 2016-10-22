using MvcFlowerShop.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcFlowerShop.Controllers
{
    public class HomeController : Controller
    {
        private IProductRepository productRepository = new ProductRepository();

        public ActionResult Index()
        {
            ViewBag.latestProducts = productRepository.LatestProducts(2);
            ViewBag.featuredProducts = productRepository.FeaturedProducts(2);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}