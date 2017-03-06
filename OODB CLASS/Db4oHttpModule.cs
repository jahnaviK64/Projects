using System;
using System.IO;
using System.Configuration;
using System.Web;

using Db4objects.Db4o;
using Db4objects.Db4o.Config;

/*
 * Db4oHttpModule makes db4o available for the web-forms. Its main functions:
 * - provide client connection on Web-forms request
 * - ensure clean shut down of the client connection on request end
 */

namespace Blood
{
    public class Db4oHttpModule : IHttpModule
    {
        // keys for the named parameters in Web.config
        internal const string KEY_DB4O_CLIENT = "db4oClient";

        /*
         * Initializing the module
         */
        public void Init(HttpApplication application)
        {
            application.EndRequest += new EventHandler(Application_EndRequest);
        }
        // end Init

        /*
         * Returns an existing client connection to the caller. 
         * If client connection does not exist - it will be created
         */
        public static IObjectContainer Client
        {
            get
            {
                HttpContext context = HttpContext.Current;

                IObjectContainer objectClient = context.Items[KEY_DB4O_CLIENT] as IObjectContainer;

                if (objectClient == null)
                {
                    objectClient = Db4oServerModule.Server.OpenClient();
                    context.Items[KEY_DB4O_CLIENT] = objectClient;
                }

                return objectClient;
            }
        }
        // end Client

        /*
         * Closes db4o client on request end
         */
        private void Application_EndRequest(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;


            IObjectContainer objectClient = context.Items[KEY_DB4O_CLIENT] as IObjectContainer;

            if (objectClient != null)
            {
                objectClient.Close();
            }
            objectClient = null;
            context.Items[KEY_DB4O_CLIENT] = null;
        }
        // end Application_EndRequest

        public void Dispose()
        {
        }
        // end Dispose
    }
}

