using Amazon.Comprehend;
using Amazon.Comprehend.Model;
using Limilabs.Mail;
using Limilabs.Mail.MSG;
using Microsoft.Azure.CognitiveServices.Language.LUIS.Runtime;
using Microsoft.Azure.CognitiveServices.Language.TextAnalytics;
using Microsoft.TeamFoundation.SourceControl.WebApi;
using Microsoft.VisualStudio.Services.Common;
using Microsoft.VisualStudio.Services.WebApi;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace hackathonupdated
{
    public partial class FileUpload : System.Web.UI.Page
    {
        private static readonly string key = "a6378e51c21345869b96fb7d41b754d0";
        private static readonly string endpoint = "https://textanalyticsresourcecodelete.cognitiveservices.azure.com/";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<RecognitionDetails> Upload()
        {
            List<RecognitionDetails> _recognitionDetailsList = new List<RecognitionDetails>();

            string[] files = Directory.GetFiles(System.AppDomain.CurrentDomain.BaseDirectory + "uploads\\");
           for (int i = 0; i < files.Length; i++)
            {
                string fname = files[i];//System.AppDomain.CurrentDomain.BaseDirectory + "uploads\\" + filenames[0];
                using (MsgConverter converter = new MsgConverter(fname))
                {
                    if (converter.Type == MsgType.Note)
                    {
                        IMail email = converter.CreateMessage();
                        Console.WriteLine("Subject: {0}", email.Subject);
                        Console.WriteLine("Sender name: {0}", email.Sender.Name);
                        Console.WriteLine("Sender address: {0}", email.Sender.Address);
                        string Mailbody = email.GetBodyAsText();

                        string _keyphrases = getKeyPhrases(Mailbody);
                        string _cclist = getCCList(email);
                        string _project = GetProjectsList(Mailbody);

                        _recognitionDetailsList.Add(
                            new RecognitionDetails
                            {
                                Nominatedby = "Sunitha",
                                Project = _project,
                                KeyPhrases = _keyphrases,
                                Year = "2020",
                                Content = Mailbody,
                                TaggingList = _cclist
                            });

                    }
                }


            }
            return _recognitionDetailsList;
        }

        private static string GetProjectsList(string mailbody)
        {
            //  AmazonComprehendClient comprehendClient = new AmazonComprehendClient(Amazon.RegionEndpoint.USEast1);

            //DetectEntitiesRequest   detectEntityRequest = new DetectEntitiesRequest()
            //  {
            //      Text="Thank you for all the hard work PHT project.",
            //      LanguageCode = "en",
            //      EndpointArn= "arn:aws:comprehend:us-east-1:410906949359:entity-recognizer-endpoint/{{endpoint Name}}"
            //};
            //  DetectEntitiesResponse detectEntityResponse = comprehendClient.DetectEntities(detectEntityRequest);

            //  List<string> lProjects = new List<string>();
            string strProjects = string.Empty;
            //  foreach (Entity kp in detectEntityResponse.Entities)
            //  {
            //      lProjects.Add(kp.Text);
            //      strProjects = strProjects + ',' + kp.Text;
            //  }
            strProjects = ",Thank it Forward";
            var values = new object[2];
            values[0] = "Projects Details";
            if (strProjects.Length > 0)
            {
                values[1] = strProjects.Substring(1);
            }
            else
            {
                values[1] = "No Projects Found ";
            }
            return strProjects.Substring(1);
        }
        private static string getCCList(IMail email)
        {
            string ccadd = "";
            List<string> ccAddress = new List<string>();
            IList<Limilabs.Mail.Headers.MailAddress> cc = email.Cc;

            if (cc.Count > 0)
            {
                foreach (var ccMember in cc)
                {
                    ccadd = ccadd + ' ' + ccMember.Name + ',';
                }

                return ccadd.Substring(0, ccadd.Length - 1);
            }
            else
            {
                return " - ";
            }
        }

        static TextAnalyticsClient AuthenticateClient()
        {
            ApiKeyServiceClientCredentials credentials = new ApiKeyServiceClientCredentials(key);
            TextAnalyticsClient client = new TextAnalyticsClient(credentials)
            {
                Endpoint = endpoint
            };
            return client;
        }
        public static string getKeyPhrases(string mailbody)
        {
            var client = AuthenticateClient();
            var result = client.KeyPhrases(mailbody);

            List<string> lkeyPhrases = new List<string>();
            string strKeyPhrases = string.Empty;
            foreach (string kp in result.KeyPhrases)
            {
                lkeyPhrases.Add(kp);
            }

            AmazonComprehendClient comprehendClient = new AmazonComprehendClient(Amazon.RegionEndpoint.USWest2);

            DetectSyntaxRequest dsr = new DetectSyntaxRequest()
            {
                Text = mailbody,
                LanguageCode = "en"
            };
            DetectSyntaxResponse dsrsp = comprehendClient.DetectSyntax(dsr);
            List<string> adjectives = new List<string>();
            List<string> finalKeyPhrases = new List<string>();
            foreach (SyntaxToken kp in dsrsp.SyntaxTokens)
            {
                if (kp.PartOfSpeech.Tag.Equals("ADJ"))
                {
                    adjectives.Add(kp.Text);
                }
            }
            foreach (var adj in adjectives.Distinct())
            {
                foreach (var phs in lkeyPhrases)
                {
                    if (phs.Contains(adj))
                    {
                        finalKeyPhrases.Add(phs);
                    }

                }
            }
            string str = "";
            foreach (var fnlKeyPhr in finalKeyPhrases)
            {
                str = str + ' ' + fnlKeyPhr + ' ' + '/';
            }

            return str.Substring(0, str.Length - 1);
        }
    }
}