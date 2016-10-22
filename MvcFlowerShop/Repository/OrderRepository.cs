using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFlowerShop.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private FlowerDBEntities db = new FlowerDBEntities();
        public int Create(Order order)
        {
            this.db.Orders.Add(order);
            this.db.SaveChanges();
            return order.Id;
        }
    }
}