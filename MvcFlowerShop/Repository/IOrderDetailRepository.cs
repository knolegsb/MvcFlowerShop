using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcFlowerShop.Repository
{
    public interface IOrderDetailRepository
    {
        void Create(OrdersDetail orderDetail);
    }
}
