using System;
using System.Collections.Generic;
using hackathonupdated.Subclasses;
using System;
using System.Collections.Generic;
using System.Data;
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

    public partial class CompleteAdoDetails : System.Web.UI.Page
    {
        static string personalAccessToken = "4rm4d2q2wq452n7ce2mqgfj4yyqajoipmez63nvxoveijuphckxq";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]

        public static List<PullReqItems> GetPullRequests()
        {
            DataTable pullrequests;
            ListofPullRequests.pullRequests viewModel = null;
            List<PullReqItems> pullreqdetails = new List<PullReqItems>();
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
            return pullreqdetails;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<workitems> GetWorkItems()
        {
            DataTable dtworkitems;
            ListofWorkItems.WorkItems viewModel = null;
            List<workitems> workdetails = new List<workitems>();
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
            }
            return workdetails;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<commitdetails> GetCommits()
        {
            DataTable commits;
            ListofCommitsResponse.Commits viewModel = null;
            List<commitdetails> commitdetails = new List<commitdetails>();

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
            return commitdetails;
        }
    }
}