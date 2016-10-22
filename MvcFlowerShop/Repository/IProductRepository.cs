using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcFlowerShop.Repository
{
    public interface IProductRepository
    {
        List<Product> LatestProducts(int n);

        List<Product> LatestProducts();

        List<Product> FeaturedProducts(int n);

        List<Product> SpecialProducts();

        List<Product> RelatedProducts(Product product, int n);

        Product Find(int id);
    }
}
