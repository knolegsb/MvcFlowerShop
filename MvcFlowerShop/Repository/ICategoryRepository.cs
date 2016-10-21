using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcFlowerShop.Repository
{
    public interface ICategoryRepository
    {
        List<Category> FindAll();

        Category Find(int id);
    }
}
