using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hackathonupdated.Subclasses
{
    public class ListofCommitsResponse
    {
        public class Commits : BaseViewModel
        {
            public int count { get; set; }
            public Value[] value { get; set; }
        }

        public class Value
        {
            public string url { get; set; }
            public string comment { get; set; }
            public authrodetails author { get; set; }
            public changecount changecounts { get; set; }
        }
    }

    public class changecount
    {
        public string add { get; set; }
        public string edit { get; set; }
        public string delete { get; set; }
    }

    public class authrodetails
    {
        public string name { get; set; }
        public string email { get; set; }
        public string date { get; set; }
    }
}