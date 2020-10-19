using hackathonupdated.Subclasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace hackathonupdated
{
    public partial class Homepage : System.Web.UI.Page
    {
      static  string personalAccessToken = "4rm4d2q2wq452n7ce2mqgfj4yyqajoipmez63nvxoveijuphckxq";

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] files = Directory.GetFiles(System.AppDomain.CurrentDomain.BaseDirectory + "uploads\\");
            if (files.Length > 0)
            {
                DeleteFiles(files);
            }
        }

        private void DeleteFiles(string[] files)
        {

            foreach (var file in files)
            {
                File.Delete(file);
            }
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]

        public static List<Employee> GetEmpList()
        {
            var empList = new List<Employee>()
    {
         new Employee { ID=1, Name="Manas"},
         new Employee { ID=2, Name="Tester"}
    };

            return empList;

        }

        private static int getpullrequestsCount()
        {
            DataTable pullrequests;
            ListofPullRequests.pullRequests viewModel = null;
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(
                    new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic",
                    Convert.ToBase64String(
                        System.Text.ASCIIEncoding.ASCII.GetBytes(
                            string.Format("{0}:{1}", "", personalAccessToken))));

                using (HttpResponseMessage response = client.GetAsync(
                            "https://dev.azure.com/codeletehackathon/secondproject/_apis/git/repositories/506f6d44-0a42-4a10-9f75-c89c450c3740/pullrequests?api-version=6.0").Result)
                {
                    response.EnsureSuccessStatusCode();
                    viewModel = response.Content.ReadAsAsync<ListofPullRequests.pullRequests>().Result;
                    List<PullReqItems> pullreqdetails = new List<PullReqItems>();
                    foreach (var vm in viewModel.value)
                    {
                        PullReqItems cm = new PullReqItems();
                        cm.reponame = vm.repository.name;
                        cm.creationDate = vm.creationDate;
                        cm.description = vm.description;
                        cm.createdBy = vm.createdby.displayName;
                        cm.title = vm.title;
                        pullreqdetails.Add(cm);
                    }
                    pullrequests = Datatable.ToDataTable<PullReqItems>(pullreqdetails);
                }
            }
              return pullrequests.Rows.Count; ;
        }

        public static int getworkitemsCount()
        {
            DataTable dtworkitems;
            try
            {
                ListofWorkItems.WorkItems viewModel = null;
                using (HttpClient client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Accept.Add(
                        new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic",
                        Convert.ToBase64String(
                            System.Text.ASCIIEncoding.ASCII.GetBytes(
                                string.Format("{0}:{1}", "", personalAccessToken))));

                    using (HttpResponseMessage response = client.GetAsync(
                                "https://dev.azure.com/codeletehackathon/secondproject/_apis/wit/workitems?ids=4,6,7&api-version=6.0").Result)
                    {
                        response.EnsureSuccessStatusCode();
                        viewModel = response.Content.ReadAsAsync<ListofWorkItems.WorkItems>().Result;
                        List<workitems> workdetails = new List<workitems>();
                        foreach (var vm in viewModel.value)
                        {
                            workitems wd = new workitems();
                            wd.AreaPath = vm.fields.AreaPath;
                            wd.WorkItemType = vm.fields.WorkItemType;
                            wd.CreatedDate = vm.fields.CreatedDate;
                            wd.Title = vm.fields.Title;
                            wd.Description = vm.fields.Description;
                            workdetails.Add(wd);
                        }
                        dtworkitems = Datatable.ToDataTable<workitems>(workdetails);
                    }
                    return dtworkitems.Rows.Count;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        public static int getCommitsCount()
        {
            DataTable commits;
            ListofCommitsResponse.Commits viewModel = null;
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(
                    new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic",
                    Convert.ToBase64String(
                        System.Text.ASCIIEncoding.ASCII.GetBytes(
                            string.Format("{0}:{1}", "", personalAccessToken))));

                using (HttpResponseMessage response = client.GetAsync(
                            "https://dev.azure.com/codeletehackathon/secondproject/_apis/git/repositories/506f6d44-0a42-4a10-9f75-c89c450c3740/commits?api-version=6.0").Result)
                {
                    response.EnsureSuccessStatusCode();
                    viewModel = response.Content.ReadAsAsync<ListofCommitsResponse.Commits>().Result;
                    List<commitdetails> commitdetails = new List<commitdetails>();
                    int i = 0;
                    foreach (var vm in viewModel.value)
                    {
                        if (i < 5)
                        {
                            commitdetails cm = new commitdetails();
                            cm.add = vm.changecounts.add;
                            cm.edit = vm.changecounts.edit;
                            cm.delete = vm.changecounts.delete;
                            cm.comment = vm.comment;
                            cm.author = vm.author.name;
                            cm.date = vm.author.date;
                            commitdetails.Add(cm);
                        }
                        i++;
                    }
                    commits = Datatable.ToDataTable<commitdetails>(commitdetails);
                }
            }
            return commits.Rows.Count;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static  ADODetails GetADODetailsSummary()
        {
            ADODetails _ado = new ADODetails();
            _ado.codeCommits = getworkitemsCount();
                _ado.pullRequests = getpullrequestsCount();
            _ado.workItems = getCommitsCount();
            return _ado;

        }
    }
}