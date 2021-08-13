using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Seafood_Website.Models
{
    public class ShoppingCart
    {
        public List<ItemDetailModel> items = new List<ItemDetailModel>();


        public int AddtoCart(ItemDetailModel item)
        {
            bool found = false;
            //check cart null
            foreach(ItemDetailModel i in items)
            {
                if(i.PDetail.categoryID == item.PDetail.categoryID)
                {
                    i.Quantily += item.Quantily;
                    found = true;
                }
            }
            if (!found)
            {
                items.Add(item);
            }

            return items.Count;
        }

        public double getTotal()
        {
            double total = 0;
            foreach(ItemDetailModel i in items)
            {
                total += i.PDetail.price * i.Quantily;
            }
            return total; 
        }

        public List<ItemDetailModel> getAllItems()
        {
            return items;
        }
    }
}