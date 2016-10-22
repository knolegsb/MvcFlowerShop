using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFlowerShop.Repository
{
    public class AccountRepository : IAccountRepository
    {
        private FlowerDBEntities db = new FlowerDBEntities();

        public void Create(Account account)
        {
            db.Accounts.Add(account);
            db.SaveChanges();
        }
    }
}