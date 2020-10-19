using Amazon.Comprehend;
using Amazon.Comprehend.Model;
using Limilabs.Mail;
using Limilabs.Mail.MSG;
using Microsoft.Azure.CognitiveServices.Language.LUIS.Runtime;
using Microsoft.Azure.CognitiveServices.Language.TextAnalytics;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;

namespace hackathonupdated
{

    public partial class Recognition : System.Web.UI.Page
    {
        private static readonly string key = "a6378e51c21345869b96fb7d41b754d0";
        private static readonly string endpoint = "https://textanalyticsresourcecodelete.cognitiveservices.azure.com/";
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<RecognitionDetails> GetRecognitionDetails()
        {
            List<RecognitionDetails> _lrecognitionDetails = new List<RecognitionDetails>();
            _lrecognitionDetails = BindRecognitionDetails();
            return _lrecognitionDetails;

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
            foreach (var adj in adjectives)
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



            var values = new object[2];
            values[0] = "Key Phrases";
            values[1] = str.Substring(0, str.Length - 1);
            return str.Substring(0, str.Length - 1);
        }

        private static List<RecognitionDetails> BindRecognitionDetails()
        {
            List<RecognitionDetails> _lrecognitionDetails = new List<RecognitionDetails>();

            RecognitionDetails _recognitionDetails = new RecognitionDetails();
            _recognitionDetails.Content = "Thank you for all your hard work and efforts on PHT. You are doing a great job and thank you";
            _recognitionDetails.Project = "PHT";
            _recognitionDetails.KeyPhrases = "hard work / great job";
            _recognitionDetails.Nominatedby = "Sunitha Rani";
            _recognitionDetails.TaggingList = "pramod";
            _recognitionDetails.Year = "2019";
            _lrecognitionDetails.Add(_recognitionDetails);


            RecognitionDetails _recognitionDetails2 = new RecognitionDetails();
            _recognitionDetails2.Content = "Mohit has gone above and beyond to provide the best client service possible. The client service we have provided as Deloitte would not be possible without his contribution. Your high quality delivery with in a short duration of time for GPD release has been Appreciated by the client.";
            _recognitionDetails2.Project = "GDP";
            _recognitionDetails2.KeyPhrases = "best client service possible / high quality delivery / short duration of time";
            _recognitionDetails2.Nominatedby = "Sunitha Rani";
            _recognitionDetails2.TaggingList = "rpathak@deloitte.com/salla@deloitte.com/salla@deloitte.com";
            _recognitionDetails2.Year = "2020";
            _lrecognitionDetails.Add(_recognitionDetails2);

            RecognitionDetails _recognitionDetails3 = new RecognitionDetails();
            _recognitionDetails3.Content = "Josh had a number of things that unfortunately hit all at once. He worked through everything in a professional manner. I want to recognize the quality and amount of work he did in that intense time. He not only led a DSTART scuccessfully but went above and beyond in his research, development of a pre-read, and virtual facilitation of a convening with national experts in immunization and race, she has stayed committed in a meaningful way, helping orient new teams to the topic and leading proposals. The impact of the work she produced had on the client positioned us for significant follow-on (e.g., from $95K in work to a new $1M+ contract).";
            _recognitionDetails3.Project = "DSTART";
            _recognitionDetails3.KeyPhrases = "professional manner / intense time / pre-read / virtual facilitation / national experts / meaningful way / orient new teams / significant follow-on / orient new teams ";
            _recognitionDetails3.Nominatedby = "Ganesh Subramainan";
            _recognitionDetails3.TaggingList = "rpathak@deloitte.com/salla@deloitte.com/satishbabu@deloitte.com";
            _recognitionDetails3.Year = "2020";
            _lrecognitionDetails.Add(_recognitionDetails3);


            RecognitionDetails _recognitionDetails4 = new RecognitionDetails();
            _recognitionDetails4.Content = "Reward for outstanding service at a global S/4 HANA transformation, driving change and adoption for multiple workstreams in a highly-complex environment during a long-term assignment. also preventing escalation at FA when the client wasn't able to use templates to rationalize their item and vendor masters. David's hard work can be taken for granted as he quietly balances the client need with our teams capabilities. While our client should be taking ownership of our solution, it still falls to David to cover the areas they still have not taken on. In addition, David must work continuously with our team to help them achieve the quality that they are capable of.";
            _recognitionDetails4.Project = "global S/4 HANA ";
            _recognitionDetails4.KeyPhrases = "outstanding service / global S / multiple workstreams / complex environment / long-term assignment / David's hard work ";
            _recognitionDetails4.Nominatedby = "Sampath";
            _recognitionDetails4.TaggingList = "rpathak@deloitte.com/salla@deloitte.com/satishbabu@deloitte.com";
            _recognitionDetails4.Year = "2020";
            _lrecognitionDetails.Add(_recognitionDetails4);

            RecognitionDetails _recognitionDetails5 = new RecognitionDetails();
            _recognitionDetails5.Content = "Wick has been delivering solid work on the engagement. More importantly, he is demonstrating her commitment to the success of this important contract on a daily basis and can always be relied upon. Wick’s work ethic is exemplary. He never balks at taking on challenging tasks or learning new skills. He routinely challenges himself to ratchet up his efficiencies and improve the quality of his work in TOD. Not only TOD he was successfully leading PHT also. The ownership he exhibits in consistently going above and beyond to bring in deliverables on or ahead of schedule is an inspiration to his team members. He is always willing to share his knowledge and collaborate with his team. ";
            _recognitionDetails5.Project = "TOD / PHT";
            _recognitionDetails5.KeyPhrases = "solid work / important contract / daily basis / new skills ";
            _recognitionDetails5.Nominatedby = "Sampath";
            _recognitionDetails5.TaggingList = "rpathak@deloitte.com/salla@deloitte.com/satishbabu@deloitte.com";
            _recognitionDetails5.Year = "2020";
            _lrecognitionDetails.Add(_recognitionDetails5);

            string[] files = Directory.GetFiles(System.AppDomain.CurrentDomain.BaseDirectory + "uploads\\");
            if (files.Length > 0)
            {                
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
                            _lrecognitionDetails.Add(
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
            }
            return _lrecognitionDetails;
        }
    }
}