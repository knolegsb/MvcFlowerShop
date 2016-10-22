using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFlowerShop.Repository
{
    public class ProductRepository : IProductRepository
    {
        private FlowerDBEntities db = new FlowerDBEntities();

        public List<Product> FeaturedProducts(int n)
        {
            return db.Products.Where(p => p.Specials == true).OrderByDescending(p => p.Id).Take(n).ToList();
        }

        public Product Find(int id)
        {
            return db.Products.Find(id);
        }

        public List<Product> LatestProducts()
        {
            return db.Products.OrderByDescending(p => p.Id).ToList();
        }

        public List<Product> LatestProducts(int n)
        {
            return db.Products.OrderByDescending(p => p.Id).Take(n).ToList();
        }

        public List<Product> RelatedProducts(Product product, int n)
        {
            return db.Products.Where(p => p.Category_Id == product.Category_Id && p.Id != product.Id).Take(n).ToList();
        }

        public List<Product> SpecialProducts()
        {
            return db.Products.Where(p => p.Specials == true).ToList();
        }
    }
}