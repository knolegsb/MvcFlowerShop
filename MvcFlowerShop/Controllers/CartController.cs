using MvcFlowerShop.Models;
using MvcFlowerShop.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcFlowerShop.Controllers
{
    public class CartController : Controller
    {
        private IProductRepository productRepository = new ProductRepository();
        private IOrderRepository orderRepository = new OrderRepository();
        private IOrderDetailRepository orderDetailRepository = new OrderDetailRepository();

        public ActionResult Index()
        {
            return View("Index");
        }

        public ActionResult Buy(int id)
        {
            if (Session["cart"] == null)
            {
                List<Item> cart = new List<Item>();
                cart.Add(new Models.Item()
                {
                    Product = productRepository.Find(id),
                    Quantity = 1
                });
                Session["cart"] = cart;
            }
            else
            {
                List<Item> cart = (List<Item>)Session["cart"];
                int index = isExists(id);
                if (index == -1)
                {
                    cart.Add(new Item()
                    {
                        Product = productRepository.Find(id),
                        Quantity = 1
                    });
                }
                else
                {
                    cart[index].Quantity = cart[index].Quantity + 1;
                }             
                Session["cart"] = cart;
            }
            return View("Index");
        }

        private int isExists(int id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if(cart[i].Product.Id == id)
                {
                    return i;
                }
            }
            return -1;
        }

        public ActionResult Delete(int id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            cart.RemoveAt(id);
            Session["cart"] = cart;
            return View("Index");
        }

        public ActionResult Checkout(int id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("MyAccount", "Account");
            }
            else
            {
                List<Item> cart = (List<Item>)Session["cart"];

                // Save Order
                Order order = new MvcFlowerShop.Order();
                order.CreationDate = DateTime.Now;
                order.Name = "New Order";
                order.Payment = "PayPal";
                order.Status = true;
                order.Username = Session["username"].ToString();
                int orderId = orderRepository.Create(order);

                // Save Order Detail
                foreach(var item in cart)
                {
                    OrdersDetail ordersDetail = new OrdersDetail();
                    ordersDetail.OrdersId = orderId;
                    ordersDetail.ProductId = item.Product.Id;
                    ordersDetail.Price = item.Product.Price;
                    ordersDetail.Quantity = item.Quantity;
                    orderDetailRepository.Create(ordersDetail);
                }

                // Remove Cart
                Session.Remove("cart");

                return View("Thanks");
            }
            
        }
    }
}