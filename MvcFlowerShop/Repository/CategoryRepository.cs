using MvcFlowerShop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFlowerShop.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private FlowerDBEntities db = new FlowerDBEntities();

        public Category Find(int id)
        {
            return db.Categories.Find(id);
        }

        public List<Category> FindAll()
        {
            return db.Categories.ToList();
        }
    }
}