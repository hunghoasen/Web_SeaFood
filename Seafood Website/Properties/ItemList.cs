using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Properties
{
    class ItemList
    {
        private List<Item> _ItemList;

        public ItemList()
        {
            _ItemList = new List<Item>();
        }

        public void addItem(Item item)
        {
            _ItemList.Add(item);
        }

        public void getAllItem()
        {
            foreach(Item item in _ItemList)
            {
                item.showItem();
                Console.WriteLine("--------------------------------------------------------------------------------------");
            }

        }

        public void searchbyName(String name)
        {
            foreach(Item item in _ItemList)
            {
                if (item.name.Contains(name))
                {
                    Console.WriteLine("Day la san pham ban muon tim!");
                    item.showItem();
                }
            }
        }
    }
}
