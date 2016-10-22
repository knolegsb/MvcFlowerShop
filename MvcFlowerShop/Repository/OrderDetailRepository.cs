using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFlowerShop.Repository
{
    public class OrderDetailRepository : IOrderDetailRepository
    {
        private FlowerDBEntities db = new FlowerDBEntities();

        public void Create(OrdersDetail orderDetail)
        {
            this.db.OrdersDetails.Add(orderDetail);
            this.db.SaveChanges();
        }
    }
}