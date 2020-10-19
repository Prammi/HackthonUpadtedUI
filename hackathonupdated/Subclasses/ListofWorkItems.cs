using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hackathonupdated.Subclasses
{
    public class ListofWorkItems
    {
        public class WorkItems : BaseViewModel
        {

            public Value[] value { get; set; }
        }

        public class Value
        {
            public field fields { get; set; }


        }
    }
}