using System;
using System.Reflection;

using Db4objects.Db4o;
using Db4objects.Db4o.Config;
using System.Web;

/*
 * ServerModule manages opening and closing of a db4o server:
 * - the server is opened on the first request
 * - the server is closed when the application is offloaded
 */

namespace Blood
{
    public class Db4oServerModule
    {
        // defines the location for the database file
        internal const string DB4O_FILE_NAME = "~\\App_Data\\database.yap";
        // static server variable 
        private static IObjectServer objectServer = null;

        /*
         * Registers an alias for persistent classes namespace and assembly. The current assembly is temporary 
         * and renamed after each recompilation, that is why it can not be used for persistence. An alias name is used 
         * to persist the classes
         */
        public static IConfiguration Configure()
        {
            Assembly assembly = Assembly.GetExecutingAssembly();
            String assemblyName = "Db4objects.StarterKit.Data.*, " + assembly.GetName().ToString().Substring(0, assembly.GetName().ToString().LastIndexOf("Version") - 2);
            IConfiguration configuration = Db4oFactory.Configure();
            configuration.AddAlias(new WildcardAlias("Db4objects.StarterKit.Data.*, Db4oSiteCS2", assemblyName));
            return configuration;
        }
        // end Configure

        /*
         * Opens a server connection to the db4o database on a request
        */
        public static IObjectServer Server
        {
            get
            {
                HttpContext context = HttpContext.Current;
                if (objectServer == null)
                {
                    string dataFile = context.Server.MapPath(DB4O_FILE_NAME);
                    objectServer = Db4oFactory.OpenServer(Configure(), dataFile, 0);
                }
                return objectServer;
            }
        }
        // end Server

        /*
         *  Procedure to close the server connection
         */
        public static void CloseServer()
        {
            if (objectServer != null)
            {
                objectServer.Close();
            }

            objectServer = null;
        }
        // end CloseServer
    }
}