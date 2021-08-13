using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Properties
{
    class Item
    {

        public string name
        {
            get;set;
        }

        public string genre
        {
            get; set;
        }

        public string cost
        {
            get; set;
        }

        public string date
        {
            get; set;
        }

        public Item(string name,string genre,float cost,string date)
        {

        }

        public Item() { }

        public void showItem()
        {
            Console.WriteLine("Thong tin san pham: {0},{1},{2},{3}",name,genre,cost,date);
        }
    }
}
