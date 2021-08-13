using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Properties
{
    class Program
    {
        static void Main(string[] args)
        {
            ItemList itemlist = new ItemList();

            Item s1 = new Item();

            s1.name = "ca heo";
            s1.genre = "to";
            s1.cost = "nhieu tien";
            s1.date = "22/09/2002";

            s1.showItem();


            Item s2 = new Item();

            s2.name = "ca map";
            s2.genre = "to";
            s2.cost = "nhieu tien";
            s2.date = "22/09/2002";

            itemlist.addItem(s2);

            itemlist.addItem(s1);


            itemlist.getAllItem();

            itemlist.searchbyName("ca heo");

            Console.ReadKey();

       
        }
    }
}
