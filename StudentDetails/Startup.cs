using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudentDetails.Startup))]
namespace StudentDetails
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
