using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Seafood_Website.Models
{
    public class ItemDetailModel
    {
        public Productdetail PDetail
        {
            get; set;
        }

        public int Quantily { get; set; }

        public Productdetail Top4product { get; set; }
        
    }
}